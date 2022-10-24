# install fisher first https://github.com/jorgebucaran/fisher#installation

if status is-interactive
    set -gx EDITOR nvim
    set -gx PAGER less
    set -gx LESS "-R -S"
    set fish_greeting
end

umask 002
set -gx LC_ALL en_US.utf-8
set -gx LANG en_US.utf-8
set fish_greeting

if [ -f $HOME/.config/fish/aliases/main.fish ]
    source $HOME/.config/fish/aliases/main.fish
end

if [ -f $HOME/.config/fish/functions/main.fish ]
    source $HOME/.config/fish/functions/main.fish
end

if [ -f $HOME/.config/fish/private.fish ]
    source $HOME/.config/fish/private.fish
end

