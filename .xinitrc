#!/bin/sh
setxkbmap -layout us,ru -option "grp:caps_toggle,grp_led:caps"
feh --bg-scale ~/.img/wall.jpg
guake&
export OOO_FORCE_DESKTOP="gnome"
export MOZ_DISABLE_PANGO=1
export BROWSER="/usr/bin/firefox"
export MOZILLA_FIVE_HOME="/usr/lib/mozilla"

startfluxbox
