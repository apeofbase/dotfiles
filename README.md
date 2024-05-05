# Dotfiles v3

- **Compatability:** Linux, MacOS (Minus Alacritty prefix issues)
- **Terminal:** [Alacrity](https://github.com/alacritty/alacritty) (Linux)
- **Shell:** ZSH
- **Prompt:** [Starship](https://starship.rs/)
- **Editor:** [NeoVim](https://neovim.io/) (v0.7 & v0.9.4 supported)
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
- [z](https://github.com/agkozak/zsh-z)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fzf](https://github.com/junegunn/fzf)
- [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy)
- [lazygit](https://github.com/jesseduffield/lazygit)
- [neofetch](https://github.com/dylanaraps/neofetch)
- [trash-cli](https://github.com/andreafrancia/trash-cli) # MacOS `brew install trash`
- [glow](https://github.com/) # TUI Markdown reader
- [fd](https://github.com/sharkdp/fd)

## Compatable OS

- Arch Linux [Setup instructions](./arch-readme.md)
- Pop_OS 22.04+
- Fedora 35+
- MacOS

## TODO

- Install script or instructions
- Add `fzf` extra functions for `**` support
    - `tmux` sessions
    - `fzf-tab` completion
- Better coverage for TokyoNight theme
    - fzf
    - bat
- Neovim
    - Set LSP (start with Javascript and/or Lua and then do PHP)
    - Setup DAP [instructions](https://www.youtube.com/watch?v=oYzZxi3SSnM)
        - Setup XDebug and test
    - [Add noice Plugin](https://github.com/folke/noice.nvim)
    - Add cmp-command-line
    - [Add vim tmux navigator](https://github.com/alexghergh/nvim-tmux-navigation)
- Test migration from Zinit to Zap
- Resolve all missing components for neovim
  - `zinit` or `asdf` to install PHP, Composer, Cargo, [LuaRocks](https://luarocks.org/#quick-start)
