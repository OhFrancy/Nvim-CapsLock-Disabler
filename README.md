# Purpose:
## You could think, why this script?
I found the idea of having to worry about the Caps lock, especially on a sensitive keyboard, really unpleasing.

Then I thought, why not make it work only when neovim is running? And here it comes, Nvim-CapsLock-Disabler.

# Complete Installation Guide:
The guide that follows will lead you to make the script work.

## Dependencies:
To correctly make this script work, you'll need an extra package, install it as follows:

```bash
sudo apt install x11-xserver-utils
```

## Installation:
```bash
git clone https://github.com/OhFrancy/Nvim-CapsLock-Disabler.git
cd Nvim-CapsLock-Disabler/src
./inst.sh
```

## Auto-run in Neovim:
To make the script work in background everytime you open neovim, you need to first find your configuration folder,
this is usually located in `/home/$USER/.config/nvim/init.lua`, if you don't have the directory and/or the file simply create it.

After this you'll need to edit `init.lua` and add this line of code wherever you want:
```lua
os.execute([[/home/$USER/Nvim-Caps-Disabler/caps_script &]])
```
This will make sure that everytime you open neovim the script gets executed in the background.

## Debugging
If the script doesn't work as it should, run the `kill.sh` script or simply kill every `nvim` and `sh` process.


