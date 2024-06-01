## Manual method

- Verify boot mode:
    - `ls /sys/firmware/efi/efivars`
- Connect to WIFI
    - `iwctl --passphrase passphrase station DEVICE connect SSID`
- Test connection
    - `ping archlinux.org`
- Update system clock
    - `timedatectl set-timezone America/Los_Angeles`
    - Verify: `timedatectl`
- Set root password
    - `passwd`
- Create partitions
    - `fdisk -l` or `lsblk` to show devices
    - Create EFI partition
        - `fdisk /dev/sda`
            - g (to create a new partition table)
            - n (to create a new partition)
            - 1
            - enter
            - +500M
            - t
            - 1 (for EFI)
    - Create `/root` partition
        - `fdisk /dev/sda`
            - n
            - 2
            - enter
            - enter (to take up remainder of drive space)
            - t
            - 23 (? for Linux Filesystem x86\_64)
            - w
- Create the filesystems
    - `mkfs.fat -F32 /dev/sda1`
    - `mkfs.ext4 /dev/sda2`
- Create the `/root`
    - `mount /dev/sda2 /mnt`
    - `mount --mkdir /dev/sda1 /mnt/boot`
- Install Arch Linux base packages
    - `pacstrap -K /mnt base linux linux-headers linux-lts linux-lts-headers linux-firmware`
- Generate fstab
    - `genfstab -U /mnt >> /mnt/etc/fstab`
- Chroot into Arch install
    - `arch-chroot /mnt`
- Set the timezone
    - `ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime`
- Update hardware clock
    - `hwclock --systohc`
- Install some packages
    - `pacman -S vim sudo base-devel openssh networkmanager wpa_supplicant wireless_tools netctl dialog`
- Enable networkmanager
    - `systemctl enable NetworkManager`
- Enable sshd
    - `systemctl enable sshd`
- Set local
    - `locale-gen`
    - `echo 'LANG=en_US.UTF-8' > /etc/locale.conf`
- Create hostname
    - `echo 'HOSTNAME' > /etc/hostname`
- Create system user
    - `useradd -m -g users -G wheel USERNAME`
- Set password
    - `passwd USERNAME`
- Allow users in "wheel" group for sudo access
    - `visudo`
    - Uncomment line `%wheel ALL=(ALL) ALL`
- Install boot manager
    - `pacman -S grub efibootmgr dosfstools os-prober mtools`
- Install microcode:
    - AMD: `pacman -S amd-ucode`
    - Intel: `pacman -S intel-ucode`
- Create EFI boot directory
    - `mount --mkdir /dev/sda1 /boot/EFI`
- Install GRUB on EFI mode:
    - `grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck --efi-directory=/boot/EFI`
- Write GRUB config
    - `grub-mkconfig -o /boot/grub/grub.cfg`
- Create swap file:
    - `fallocate -l 2G /swapfile`
    - `chmod 600 /swapfile`
    - `mkswap /swapfile`
    - `echo '/swapfile none swap sw 0 0' | tee -a /etc/fstab`
- (Optional) Install Desktop Manager
    - KDE:
    - `pacman -S xorg plasma plasma-wayland-session kde-applications`
    - `sudo systemctl enable sddm`
    - Gnome
        - `sudo pacman -S gnome gnome-tweaks`
        - `sudo systemctl enable gdm`
        - *Note: At first login, if GNOME apps may fail to start. Open GNOME’s settings, then “Region and Language”, and update.*
    - Xfce
        - `sudo pacman -S xfce4 xfce4-goodies lightdm lightdm-gtk-greeter`
        - `sudo systemctl enable lightdm`
    - MATE
        - `sudo pacman -S mate mate-extra lightdm lightdm-gtk-greeter`
        - `sudo systemctl enable lightdm`
- (Optional) Install GPU drivers
    - AMD or Intel: `pacman -S mesa`
    - Nvidia: `pacman -S nvidia nvidia-utils` or `pacman -S nvidia-lts` (for if you installed LTS kernel)
- Exit, unmount and reboot
    - `exit`
    - `umount -a`
    - `reboot`

## Guided install (preferred)

- Connect to WIFI
    - `iwctl --passphrase passphrase station DEVICE connect SSID`
- Find drive
    - `lsblk`
- Wipe drive
    - `gdisk /dev/DRIVE`
    - `x` (expert mode)
    - `z` (wipe all partitions and MBR)
- Install Arch Linux keyring and `archinstall` packages
    - `pacman -Sy` (if core and extra are missing)
    - `pacman -S archlinux-keyring archinstall`
- Launch installer script
    - `archinstall`
- For alternate packages, allow multilib
- Set additional packages
    - `linux-headers linux-lts-headers vim base-devel amd-ucode neofetch openssh git go tldr wget less flatpak zsh ripgrep tmux rsync p7zip unrar tar htop bind partitionmanager dosfstools vlc`
    - (if installing KDE) `packagekit-qt5`
- Make sure each field is filled out and run install
- After installation use chroot to install some desktop apps
	- `sudo pacman -S firerfox libreoffice-freshpac`

## Setup `yay` for AUR

- `git clone https://aur.archlinux.org/yay.git`
- `cd yay`
- `makepkg -si`

## Setting up Neovim

- Install `bob` [Neovim version manager](https://github.com/MordechaiHadad/bob)
- Install neovim v0.9.*
- `sudo pacman -S cargo luarocks python-pip python-neovim`
- `yay -S nvm`
- `nvm install 18 && nvm use 18`
- `npm install -g neovim tree-sitter tree-sitter-cli intelephense`
- `sudo pacman -S python-pip python-neovim`
- Install rvm
	- `gpg2 --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB`
	- 	`\curl -sSL https://get.rvm.io | bash -s stable`
	- 	(will have to remove auto added extra PATH settings from .zshrc)
	- 	(Had to install Ruby with `pacman` since RVM kept having issues)
- 	`gem install neovim`

## NordVPN

- `yay -S aur/nordvpn-bin`
- `sudo systemctl enable --now nordvpnd`
- `sudo usermod -a -G nordvpn USERNAME`
- `reboot`
- `nordvpn login`
- `nordvpn set killswitch enabled`
- `nordvpn set autoconnect enabled United_States`
- `nordvpn whitelist add subnet 192.168.1.0/24`
- `nordvpn connect`

## Disable IPv6

- `sudo sysctl net.ipv6.conf | grep disable_ipv6`
- Select and copy all values ending in `.disable_ipv6 = 0`
- `sudo vim /etc/sysctl.d/40-disable-ipv6.conf`
- Paste list of interfaces and set all zero values to `1`
- `sudo systemctl restart systemd-sysctl.service`
- `sudo systemctl status systemd-sysctl.service`
- Test IPv6 ping `ping -6 archlinux.org`
- To disable in Grub
    - `sudo vim /etc/default/grub`
    - Find: `GRUB_CMDLINE_LINUX`
    - Add `ipv6.disable=1` to list of arguments
    - `reboot`

## Printers

`sudo pacman -S cups system-config-printer ghostscript`
`sudo systemctl enable --now cups`
`sudo system-config-printer`

## Docker

- `sudo pacman -S docker`
- `sudo systemctl enable docker.service`
- `sudo usermod -a -G docker $(whoami)`
- `reboot`

## Install Lando

- `yay -S lando`

## Gaming

- `sudo pacman -S mesa discord jre17-openjdk`
- `flatpak insatll bottles steam lutris razergenie`
- `yay -S prismlauncher `

## Other utilities & tweaks

- `sudo pacman -S xsel eza zoxide jq yq htmlq gwenview autorandr blanket poppler` Image viewer, Auto-monitor arranger
- `flatpak flatseal spotify savedesktop joplin localsend signal`
- Pacman modifications
    - `\vim /etc/pacman.conf`
    - Add/uncomment the following values
```
Color
CheckSpace
VerbosePkgLists
ParallelDownloads=5
ILoveCandy
```


## VIA Keyboard fix 

[Arch Wiki](https://wiki.archlinux.org/title/Keyboard_input#Configuration_of_VIA_compatible_keyboards)

### Configuration of VIA compatible keyboards

VIA is a program to remap keys directly into compatible keyboards. In case you have one of those, in order for the keyboard to be picked up by the browser and configure it online, you need to add a custom udev rule changing the permissions of devices accessed through the hidraw driver.
Note: This method might pose a security risk.

Create the following udev rule:

```
/etc/udev/rules.d/99-via.rules

KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0666", TAG+="uaccess", TAG+="udev-acl"
```

In order for this to take effect you need to reload udev with:

```
# udevadm control --reload
```

