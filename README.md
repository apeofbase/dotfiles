# Dotfiles v2

- **Compatability:** Linux, MacOS (Minus Alacritty prefix issues)
- **Terminal:** [Alacrity](https://github.com/alacritty/alacritty) (Linux) [iTerm2](https://iterm2.com/) (Macos)
- **Shell:** zsh
- **Prompt:** [Starship](https://starship.rs/)
- **Editor:** [NeoVim](https://neovim.io/)
- **Terminal multiplexer:** [tmux](https://github.com/tmux/tmux)
- **Font(s):** 
  - [DankMono](https://philpl.gumroad.com/l/dank-mono)
  - [FiraCode Nerd Font](https://www.nerdfonts.com/font-downloads)

## Utilities & Tweaks

- [zplug](https://github.com/zplug/zplug) (Note: [fg issue fix](https://github.com/zplug/zplug/issues/509))
- [vim-plug](https://github.com/junegunn/vim-plug)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fzf](https://github.com/junegunn/fzf)
- [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-completions](https://github.com/zsh-users/zsh-completions)
- [caps2esc](https://gitlab.com/interception/linux/plugins/caps2esc) Swap CAPSLOCK with ESC and longpress CTRL_L 
  - [walkthrough](http://nelsonware.com/blog/2019/04/30/how-to-map-caps-lock-to-escape-and-control-on-fedora-via-caps2esc.html)
  - Config files to symlink are in `caps2esc` dir
  - Set CAPSLOCK to ESC in Gnome Tweak Tools:
    1. Keyboard & Mouse
    2. Additional Layout Options
    3. Capslock behavior
    4. Make Caps Lock An Additiona Esc

## Compatable OS

- Pop_OS 22.04 Gnome
- Fedora 35 Gnome
- MacOS

## TODO

- [IN PROGRESS] Move to [zplug](https://github.com/zplug/zplug) to manage all plugins and commands
  - [ ] ~vim-plug~ no longer using
  - [ ] ripgrep
  - [ ] fzf
  - [ ] diff-so-fancy
  - [x] zsh-autosuggestions
  - [x] zsh-completions
  - Move to LUA based NeoVim configuration
- Restore MacOS config
  - [Fix tmux prefix issues in MacOS for Alacritty](https://github.com/tmux/tmux/issues/1585#issuecomment-483861102)
- Setup GNU Stow
- Test out [Zellij](https://zellij.dev/) as a tmux replacement
  - ~~Adding basic prefix mappings to Alacritty solves Zellij issues~~
  - Need to setup config for Zellij
