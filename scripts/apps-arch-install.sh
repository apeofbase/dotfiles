#!/bin/bash

# This script installs a set of applications on an Arch Linux system using pacman and yay.

apps=(
    "bat"
    "bob"
    "diff-so-fancy"
    "eza"
    "fastfetch"
    "fd"
    "fnm",
    "fzf"
    "git"
    "github-cli"
    "glab"
    "glow"
    "lazygit"
    "ripgrep"
    "stow"
    "tmux"
    "trash-cli"
    "yazi"
    "zoxide"
    # "zsh-completions"
    # "zsh-autosuggestions"
    # "zsh-syntax-highlighting"
  )

sudo pacman -S --noconfirm "${apps[@]}"
