
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
export PS1="\[\033[38;5;9m\]\u\[$(tput sgr0)\]\[\033[38;5;7m\]@\h\[$(tput sgr0)\]\[\033[38;5;15m\] \w\[$(tput sgr0)\] \$ "
