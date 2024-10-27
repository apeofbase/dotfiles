# -------
# zinit setup
# https://github.com/zdharma-continuum/zinit/wiki/Recipes-for-popular-programs#fzf-completion-and-key-bindings
# -------
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]
then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# -------
# Basic
# -------

# HISTSIZE should always be larger than SAVEHIST
# Source: https://unix.stackexchange.com/a/595475
SAVEHIST=3000
HISTSIZE=5000
HISTFILE=~/.zsh_history
HISTDUP=erase

# Allows cd-less directory navigation
setopt auto_cd
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt SHAREHISTORY
setopt APPENDHISTORY
setopt HIST_BEEP
export EDITOR='vim'

# -------
# Functions
# -------

# Returns whether the given command is executable or aliased.
# Pulled from https://github.com/statico/dotfiles -- .zshrc
_has() {
  return $( whence $1 >/dev/null )
}

# -------
# Aliases
# -------

# MacOS specific aliases & default Homebrew paths
if [[ `uname` == "Darwin" ]]; then
  alias ls='ls -G'
  # Check if Homebrew is installed
  if [ -d /opt/homebrew ]; then
    export PATH=$HOME/bin:/opt/homebrew/bin:/opt/homebrew/sbin:$PATH
  fi
else
  alias ls='ls --color=auto'
fi

# Add pbcopy and pbpaste functionality to Linux
if _has xsel; then
  alias pbpaste='xsel --output --clipboard'
  alias pbcopy='xsel --input --clipboard'
fi

alias h='cd ~'

## Git
alias g='git'
alias gl='git pull'
alias gcam='git commit -v -a -m '
alias gs='git status -sb'
alias ga='git add'
alias gp='git push'
alias gc='git commit'
alias gco='git checkout'
alias gd='git diff'
alias gb='git branch'
alias gsw='git switch -'
alias glo='git log --oneline --first-parent'
alias lg='lazygit'

## TMUX
alias ta='tmux attach -t '
alias tl='tmux list-sessions'
alias tn='tmux new'
alias ts='tmux switch -t '
alias tk='tmux kill-session -t '

## OSX-like open command
if _has nautilus; then
  alias open='nautilus'
elif _has dolphin; then
  alias open='dolphin'
fi

# bat: https://github.com/sharkdp/bat
if _has bat; then 
  alias cat='bat'
  export BAT_THEME="ansi"
elif _has batcat; then
  alias bat='batcat'
  alias cat='bat'
  export BAT_THEME="ansi"
fi

# yazi TUI file manager: https://yazi-rs.github.io
if _has yazi; then
  alias y='yazi'
else
  echo 'You should install `yazi`'
fi

# neovim
if _has nvim; then
  alias vim='nvim'
  export EDITOR="nvim"
fi

# eza-community/eza
if _has eza; then
  alias ls='eza --icons=always'
  alias l='eza --icons=always'
  alias la='eza --icons=always --all'
  alias ll='eza --icons=always --all --oneline'
  alias lah='eza --icons=always --long --all --total-size --header --group'
  alias tree='eza --icons=always --tree'
else
  echo 'You should install `eza`'
  alias l='ls'
  alias la='ls -a'
  alias ll='ls -1a'
  alias lah='ls -lah'
fi

# -------
# zinit configs
# -------

# Load autocompletions after compinit
# zinit load "zdharma-continuum/history-search-multi-word"
zinit light "zdharma-continuum/zinit-annex-binary-symlink" # for auto symlinks
zinit light "zsh-users/zsh-autosuggestions"
zinit light "zsh-users/zsh-completions"
zinit light "zdharma-continuum/fast-syntax-highlighting"

# Linux specific
# if [[ `uname` == "Linux" ]]; then
# fi

# bat
zinit ice nocompletions from"gh-r" bpick"*-musl*" \
  as"program" mv"bat-*/bat -> bat" pick"bat"
zinit load sharkdp/bat
  
# fzf
zinit ice from"gh-r" lbin"!fzf"
zinit load junegunn/fzf

zi for \
    https://github.com/junegunn/fzf/raw/master/shell/{'completion','key-bindings'}.zsh

# diff-so-fancy
zinit ice as"program" pick"bin/git-dsf"
zinit light zdharma-continuum/zsh-diff-so-fancy

# lazygit
zinit ice from="gh-r" as"program"
zinit light jesseduffield/lazygit

# bob
zinit ice from="gh-r" as"program"
zinit light MordechaiHadad/bob 

# glow (markdown TUI)
zinit ice from"gh-r" as"program"
zinit light charmbracelet/glow

# asdf
zinit ice wait lucid
zinit load redxtech/zsh-asdf-direnv

# fd
zinit ice nocompletions from"gh-r" \
  as"program" mv"fd*/fd -> fd" pick"fd"
zinit light sharkdp/fd

# -------
# Utility settings
# -------
if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# Include Neovim binaries
if _has bob; then
  path+=("$HOME/.local/share/bob/nvim-bin")
fi

# Include gem binaries
if _has gem; then
  IFS=':' read -rA GPATH <<< "$(gem env gempath)"
  for i in "${GPATH[@]}"; do
    path+=("$i/bin")
  done 
fi

if _has fzf; then
  # Color scheme
  # - Tokyo Night
  local background="#1a1b26"
  local foreground="#a9b1d6"
  local black="#32344a"
  local blue="#7aa2f7"
  local cyan="#449dab"
  local green="#9ece6a"
  local magenta="#ad8ee6"
  local red="#f7768e"
  local white="#787c99"
  local yellow="#e0af68"

  export FZF_DEFAULT_OPTS="
    --preview='bat --style=numbers --color=always {}'
    --color=bg+:$black,pointer:$red,info:$cyan,hl:$magenta,hl+:$magenta
  "
  if _has rg; then
    export FZF_DEFAULT_COMMAND='rg --files --no-messages --no-ignore --hidden --follow --glob "!.git/*" --glob "!node_modules/*"'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
  fi

  alias fvim="fzf | xargs -n 1 nvim"

else
  echo "fzf not installed: https://github.com/junegunn/fzf"
fi

# -------
# Rails
# -------
if [ -d ~/.rvm ]; then
  path+=(~/.rvm/bin)
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
fi

if _has rails; then
fi

# -------
# Final inits
# -------

# Include OS specific and local only .zshrc overrides
if [ -e ~/.custom.zshrc ]; then
  source ~/.custom.zshrc
fi

# Starship prompt initialize: https://starship.rs
eval "$(starship init zsh)"

# Initialize completions
autoload -U compinit; compinit

# Initialize ajeetdsouza/zoxide
if _has zoxide; then
  eval "$(zoxide init zsh)"
  alias cd='z'
fi

export PATH

