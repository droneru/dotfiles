#!/bin/zsh
# vim: set filetype=zsh

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

#export EDITOR=vim
#export JAVA_OPTS="-Xmx1024M -XX:MaxPermSize=1024m"
export PATH="$HOME/bin:/usr/local/bin:$PATH"
#export JAVA_HOME="/usr/lib/jvm/default"

#oracle
export ORACLE_HOME=/Library/Oracle
export NLS_LANG=American_America.UTF8
export TNS_ADMIN=/Library/Oracle # здесь у меня будет лежать уже имеющийся tnsnames.ora
export PATH=/Library/Oracle/instantclient_12_1:$PATH
export DYLD_LIBRARY_PATH=/Library/Oracle/instantclient_12_1:$DYLD_LIBRARY_PATH
export CLASSPATH=$ORACLE_HOME:$CLASSPATH
