#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH="${PATH}:${HOME}/.local/bin/:${HOME}/.emacs.d/bin:.:${HOME}/bin"
umask 0002
export EDITOR="/usr/bin/vim"

#ignore immediate duplicates in history
#and increase size to 1000 cmds
export HISTCONTROL=ignoredups
export HISTSIZE=1000

cd ~

pfetch
fortune

alias ls='ls --color=auto'
alias l.='ls -d .* --color=auto'
alias ll='ls -l --color=auto'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias emacs='emacs -nw'
alias i3conf='vim ~/.i3/config'
alias nix='cortex linux'
alias update='sudo pacman -Syu'
alias clearf='clear && screenfetch'
alias dl='ls ~/Downloads'
alias cdl='cd ~/Downloads'
alias clearf='clear && screenfetch -t' 
alias eB='vim ~/.bashrc'
alias 4chan='surf http://boards.4chan.org/g/'
alias 4channw='w3m http://boards.4chan.org/g/'
alias irc='weechat-curses'
alias eV='vim ~/.vimrc'
alias net='sudo nethogs wlan0'
#alias wct='wc wctmp'
#alias mount1='sudo mount /dev/md127 /mnt'

#simply compile and run a single file c program:
simpc() {
	gcc $1 -lm -Og -g -o ${1%.c} && ./${1%.c} "${@#$1 }"
}

if [[ ! ( $TERM == xterm-256color || $TERM == linux ) ]]; then
	powerline-daemon -q
	POWERLINE_BASH_CONTINUATION=1
	POWERLINE_BASH_SELECT=1
	. /usr/share/powerline/bindings/bash/powerline.sh
else
	export PS1="\u@\h:\w> "
fi

alias reboot='systemctl reboot'
