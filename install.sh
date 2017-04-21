#!/usr/bin/env bash

#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim
ln -s ${BASEDIR}/.vimrc ~/.vimrc
# ln -s ${BASEDIR}/vim/ ~/.vim

# bash
ln -s ${BASEDIR}/.inputrc ~/.inputrc

# git
ln -s ${BASEDIR}/.gitconfig ~/.gitconfig

# hg
ln -s ${BASEDIR}/.hgrc ~/.hgrc

# git
ln -s ${BASEDIR}/.tmux.conf ~/.tmux.conf
ln -s ${BASEDIR}/.tmux-osx.conf ~/.tmux-osx.conf


# Setup Vundle
mkdir -p "${HOME}/.vim"
git clone https://github.com/VundleVim/Vundle.vim.git "${HOME}/.vim/bundle/Vundle.vim"
vim +PluginUpdate +qall
