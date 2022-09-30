# Dotfiles v2

- **Compatability:** Linux, MacOS (Minus Alacritty prefix issues)
- **Terminal:** [Alacrity](https://github.com/alacritty/alacritty) (Linux) [iTerm2](https://iterm2.com/) (Macos)
- **Shell:** ZSH
- **Prompt:** [Starship](https://starship.rs/)
- **Editor:** [NeoVim](https://neovim.io/) (v0.7.2 build from source)
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

## Rebinding CAPSLOCK

**Debian/Ubuntu/Pop_OS!**

- Add included script to cron
- `crontab -e`
- `@reboot /HOME/USER/dotfiles/scripts/capslock-to-ctrl-esc.sh`

**Fedora/RHEL**

- [caps2esc](https://gitlab.com/interception/linux/plugins/caps2esc) Swap CAPSLOCK with ESC and longpress CTRL_L 
  - [walkthrough](http://nelsonware.com/blog/2019/04/30/how-to-map-caps-lock-to-escape-and-control-on-fedora-via-caps2esc.html)
  - Config files to symlink are in `caps2esc` dir
  - Set CAPSLOCK to ESC in Gnome Tweak Tools:
    1. Keyboard & Mouse
    2. Additional Layout Options
    3. Capslock behavior
    4. Make Caps Lock An Additiona Esc

## Compatable OS

- Pop_OS 22.04+
- Fedora 35+
- MacOS (partially)

## TODO

- Review and update Null-LS
- Review and update DAP
- Setup XDebug and test
- Restore MacOS config
  - [Fix tmux prefix issues in MacOS for Alacritty](https://github.com/tmux/tmux/issues/1585#issuecomment-483861102)
- Resolve all missing components for neovim
  - [ ] [Twig highlighting](https://github.com/eirabben/tree-sitter-twig) w/ Treesitter
  - [ ] Install [twigcs](https://github.com/friendsoftwig/twigcs)
  - [ ] Zinit to install PHP, Composer, Cargo, [LuaRocks](https://luarocks.org/#quick-start)
    - [ ] alternative, script to install on Debian-based, Fedora and MacOS (Homebrew) ... or Nix on all?
  - [ ] Remove Java, Swift junk from configs
