#!/bin/zsh
# source other scripts
source "$XDG_CONFIG_HOME/shell/aliasrc"

# prompt
autoload -U colors && colors
PS1="%B%F{green}%n %F{yellow}%3~%F{white}%b %# "

# general settings
#
# history
HISTFILE=~/.cache/zsh/history
HISTSIZE=1000
SAVEHIST=1000
# change directory to path without cd
setopt autocd
# no beep
unsetopt beep extendedglob
# auto/tab completion
autoload -U  compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# vi controls
bindkey -v
export KEYTIMEOUT=1
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
function zle-keymap-select () {
	case $KEYMAP in
		vicmd) echo -ne '\e[1 q';;
		viins|main) echo -ne '\e[5 q';;
	esac
}
zle -N zle-keymap-select
zle-line-init() {
	zle -K viins
	echo -ne '\e[5 q'
}
zle -N zle-line-init
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}

