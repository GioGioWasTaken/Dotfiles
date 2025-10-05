#!/usr/bin/env bash

a=$(rofi -dmenu -p "Enter a:")
b=$(rofi -dmenu -p "Enter b:")
c=$(rofi -dmenu -p "Enter c:")

if [[ -z $a || -z $b || -z $c ]]; then
    rofi -e "All coefficients required."
    exit 1
fi

result=$(python3 solve_quadratic.py "$a" "$b" "$c")
# echo "$result" | rofi -dmenu -p "Result"
rofi -e "$result"
