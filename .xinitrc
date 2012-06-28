#!/bin/sh
setxkbmap -layout us,ru -option grp:caps_toggle
feh --bg-scale ~/.xmonad/wall.jpg
#mpc update
export OOO_FORCE_DESKTOP="gnome"
export MOZ_DISABLE_PANGO=1
export BROWSER="/usr/bin/firefox"

/usr/bin/xmonad
