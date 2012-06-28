#!/bin/bash

event="$1"
arg1="$2"
jid="$3"
msg_file="$4"
web_browser="firefox"

# Проверка того, стоит ли удалять файл, переданный
# четвертым параметром :-)
del=$(echo "$msg_file" | grep -c 'mcabber-')
[ "$del" -eq 1 ] && trap "rm $msg_file" 0 1 2 3 6 9 14 15

# Если пришло входящее сообщение
if [ "$event" = "MSG" -a "$arg1" == "IN" ]; then

# Воспроизводим звук
wavplay ~/.mcabber/incoming.wav > /dev/null &

# Сигнализируем о том, что было получено новое сообщение
(echo "mcabber: message from $jid"; sleep 5) | dzen2 &

# Ищем url в полученном сообщении и открываем в
# web-обозревателе
if [ -f "$msg_file" -a -r "$msg_file" ]; then
cat $msg_file | grep -E -o '(http|https|ftp)\://([a-zA-Z0-9\.\-]+\.[a-zA-Z]{2,4}|[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})(:[a-zA-Z0-9]*)?/?([а-яА-Яa-zA-Z0-9\._\?\,\\x27/\\\+&%\$#\=~!\-])*' | \
while read url; do
  (sleep 1 && $web_browser $url) &
done
fi

fi
