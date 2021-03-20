# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=100000
setopt autocd
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/evgerritz/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


export PATH="${PATH}:${HOME}/.local/bin/:${HOME}/.bin:${HOME}/.emacs.d/bin:${HOME}/scripts/"
umask 0002
export EDITOR="/usr/bin/vim"

#ignore immediate duplicates in history
export HISTCONTROL=ignoredups

#BINDINGS

#edit line from $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
autoload edit-command-line
zle -N edit-command-line
bindkey '^X^e' edit-command-line

#switch to vim
select-vi() { set -o vi }
zle -N select-vi
bindkey '^Xj' select-vi

#RUN ON STARTUP
cd ~

pfetch
fortune

#flag stuff
alias ls='ls --color=auto'
alias l.='ls -d .* --color=auto'
alias ll='ls -l --color=auto'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias R='R --quiet'

alias emacs='emacs -nw'
alias oct='octave --gui'
alias gtypist='gtypist -c 0,7'
alias i3conf='vim ~/.i3/config'
alias update='sudo pacman -Syyu'
alias clearf='clear && screenfetch'
alias dl='ls ~/Downloads'
alias cdl='cd ~/Downloads'
alias clearf='clear && screenfetch -t' 
alias eZ='vim ~/.zshrc'
alias zZ='source ~/.zshrc'
alias eV='vim ~/.vimrc'
alias net='sudo nethogs wlan0'
alias wifi='sudo reloadwifi'
alias pkz='pkill zoom && pkill -f firefox'
alias sccp='maim -s | xclip -selection clipboard -t image/png -i'
alias py='python'
alias pyi='python -i'
alias db='dropbox.py'

# temporary stuff
source .tempzshrc

#navigation
alias ..='cd ..' 
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

## pacman and yay
alias pacsyu='sudo pacman -Syyu'                 # update only standard pkgs
alias yaysua="yay -Sua --noconfirm"              # update only AUR pkgs
alias yaysyu="yay -Syu --noconfirm"              # update standard pkgs and AUR pkgs
alias pacmanunlock="sudo rm /var/lib/pacman/db.lck"    # remove pacman lock

# shutdown or reboot
alias ssn="sudo shutdown now"
alias sr="sudo reboot"

#simply compile and run a single file: (supports C)
simpc() {
	case ${1##*.} in
		c)	gcc $1 -lm -Og -g3 -o ${1%.c} && ./${1%.c}
			;;
	esac
}

ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;      
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#prevent vterm in emacs, TTY from using powerline
if [[ ! ($TERM == xterm-256color || $TERM == linux) ]]; then
	powerline-daemon -q
	POWERLINE_ZSH=1
	POWERLINE_ZSH_SELECT=1
	. /usr/share/powerline/bindings/zsh/powerline.zsh
else
	export PS1="%F{cyan}%n:%F{grey}%~%# %F{white}"
fi

#zsh theme
ZSH_THEME="palenight"

picom --config .config/picom/config -b &> /dev/null

#syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
