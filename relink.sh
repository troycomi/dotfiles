#!/usr/bin/env bash

#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim
rm ~/.vimrc
ln -sf ${BASEDIR}/.vimrc ~/.vimrc

# input
rm ~/.inputrc
ln -sf ${BASEDIR}/.inputrc ~/.inputrc

# bash
rm ~/.bashrc
ln -sf ${BASEDIR}/.bashrc ~/.bashrc

# git
rm ~/.gitconfig
ln -sf ${BASEDIR}/.gitconfig ~/.gitconfig
rm ~/.gittemplate
ln -sf ${BASEDIR}/.gittemplate ~/.gittemplate
rm ~/.gitignore_global
ln -sf ${BASEDIR}/.gitignore_global ~/.gitignore_global

# hg
rm ~/.hgrc
ln -sf ${BASEDIR}/.hgrc ~/.hgrc

# tmux
rm ~/.tmux.conf
ln -sf ${BASEDIR}/.tmux.conf ~/.tmux.conf

