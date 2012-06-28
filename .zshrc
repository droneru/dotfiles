#!/bin/zsh
# vim set filetype=zsh

ZDOTDIR=~/.zsh
export PATH="$HOME/bin:$PATH"

# Load configuration:
for rc in $ZDOTDIR/*.sh
do
source $rc
done
unset rc

