#!/bin/bash
LANG=en_US.UTF-8
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export XDG_CONFIG_HOME="$HOME/.config"

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
exec bspwm 
