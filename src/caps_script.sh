#!/bin/bash

# Saves Process ID to kill it later
CURRENT_PID=$$
COUNT=0

# Sets caps lock to not active
xmodmap -e "keycode 66 = NoSymbol"

# Loops till there is no nvim process anymore
while true; do
     pgrep -x "nvim" > /dev/null
     YES=$?
     if [ ! $YES -eq 0 ]; then
          break
     fi
     # Checks if Caps lock is turned on, if it is, re-enable it and wait for the user to turn it off
     if [ $COUNT -eq 0 ] && xset -q | grep -o "Caps Lock:   on" > /dev/null 2>&1; then
          xmodmap -e "keycode 66 = Caps_Lock"
     elif [ $COUNT -eq 0 ] && ! xset -q | grep -o "Caps Lock:   on" > /dev/null 2>&1; then
          xmodmap -e "keycode 66 = NoSymbol"
          COUNT=1
     fi
     if [ $COUNT -eq 0 ]; then
          sleep 0.3
     else
          sleep 1
     fi
done

# Sets the Caps Lock back to active and kills the process
xmodmap -e "keycode 66 = Caps_Lock"
kill $CURRENT_PID
