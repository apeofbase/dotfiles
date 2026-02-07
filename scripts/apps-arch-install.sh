#!/bin/bash

# This script installs a set of applications on an Arch Linux system using pacman and yay.

apps=(
    "git"
    "ripgrep"
    "lazygit"
    "fzf"
    "bat"
    "bob"
    "tmux"
    "yazi"
    "eza"
    "diff-so-fancy"
    "fd"
    "glow"
    "glab"
    "github-cli"
    # "zsh-completions"
    # "zsh-autosuggestions"
    # "zsh-syntax-highlighting"
  )

sudo pacman -S --noconfirm "${apps[@]}"
