## Manually adjust screen brightness when xbacklight isn't working
##
## Reduce screen brightness by 10%

#!/bin/bash

min=0
max=$(sudo cat /sys/class/backlight/intel_backlight/max_brightness)
current=$(cat /sys/class/backlight/intel_backlight/brightness)

#Adjustment factor
delta=$((max / 10))
new=$((current - delta))

#Boundary Check
if [ "$new" -lt "$min" ]
then
	new=0
fi

echo $new | sudo tee /sys/class/backlight/intel_backlight/brightness

#Notification
new=$(cat /sys/class/backlight/intel_backlight/brightness)
notify-send --icon normal "Brightness" "$new"