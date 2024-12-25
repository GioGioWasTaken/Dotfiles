#!/bin/bash
export LC_ALL=C
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
export XDG_CONFIG_HOME="$HOME/.config"
exec bspwm 
