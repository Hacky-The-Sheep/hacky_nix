#!/bin/sh

NetworkManager &
syncthing &
noctalia &
hyprpolkitagent &
gnome-keyring-daemon --start --components=secrets
exec dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots
