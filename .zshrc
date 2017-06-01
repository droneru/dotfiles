#!/bin/zsh
# vim set filetype=zsh

ZDOTDIR=~/.zsh


# Load configuration:
for rc in $ZDOTDIR/*.sh
do
source $rc
done
unset rc

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/drone/.sdkman"
[[ -s "/Users/drone/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/drone/.sdkman/bin/sdkman-init.sh"
