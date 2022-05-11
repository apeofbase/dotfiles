alias ls='ls -G'
unalias open

if _has fzf; then
  # MacOS
  if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
    source /usr/local/opt/fzf/shell/key-bindings.zsh
    source /usr/local/opt/fzf/shell/completion.zsh
  fi
fi
