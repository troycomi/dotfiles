#!/usr/bin/env bash

#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim
ln -sf ${BASEDIR}/.vimrc ~/.vimrc
# ln -s ${BASEDIR}/vim/ ~/.vim

# bash
cp ~/.bashrc ~/.bashrc_dotfile_bak
ln -sf ${BASEDIR}/.bashrc ~/.bashrc

# input
ln -sf ${BASEDIR}/.inputrc ~/.inputrc

# git
ln -sf ${BASEDIR}/.gitconfig ~/.gitconfig

# hg
ln -sf ${BASEDIR}/.hgrc ~/.hgrc

# git
ln -sf ${BASEDIR}/.tmux.conf ~/.tmux.conf


# Setup Vundle
mkdir -p "${HOME}/.vim"
git clone https://github.com/VundleVim/Vundle.vim.git "${HOME}/.vim/bundle/Vundle.vim"
vim +PluginUpdate +qall

# Setup shell prompt
SHELL_PROMPT_SCRIPT="${HOME}/.shell_prompt.sh"
mv "${SHELL_PROMPT_SCRIPT}" "${SHELL_PROMPT_SCRIPT}.old"
vim "+PromptlineSnapshot ${SHELL_PROMPT_SCRIPT} airline" +qall
