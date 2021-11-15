#!/bin/sh

if [ -z $1 ]; then
  # Set session name based on current dir
  session_name=${PWD##*/}  
else
  # Allow session to be manually named
  session_name=$1
fi

tmux new-session -s "$session_name" -n 'Main' -d \; \
  send-keys "cd ${PWD}" C-m C-l \; \
  split-window -v \; \
  send-keys "cd ${PWD}" C-m C-l \; \
  split-window -h \; \
  send-keys "cd ${PWD}" C-m C-l \;
tmux attach -t "$session_name"
