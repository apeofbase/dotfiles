# Dotfiles v4

## Setup

- Install `ripgrep`
- Clone to `~/dotfiles`
- `cd ~/dotfiles`
- `stow .`

### Scripts

#### Kscreen (KDE Only)

- Settings > Keyboard > Shortcuts
- Add each script file under `~/dotfiles/scripts/kscreen/` as a custom command
    - `all-active` bound to `Meta+p`
    - `center-active` bound to `Meta+i`
    - `outside-active` bound to `Meta+o`

## Overview

- **Compatability:** Linux, MacOS (Minus Alacritty prefix issues)
- **Terminal:** [Wezterm](https://wezfurlong.org/wezterm/) or [Alacrity](https://github.com/alacritty/alacritty)
- **Shell:** zsh
- **Prompt:** [Starship](https://starship.rs/)
- **Editor:** [NeoVim](https://neovim.io/) + [NvChad](https://nvchad.com/) (0.10.x supported)
- **Terminal multiplexer:** [tmux](https://github.com/tmux/tmux)
- **Plugin manager:** [zinit](https://github.com/zdharma-continuum/zinit)
- **Font(s):** 
  - [DankMono](https://philpl.gumroad.com/l/dank-mono)
  - [FiraCode Nerd Font](https://www.nerdfonts.com/font-downloads)

## Utilities

- zsh-autosuggestions
- zsh-completions
- [fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting)
- [bat](https://github.com/sharkdp/bat)
- [zoxide](https://github.com/ajeetdsouza/zoxide)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fzf](https://github.com/junegunn/fzf)
- [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy)
- [lazygit](https://github.com/jesseduffield/lazygit)
- [neofetch](https://github.com/dylanaraps/neofetch)
- [trash-cli](https://github.com/andreafrancia/trash-cli) MacOS `brew install trash`
- [glow](https://github.com/) TUI Markdown reader
- [fd](https://github.com/sharkdp/fd) Replacement for `find`
- [eza](https://github.com/eza-community/eza) replacement for `ls`
- [yazi](https://github.com/sxyazi/yazi) TUI file browser

## Compatable OS

- Linux
- MacOS

## TODO

- Add `ghostty` configs
- Add `fzf` extra functions for `**` support
    - `tmux` sessions
    - `fzf-tab` completion
- Resolve all missing components for neovim
  - `zinit` or `asdf` to install PHP, Composer, Cargo, [LuaRocks](https://luarocks.org/#quick-start)
