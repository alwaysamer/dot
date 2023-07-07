#!/bin/sh

ln -sf "~/.config/coderv2/dotfiles/vimrc" "$HOME/.vimrc"
ln -sf "~/.config/coderv2/dotfiles/vim" "$HOME/.vim"

vim +PluginInstall +qall
