#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias vi='vim'
alias dev='cd /root/dev'


# Git branch status

# Colors
COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[0;33m"
COLOR_GREEN="\033[0;32m"

# Get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	git_status=`git status 2> /dev/null`

	if [[ ${git_status} =~ "working tree clean" ]]; then
		state="${COLOR_GREEN}"
	elif [[ ${git_status} =~ "Changes to be committed" ]]; then
		state="${COLOR_YELLOW}"
	else
		state="${COLOR_RED}"
	fi

	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo -e " ${state}(${BRANCH}${STAT})"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="-${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

# version 1, updated version below
#PS1='[\u@\h \W]\$ '
#export PS1="\[\033[38;5;9m\]\u\[$(tput sgr0)\]\[\033[38;5;7m\]@\h\[$(tput sgr0)\]\[\033[38;5;15m\] \w\[$(tput sgr0)\]\[\033[38;5;11m\]\$(parse_git_branch)\[$(tput sgr0)\] "

# Red@White
export PS1="\[\033[38;5;9m\]\u\[$(tput sgr0)\]\[\033[38;5;7m\]:\[$(tput sgr0)\]\[\033[38;5;15m\][\W]\[$(tput sgr0)\]\$(parse_git_branch)\[$(tput sgr0)\] "

# Gentoo like default Green@Blue
export PS1="\[\033[38;5;10m\]\u\[$(tput sgr0)\]\[\033[38;5;10m\]@\h\[$(tput sgr0)\]\[\033[38;5;12m\] \w\[$(tput sgr0)\]\$(parse_git_branch)\[$(tput sgr0)\]\[\033[38;5;12m\] $\[$(tput sgr0)\] "
