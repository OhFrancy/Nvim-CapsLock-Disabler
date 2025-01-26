#!/bin/bash

# Saves Process ID to kill it later
CURRENT_PID=$$

# Sets caps lock to not active
xmodmap -e "keycode 66 = NoSymbol"

# Loops till there is no nvim process anymore
while true; do
     pgrep -x "nvim" > /dev/null
     YES=$?
     if [ ! $YES -eq 0 ]; then
          break
     fi
     sleep 1
done

# Sets the Caps Lock back to active and kills the process
xmodmap -e "keycode 66 = Caps_Lock"
kill $CURRENT_PID
