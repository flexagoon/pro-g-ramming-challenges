#!/usr/bin/env bash
set -euo pipefail

# This script depends on xdotool

read -p "Select a key or key combination to press: " keycomb
read -p "Select press frequency: " pressfreq

while sleep $pressfreq
do
    xdotool key --clearmodifiers $keycomb
done
