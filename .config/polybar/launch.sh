#!/usr/bin/env bash

# define laptop monitor
laptop_monitor="eDP-1"

# define bars
docked_bar="config_docked.ini"
undocked_bar="config_undocked.ini"

# define colors for printf commands
text_color='\033[0;32m'
no_color='\033[0m'

# Terminate already running bar instances
killall polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Determine whether laptop monitor is active
case "$(xrandr --listactivemonitors | grep -c $laptop_monitor)" in
    0)
        # laptop monitor is not active, launch docked bar
        printf "${text_color}launch.sh ${no_color} laptop monitor is not active, launching docked bar\n"
        polybar main -c $(dirname $0)/$docked_bar &
        ;;
    *)
        # laptop monitor is active, launch undocked bar
        printf "${text_color}launch.sh ${no_color} laptop monitor is  active, launching undocked bar\n"
        polybar main -c $(dirname $0)/$undocked_bar &
        ;;
esac


