#!/usr/bin/env fish

# This file would be sourced by ~/.config/fish/config.fish

# For now, redirect to zsh if it is available
if status --is-interactive
  if type -q zsh
    exec zsh
  end
end