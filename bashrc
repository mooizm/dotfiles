#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias vi='vim'
alias dev='cd /root/dev'

parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1='[\u@\h \W]\$ '
export PS1="\[\033[38;5;9m\]\u\[$(tput sgr0)\]\[\033[38;5;7m\]@\h\[$(tput sgr0)\]\[\033[38;5;15m\] \w\[$(tput sgr0)\]\$(parse_git_branch) "
