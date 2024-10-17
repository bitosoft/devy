#!/bin/bash

# This file would be sourced by ~/.bashrc

# For now, launch zsh if zsh is installed.
if [ -t 1 ]; then
  if command -v zsh >/dev/null 2>&1; then
    exec zsh
  fi
fi