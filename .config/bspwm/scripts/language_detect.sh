#!/usr/bin/env bash

s="$1"

if [[ $s =~ [א-ת] ]]; then
  echo Hebrew
elif [[ $s =~ [A-Za-z] ]]; then
  echo English
else
  # Defaults to Japanese
  echo Japanese
fi
