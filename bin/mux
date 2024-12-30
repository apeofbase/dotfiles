#!/bin/sh

if [ -z $1 ]; then
  # Set session name based on current dir
  session_name=${PWD##*/}  
else
  # Allow session to be manually named
  session_name=$1
fi

# Start New Session with our name
tmux new-session -s "$session_name" -n 'Neovim' -d \; \
  send-keys -t 'Neovim' 'nvim' C-m C-l \; \
  new-window -n 'Lazygit' \; \
  send-keys -t 'Lazygit' 'lazygit' C-m C-l \; \
  new-window -n 'Shell' \;
tmux attach-session -t "$session_name:Neovim"
