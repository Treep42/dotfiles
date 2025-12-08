#!/usr/bin/env bash

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"

# Options
shutdown='poweroff '
reboot='reboot '
lock='lock '
suspend='supend '
logout='logout '
yes='yes '
no='no '

# Rofi CMD
rofi_cmd() {
    rofi -dmenu \
        -p "uptime: $uptime" \
        -mesg "uptime: $uptime" \
        -config ~/.config/rofi/config-powermenu.rasi
}

# Confirmation CMD
confirm_cmd() {
    rofi -dmenu \
        -p 'confirmation' \
        -mesg 'are you sure?' \
        -config ~/.config/rofi/config-confirm.rasi
}

# Ask for confirmation
confirm_exit() {
    echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
    echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi_cmd
}

# Execute Command
run_cmd() {
    selected="$(confirm_exit)"
    if [[ "$selected" == "$yes" ]]; then
        if [[ $1 == '--shutdown' ]]; then
            systemctl poweroff
        elif [[ $1 == '--reboot' ]]; then
            systemctl reboot
        elif [[ $1 == '--suspend' ]]; then
            rmpc pause
            pactl set-sink-mute "$(pactl get-default-sink)" 0
            systemctl suspend
        elif [[ $1 == '--logout' ]]; then
            hyprctl dispatch exit
        fi
    else
        exit 0
    fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
            run_cmd --shutdown
        ;;
    $reboot)
            run_cmd --reboot
        ;;
    $lock)
            loginctl lock-session
        ;;
    $suspend)
            run_cmd --suspend
        ;;
    $logout)
            run_cmd --logout
        ;;
esac
