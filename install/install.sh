#! /bin/sh
# Use this shell to install my configuration on linux system
CURRENT=$PWD
CONTENT='(load "'$CURRENT'/../.emacs")'
echo $CONTENT

if [ -f ~/.emacs ]; then
  echo [INFO] Backup ~/.emacs 
  mv ~/.emacs ~/.emacs.back
fi
echo [INFO] Link my emacs configuration to current.
echo $CONTENT>>~/.emacs
echo [INFO] Install successfully





