#!/bin/bash

# Open Rofi and get user input
word=$(echo "" | rofi -dmenu -p "Enter a Japanese word:")

# Call lookup_word() function and display result
output=$(python ~/.local/bin/dictionary.py "$word")
echo "$output" | rofi -dmenu -p "Result:"
