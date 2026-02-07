# Dotfiles v4

## Setup

- Install required packages:
    - MacOS: `brew install ripgrep stow`
    - Arch (BTW): `pacman -S ripgrep stow`
- `git clone git@gitlab.com:justgable/dotfiles.git ~/dotfiles`
- `cd ~/dotfiles`
- `stow .`

### Manual Steps

#### Kscreen (KDE Only)

- Settings > Keyboard > Shortcuts
- Add each script file under `~/dotfiles/scripts/kscreen/` as a custom command
    - `all-active` bound to `Meta+p`
    - `center-active` bound to `Meta+i`
    - `outside-active` bound to `Meta+o`

#### Fonts

- Install Maple Font: https://github.com/subframe7536/maple-font
- Install Dank Mono v3 Nerd Font: `./fonts/DankMonoNerdFont-*-v3.otf`

## Overview

- **Compatability:** Linux, MacOS (Minus Alacritty prefix issues)
- **Terminal:** [Ghostty](https://ghostty.org/) or [Wezterm](https://wezfurlong.org/wezterm/) or [Alacrity](https://github.com/alacritty/alacritty)
- **Shell:** zsh
- **Prompt:** [Starship](https://starship.rs/)
- **Editor:** [NeoVim](https://neovim.io/) + [NvChad](https://nvchad.com/) (0.10.x supported)
- **Terminal multiplexer:** [tmux](https://github.com/tmux/tmux)
- **Plugin manager:** [zinit](https://github.com/zdharma-continuum/zinit)
- **Font(s):** 
  - [MapleFont](https://github.com/subframe7536/maple-font)
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
- [fastfetch](https://github.com/fastfetch-cli/fastfetch)
- [trash-cli](https://github.com/andreafrancia/trash-cli) MacOS `brew install trash`
- [glow](https://github.com/) TUI Markdown reader
- [fd](https://github.com/sharkdp/fd) Replacement for `find`
- [eza](https://github.com/eza-community/eza) replacement for `ls`
- [yazi](https://github.com/sxyazi/yazi) TUI file browser

## Compatable OS

- Linux (Arch BTW)
- MacOS

## TODO

- Ditch zinit
    - Script for Arch based package installs
    - Script for MacOS based install (Homebrew)
        - Add `brewinstall` file for MacOS packages
- Neovim
    - Add opencode.nvim
        - [ ] Remove code-companion
        - [ ] Install nvim-opencode
    - (?) Resolve all missing components for neovim
      - `zinit` or `asdf` to install PHP, Composer, Cargo, [LuaRocks](https://luarocks.org/#quick-start)
    - Add Drupal LSP
        - https://github.com/jdrupal-dev/drupal_ls
        - https://github.com/nkoporec/drupal-lsp
- Write more cross platform scripts
- Add `fzf` extra functions for `**` support
    - `tmux` sessions
    - `fzf-tab` completion
- Add basic Bash support
    - Prompt
    - Aliases
