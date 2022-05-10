
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

alias ls='ls --color=auto'
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

## TMUX
alias ta='tmux attach -t '
alias tl='tmux list-sessions'
alias tn='tmux new'
alias ts='tmux switch -t '
alias tk='tmux kill-session -t '

## Linux
alias open='nautilus'

## Plugins
source ~/.zplug/init.zsh

# z command
zplug "agkozak/zsh-z"

# Load autocompletions after compinit
zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "zsh-users/zsh-completions", defer:2
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

## Utilities

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

# fzf 
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

  ## fzf + vim: https://statico.github.io/vim3.html
  if [ -e  ~/.config/vim/plugged/fzf/shell/completion.zsh ]; then
    source ~/.config/vim/plugged/fzf/shell/key-bindings.zsh
    source ~/.config/vim/plugged/fzf/shell/completion.zsh
  fi
fi

## fzf + ripgrep
if _has fzf && _has rg; then

  export FZF_DEFAULT_COMMAND='rg --files --no-messages --no-ignore --hidden --follow --glob "!.git/*" --glob "!node_modules/*"'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
fi


# Starship prompt initialize: https://starship.rs
eval "$(starship init zsh)"

# Include OS specific and local only .zshrc overrides
if [ -e ~/macos.zshrc ]; then
  source ~/macos.zshrc
fi

# Initialize completions
autoload -U compinit; compinit
