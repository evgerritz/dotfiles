!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)
# invoke global X session script
#. /etc/X11/Xsession

#fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
fcitx -d -r

#set caps to esc
setxkbmap -option caps:escape

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

export PATH="${PATH}:${HOME}/.local/bin"

# merge in defaults and keymaps
if [ -f $sysresources ]; then

    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then

    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi
wal -R


#session=${1:i3}

#case $session in
#    gnome       ) exec gnome-session;;
#    dwm       ) exec dwm;;
    # No known session, try to run it as command
#    *                 ) exec $1;;
#esac
exec i3
#exec gnome-session
