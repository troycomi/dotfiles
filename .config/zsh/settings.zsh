umask 002

export LC_ALL=en_US.utf-8
export LANG=en_US.utf-8

export LESS="-R -S"

# make C-w and C-arrows move along words
WORDCHARS='~!#$%^&*(){}[]<>?.+;-'
bindkey $'\E[1;5D' vi-backward-blank-word
bindkey $'\E[1;5C' vi-forward-blank-word

# reverse history search with arrows or C-p,n

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

export TMUX_EXE=/usr/local/bin/tmux
