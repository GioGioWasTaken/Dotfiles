#!/usr/bin/env bash

temp_file="/sys/devices/platform/coretemp.0/hwmon/hwmon0/temp2_input"

if [[ -r $temp_file ]]; then
    temp_raw=$(<"$temp_file")
    temp_c=$((temp_raw / 1000))
    echo "${temp_c}°C"
else
    echo "null"
fi
