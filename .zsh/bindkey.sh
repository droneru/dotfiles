#!/bin/zsh
# vim set filetype=zsh 

bindkey -v 
# Create an empty $key array so that setting $key[subscript] below doesn't
# fail if $key doesn't exist
typeset -g -A key

# Set some defaults. Use -z, not -e, because we're checking that it's set to
# an empty string.
[[ -z "${key[Home]}" ]] && key[Home]='^[[7~'
[[ -z "${key[End]}" ]] && key[End]='^[[8~'
[[ -n ${key[Home]}    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n ${key[End]}     ]]  && bindkey  "${key[End]}"     end-of-line
bindkey "^[[5~" up-line-or-history
bindkey "^[[6~" down-line-or-history
