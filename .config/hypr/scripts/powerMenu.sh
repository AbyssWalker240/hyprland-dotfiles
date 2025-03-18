#!/bin/bash


selection=$(echo "Reboot
Shutdown
Sleep
Log out" | rofi -dmenu -i -p "power" -lines 4 -theme /home/rosetta/.config/rofi/themes/hyprpwrm.rasi)

if [[ $selection == "Shutdown" ]]; then
	shutdown +2
	hyprctl notify 3 120000 "rgb(ff0000)" "Shutdown scheduled"
elif [[ $selection == "Reboot" ]]; then
	reboot
elif [[ $selection == "Log out" ]]; then
	loginctl terminate-user rosetta
elif [[ $selection == "Sleep" ]]; then
	systemctl suspend
else
	shutdown -c
	hyprctl dismissnotify
fi
