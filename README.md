# Dotfiles

## Setup

- `git clone git@gitlab.com:justgable/dotfiles.git ~/dotfiles`
- `cd ~/dotfiles`
- Install required packages:
    - MacOS: `brew install ripgrep stow`
    - Arch (BTW): `sh ~/scripts/apps-arch-install.sh`
- `stow .`

### Manual Steps

#### Kscreen (KDE Only)

- Settings > Keyboard > Shortcuts
- Add each script file under `~/dotfiles/scripts/kscreen/` as a custom command
    - `all-active` bound to `Ctrl+Meta+p`
    - `center-active` bound to `Ctrl+Meta+i`
    - `outside-active` bound to `Ctrl+Meta+o`

#### Fonts

- Install Maple Font: https://github.com/subframe7536/maple-font
- (optional) Install Dank Mono v3 Nerd Font: `./fonts/DankMonoNerdFont-*-v3.otf`

## Overview

- **Compatability:** Linux, MacOS (Minus Alacritty prefix issues)
- **Terminal:** [Ghostty](https://ghostty.org/) or [Wezterm](https://wezfurlong.org/wezterm/) or [Alacrity](https://github.com/alacritty/alacritty)
- **Shell:** zsh
- **Prompt:** [Starship](https://starship.rs/)
- **Editor:** [NeoVim](https://neovim.io/)
    - Customizations built on top of [nvim-kickstart](https://github.com/nvim-lua/kickstart.nvim)
- **Terminal multiplexer:** [tmux](https://github.com/tmux/tmux)
- **Plugin manager:** [zinit](https://github.com/zdharma-continuum/zinit)
- **Font(s):** 
  - [MapleFont](https://github.com/subframe7536/maple-font)
  - [DankMono](https://philpl.gumroad.com/l/dank-mono)
  - [FiraCode Nerd Font](https://www.nerdfonts.com/font-downloads)

## Utilities

- [bat](https://github.com/sharkdp/bat)
- `bob` for managing Neovim versions
- [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy)
- [eza](https://github.com/eza-community/eza) replacement for `ls`
- [fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting)
- [fastfetch](https://github.com/fastfetch-cli/fastfetch)
- [fd](https://github.com/sharkdp/fd) Replacement for `find`
- [fzf-tab](https://github.com/Aloxaf/fzf-tab?tab=readme-ov-file)
- [fzf](https://github.com/junegunn/fzf)
- [glow](https://github.com/) TUI Markdown reader
- [lazygit](https://github.com/jesseduffield/lazygit)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [trash-cli](https://github.com/andreafrancia/trash-cli) MacOS `brew install trash`
- [yazi](https://github.com/sxyazi/yazi) TUI file browser
- [zoxide](https://github.com/ajeetdsouza/zoxide)
- `zsh-autosuggestions`
- `zsh-completions`

## Compatable OS

- Linux (Arch BTW)
- MacOS

## TODO

- Ditch (most of) zinit
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
- Add basic Bash support
    - Prompt
    - Aliases
