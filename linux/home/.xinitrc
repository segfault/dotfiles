#!/bin/sh

# Start ssh-agent
eval $(ssh-agent)

# Import colour scheme from X resources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Disable screensaver & DPMS
xset s off -dpms

# Lock immediately after awaking from sleep
# Note that xss-lock hooks into systemd, so just call "systemctl suspend" whenever you want to sleep/lock
xss-lock -- i3lock-next &

# Notifications
dunst &

# Clipboard manager
greenclip daemon &

# Screen colour temperature (London coords)
redshift -l 51.5:-0.11 &

# Compositor (transparency & misc)
compton -b -c --inactive-dim .1 --backend glx --xrender-sync

# Set transparency dynamically on entire windows
devilspie &

# Load custom keybinds
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

# WM
exec i3
