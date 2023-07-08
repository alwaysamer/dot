#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
    brew install neovim
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    sudo apt install neovim
fi
