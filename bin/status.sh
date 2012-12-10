#!/bin/zsh
ICONDIR=~/.img
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
while true; do
print "$(fbattery_color)"
	sleep 9
done
