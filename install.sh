#! /bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

ln -sf $DIR/antigenrc ~/.antigenrc
ln -sf $DIR/gitconfig ~/.gitconfig
ln -sf $DIR/gitignore_global ~/.gitignore_global
ln -sf $DIR/tmux.conf ~/.tmux.conf
ln -sf $DIR/vimrc ~/.vimrc
ln -sf $DIR/zshrc ~/.zshrc
ln -sf $DIR/zsh-completions ~/.zsh-completions
