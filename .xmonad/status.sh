#!/bin/zsh
ICONDIR=~/.xmonad/img
fdate() {  
    date +'^fg(gray)%a %d %b ^fg(white)%H:%M:%S'
}
fbattery(){
    acpi -b | awk "{print $1}" | sed 's/\([^:]*\): \([^,]*\), \([0-9]*\)%.*/\3/'
}
fbattery_status(){
    acpi | awk '{print $3}'
}
fbattery_color(){
    BAT=$(fbattery)
	CHARGE=$(fbattery_status)
	COLOR="gray"
	ICONFILE="$ICONDIR/battery.xbm"
	if [[ $CHARGE = "Charg"* ]] then; ICONFILE="$ICONDIR/power-ac.xbm"; fi
	if [[ $BAT -le 30 ]] then; COLOR="#ff4747"; fi
	if [[ $BAT -ge 80 ]] then; COLOR="#a020f0"; fi
	print "^fg($COLOR)^i($ICONFILE) $BAT %"
}
fvolume(){
    amixer -c0 get PCM | grep 'Front Left:' | awk '{print $5}' | sed 's/%\]//' | sed 's/\[//' | gdbar -fg '#a8a3f5' -bg '#333' -sw 26
}
fvolume_color(){
    VOL=$(fvolume)
	print "^i($ICONDIR/vol-hi.xbm) $VOL" 
}
while true; do
print "$(fvolume_color) $(fbattery_color) ^fg(khaki)^i($ICONDIR/clock.xbm) $(fdate)"
	sleep 1
done
