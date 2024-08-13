#!/bin/bash

# Get the directory of the script
script_dir=$(dirname "$(readlink -f "$0")")

# Function to send a notification
send_reminder() {
    local message=$1
    local icon=$2
    local urgency=$3
    local timeout=$4
    notify-send "$message" -i "$script_dir/Icons/$icon" -u "$urgency" -t "$timeout"
}

# Get the current time in HH:MM format
current_time=$(date +%H:%M)
current_hour=$(date +%H)
current_minute=$(date +%M)

# Check for specific times for lunch reminder
if [[ "$current_time" == "14:00" || "$current_time" == "15:00" || "$current_time" == "16:00" || "$current_time" == "17:00" ]]; then
    send_reminder "Time to eat lunch!" "Steak.png" "low" 7000
fi

# Check every 20 minutes for hydration reminder
if (( $(date +%M) % 20 == 0 )); then
    send_reminder "Stay Hydrated!" "Water_bottle.png" "normal" 3000
fi

# Check if current time is within the range for hourly Anki reminders
if (( 7 <= current_hour && current_hour < 21 &&current_minute==0 || current_minute==30)); then
    send_reminder "Bi-Hourly Anki reminder!" "Anki.png" "low" 5000
fi


if ((21 <= current_hour && current_hour <= 24 && current_minute==0 || current_minute==30)); then
    send_reminder "Stop working. ご苦労さまでした" "Bed.png" "low" 8000
fi




