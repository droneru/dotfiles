#!/bin/zsh
# vim: set filetype=zsh

alias -s txt=$EDITOR
alias -s py=python
alias -s {xls,doc,docx,rtf,ppt,odt,sxw}=libreoffice
alias -s {png,gif,jpg,jpeg,xpm}=feh
alias -s {pdf,djvu}=evince

alias ls='ls --color=auto'
alias d='df -hHlT'
alias grep='grep --colour=auto'
alias ll='ls -l'
alias la='ls -a'
alias l='ls -la'
alias halt='sudo halt'
alias reboot='sudo reboot'
alias root='sudo zsh'
alias q='exit'
alias 88='ping 8.8.4.4'
alias blog='cd ~/Dropbox/note/drone.ru'

#git
alias gco='git checkout'
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
