#!/bin/bash

# Author: Kasper_kid
# Date: 4/9/2025
# Contact: @User0xz19 (Telegram)
# Description: Enter the time in seconds and the timer will start

# User Colored Input
read -p $'\033[1;32m[\033[1;34m+\033[1;32m] \033[0m Enter time: ' user_time

tput clear

# A spinning animation char

spinner=('|' '/' '-' '\')
index=0
spin=${#spinner[@]}  # Get number of elements in spinner array

# Converting To Hours, Minutes, and Seconds, and Counting Down

while [ $user_time -gt 0 ]; do
    hours=$((user_time / 3600))
    minutes=$(((user_time % 3600) / 60))
    seconds=$((user_time % 60))

    spin_char="${spinner[$index]}"

    # Print in HH:MM:SS Format with spinner
    printf "\r\033[1;32m[\033[1;34m%s\033[1;32m] \033[0mTime left: %02d:%02d:%02d" "$spin_char" $hours $minutes $seconds

    sleep 1

    user_time=$((user_time - 1))
    index=$(( (index + 1) % spin ))
done

echo -e "\r\033[1;32m[✓] \033[0mTime's up!"
