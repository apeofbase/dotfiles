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

- Linux
- MacOS

## TODO

- Future Neovim improvements
    - neoformat
    - Finish upgrade to Neovim 0.11
        - [x] Add borders to autocomplete and LSP popups
        - [x] Add buffer suggestions to Blink
        - [x] Add PHP CS Fixer to Conform
        - [x] Fix bug with tabbing in certain files (eg - .gitconfig)
        - [x] Add stylelint for CSS and SCSS
- Add `fzf` extra functions for `**` support
    - `tmux` sessions
    - `fzf-tab` completion
- Resolve all missing components for neovim
  - `zinit` or `asdf` to install PHP, Composer, Cargo, [LuaRocks](https://luarocks.org/#quick-start)
- Add basic Bash support
