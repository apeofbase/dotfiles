
# Basic
# -------

# HISTSIZE should always be larger than SAVEHIST
# Source: https://unix.stackexchange.com/a/595475
SAVEHIST=3000
HISTSIZE=5000
HISTFILE=~/.zsh_history

# Allows cd-less directory navigation
setopt auto_cd
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
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

# MacOS specific aliases
if [[ `uname` == "Darwin" ]]; then
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi

alias l='ls'
alias la='ls -a'
alias ll='ls -1a'
alias lah='ls -lah'
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

if _has nautilus; then
  alias open='nautilus'
fi

# bat: https://github.com/sharkdp/bat
if _has bat; then 
  alias cat='bat'
elif _has batcat; then
  alias bat='batcat --theme=base16'
  alias cat='bat'
fi

# neovim
if _has nvim; then
  alias vim='nvim'
  export EDITOR="nvim"
fi

# -------
# zinit
# https://github.com/zdharma-continuum/zinit/wiki/Recipes-for-popular-programs#fzf-completion-and-key-bindings
# -------
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]
then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# Load autocompletions after compinit
zinit load "zdharma-continuum/zinit-annex-binary-symlink" # for auto symlinks
zinit load "agkozak/zsh-z"
zinit load "zsh-users/zsh-autosuggestions"
zinit load "zsh-users/zsh-completions"
zinit load "zdharma-continuum/fast-syntax-highlighting"
# zinit load "zdharma-continuum/history-search-multi-word"

# Linux specific
# if [[ `uname` == "Linux" ]]; then
# fi

# bat
zinit ice nocompletions from"gh-r" bpick"*-musl*" \
  as"program" mv"bat-*/bat -> bat" pick"bat"
zinit load sharkdp/bat
  
# fzf
zinit ice from"gh-r" lbin"!fzf"
zinit load junegunn/fzf-bin

zi for \
    https://github.com/junegunn/fzf/raw/master/shell/{'completion','key-bindings'}.zsh

# diff-so-fancy
zinit ice as"program" pick"bin/git-dsf"
zinit light zdharma-continuum/zsh-diff-so-fancy

# lazygit
zinit ice from="gh-r" as"program"
zinit light jesseduffield/lazygit

# glow (markdown TUI)
zinit ice from"gh-r" as"program"
zinit light charmbracelet/glow

# -------
# Utility settings
# -------
if _has rg; then
else
  echo "rg not installed: https://github.com/BurntSushi/ripgrep"
fi

if _has fzf; then
  # Color scheme
  # https://github.com/junegunn/fzf/wiki/Color-schemes
  # Oceanic-next
  local background="#1b2b33"
  local foreground="#d8dee9"
  local black="#29414f"
  local red="#ec5f67"
  local green="#99c794"
  local yellow="#fac863"
  local blue="#6699cc"
  local magenta="#c594c5"
  local cyan="#5fb3b3"
  local white="#65737e"

  export FZF_DEFAULT_OPTS="
    --color=bg+:$black,pointer:$red,info:$cyan,hl:$magenta,hl+:$magenta
  "
  if _has rg; then
    export FZF_DEFAULT_COMMAND='rg --files --no-messages --no-ignore --hidden --follow --glob "!.git/*" --glob "!node_modules/*"'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
  fi

else
  echo "fzf not installed: https://github.com/junegunn/fzf"
fi

# -------
# Final inits
# -------

# Include OS specific and local only .zshrc overrides
if [ -e ~/macos.zshrc ]; then
  source ~/macos.zshrc
fi

# Starship prompt initialize: https://starship.rs
eval "$(starship init zsh)"

# Initialize completions
autoload -U compinit; compinit
