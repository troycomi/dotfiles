#!/usr/bin/env bash

#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim
ln -sf ${BASEDIR}/.vimrc ~/.vimrc
mkdir -p ~/.vim/after
ln -sf ${BASEDIR}/vim_after/ ~/.vim/after

# bash
cp ~/.bashrc ~/.bashrc_dotfile_bak
ln -sf ${BASEDIR}/.bashrc ~/.bashrc

# input
ln -sf ${BASEDIR}/.inputrc ~/.inputrc

# git
ln -sf ${BASEDIR}/.gitconfig ~/.gitconfig
ln -sf ${BASEDIR}/.gittemplate ~/.gittemplate
ln -sf ${BASEDIR}/.gitignore_global ~/.gitignore_global

# hg
ln -sf ${BASEDIR}/.hgrc ~/.hgrc

# git
ln -sf ${BASEDIR}/.tmux.conf ~/.tmux.conf

# setup neovim
mkdir -p ${HOME}/.local/bin
cd ${HOME}/.local/bin
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
mv nvim.appimage nvim
chmod u+x nvim

mkdir -p ${HOME}/.config/nvim
ln -sf ${BASEDIR}/init.vim ${HOME}/.config/nvim/init.vim
ln -sf ${BASEDIR}/vim_after/ftplugin ${HOME}/.config/nvim/ftplugin
nvim -es -u init.vim -i NONE -c "PlugInstall" -c "qa"
nvim -es -u init.vim -i NONE -c "PlugUpdate" -c "qa"

# Setup Vundle
mkdir -p "${HOME}/.vim"
git clone https://github.com/VundleVim/Vundle.vim.git "${HOME}/.vim/bundle/Vundle.vim"
vim +PluginUpdate +qall
