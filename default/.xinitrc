#!/usr/bin/env bash
gnome-settings-daemon &
nm-applet &
gnome-volume-manager &
gnome-power-manager &
eval `gnome-keyring-daemon`  # SSH/GPG agent
exec awesome                 # awesome receives xinit's process id; when it terminates, X will be terminated

