#!/bin/bash

DEPENDENCY=x11-xserver-utils
SCRIPT=caps_script.sh
TARGET=caps_script
DIRECTORY=Nvim-Caps-Disabler

if ! dpkg -s $DEPENDENCY > /dev/null 2>&1; then
     echo "$DEPENDENCY not installed, install it and try again."
elif [ ! -f $SCRIPT ]; then
     echo "$SCRIPT not found, make sure that it's in the right folder."
else
     echo "Making the script an executable..."
     chmod a+x $SCRIPT > /dev/null 2>&1
     mv $SCRIPT $TARGET > /dev/null 2>&1
     echo "Successful."
     sleep 0.5
     echo "Do you want to move the script to the desired location? [Y/n]"
     read prompt
     case $prompt in
          y | Y)
               echo "Moving the script to ~/$DIRECTORY."
               mkdir /home/$USER/$DIRECTORY
               mv $TARGET /home/$USER/$DIRECTORY/
               echo "Installation completed"
               ;;
          *)
               echo "Installation completed, run it with './caps_script &'"
               ;;
     esac
fi
