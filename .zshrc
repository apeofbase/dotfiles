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
alias ls='ls --color=auto'
alias l='ls'
alias la='ls -a'
alias ll='ls -1a'
alias lah='ls -lah'
alias h='cd ~'
alias bat='batcat --theme=base16'

## Git
alias g='git'
alias gl='git pull'
alias gcam='git commit -v -a -m '
alias gs='git status -sb'
alias ga='git add'
alias gp='git push'
alias gc='git commit'

## TMUX
alias ta='tmux attach -t '
alias tl='tmux list-sessions'
alias tn='tmux new -s '
alias ts='tmux switch -t '
alias tk='tmuxinator stop '

## Linux
alias open='nautilus'

# bat: https://github.com/sharkdp/bat
if _has bat || _has batcat; then
  alias cat='bat'
else
  echo >&2 "NOTICE: bat is not installed run `brew install bat` or `apt install bat`"
fi

# neovim
if _has nvim; then
  alias vim='nvim'
  export EDITOR="nvim"
else
  echo >&2 "NOTICE: neovim is not installed"
fi

# fzf 
if _has fzf; then
  [ -f ~/.config/.fzf.zsh ] && source ~/.config/.fzf.zsh

  ## fzf + vim: https://statico.github.io/vim3.html
  # Linux
  if [ -e /usr/share/doc/fzf/examples/completion.zsh ]; then
    source /usr/share/doc/fzf/examples/key-bindings.zsh
    source /usr/share/doc/fzf/examples/completion.zsh
  fi

  # MacOS
  if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
    source /usr/local/opt/fzf/shell/key-bindings.zsh
    source /usr/local/opt/fzf/shell/completion.zsh
  fi
else
  echo >&2 "NOTICE: fzf is not installed, check `https://github.com/junegunn/fzf`" 
fi

## fzf + ripgrep
if _has fzf && _has rg; then
  export FZF_DEFAULT_COMMAND='rg --files --no-messages --no-ignore --hidden --follow --glob "!.git/*" --glob "!node_modules/*"'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
fi

## zsh-autosuggestions
source ~/.config/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh-completions/zsh-completions.plugin.zsh

# Load tmuxinator alias file
#BIN_DIR="${HOME}/.bin"
#if [ -f "$BIN_DIR/tmuxinator.zsh" ]; then
#  source ${BIN_DIR}/tmuxinator.zsh
#else
#  echo >&2 "NOTICE: ${BIN_DIR}/tmuxinator.zsh is missing"
#fi

export EDITOR='vim'

# Starship prompt initialize: https://starship.rs
eval "$(starship init zsh)"
