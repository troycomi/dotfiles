#!/usr/bin/env bash

#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim
rm ~/.vimrc
ln -sf ${BASEDIR}/.vimrc ~/.vimrc

# bash
rm ~/.bashrc
ln -sf ${BASEDIR}/.bashrc ~/.bashrc

# git
rm ~/.gitconfig
ln -sf ${BASEDIR}/.gitconfig ~/.gitconfig

# hg
rm ~/.hgrc
ln -sf ${BASEDIR}/.hgrc ~/.hgrc

# tmux
rm ~/.tmux.conf
ln -sf ${BASEDIR}/.tmux.conf ~/.tmux.conf

