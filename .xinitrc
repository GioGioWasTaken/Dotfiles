#!/bin/bash
LANG=en_US.UTF-8
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
export XDG_CONFIG_HOME="$HOME/.config"
exec bspwm 
