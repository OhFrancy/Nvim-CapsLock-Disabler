#!/bin/bash

DEPENDENCY=x11-xserver-utils
SCRIPT=caps_script.sh
TARGET=caps_script
DIR=Nvim-Caps-Disabler

if [ ! -f $SCRIPT ]; then
     echo "$SCRIPT not found, make sure that it's in the right folder."
else
     if ! command -v $DEPENDENCY > /dev/null 2>&1; then
          echo "$DEPENDENCY not installed, proceeding to install it..."
          sudo apt install $DEPENDENCY
     fi

     echo "Making the script an executable..."
     if ! chmod a+x $SCRIPT > /dev/null 2>&1; then
         echo "Couldn't run 'chmod a+x', not enough permissions, exiting..."
         exit
     fi
     if ! mv $SCRIPT $TARGET > /dev/null 2>&1; then
          echo "Couldn't run 'mv $SCRIPT $TARGET', not enough permissions, exiting"
          exit
     fi
     echo "Successful."
     sleep 0.5
     echo "Do you want to move the script to the desired location? [Y/n]"
     read prompt
     case $prompt in
          y | Y)
               echo "Moving the script to ~/$DIR."
               if [ -d /home/$USER/$DIR ]; then
                    echo "Directory already exists..."
               else
                    mkdir /home/$USER/$DIR > /dev/null 2>&1
                    echo "Directory Successfully created..."
               fi
               mv $TARGET /home/$USER/$DIR > /dev/null 2>&1
               echo "Installation completed."
               ;;
          *)
               echo "Installation completed, run it with './caps_script &'"
               ;;
     esac
fi
