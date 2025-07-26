#!/bin/bash

man -k . | awk '$2 == "(3)" { print $1 }' | while read -r func; do
    if man 3 "$func" 2>/dev/null | grep -q '^BUGS$'; then
        echo "=== $func ==="
        man 3 "$func" 2>/dev/null | awk '/^BUGS$/,/^[A-Z ]{2,}$/' | grep -v '^$'
        echo
    fi
done
