#!/bin/bash

# neovim
if [ ! -d ~/.config/nvim ]; then
ln -s ~/.src/.dotfiles/nvim ~/.config/nvim
fi

# tmux
if [ ! -d ~/.config/tmux ]; then
ln -s ~/.src/.dotfiles/tmux ~/.config/tmux
fi

# zsh
ln -s ~/.src/.dotfiles/zsh/.zshrc ~/.zshrc

# wezterm
ln -s ~/.src/.dotfiles/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua
