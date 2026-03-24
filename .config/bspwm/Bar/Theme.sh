#!/usr/bin/env bash

set_bspwm_config() {
	bspc config border_width 0
	bspc config top_padding 0
	bspc config bottom_padding 0
	bspc config left_padding 0
	bspc config right_padding 0
	bspc config normal_border_color "#C574DD"
	bspc config active_border_color "#C574DD"
	bspc config focused_border_color "#8897F4"
	bspc config presel_feedback_color "#FF4971"
}

# Set dunst notification daemon config

# Set eww colors
set_eww_colors() {
	cat >"$HOME"/.config/bspwm/eww/colors.scss <<EOF
// Eww colors 
\$bg: #1D1F28;
\$bg-alt: #1F222B;
\$fg: #FDFDFD;
\$black: #56687E;
\$lightblack: #262831;
\$red: #F37F97;
\$blue: #8897F4;
\$cyan: #79E6F3;
\$magenta: #B043D1;
\$green: #90ceaa;
\$yellow: #F2A272;
\$archicon: #0f94d2;
EOF
}

POLYBAR="$XDG_CONFIG_HOME/bspwm/Bar"
# Launch the bar
launch_bars() {

	# This launches polybar on multiple monitors
	for mon in $(polybar --list-monitors | cut -d":" -f1); do
		(MONITOR=$mon polybar -c "$XDG_CONFIG_HOME/bspwm/Bar/config.ini") &
		# (MONITOR=$mon polybar -q pam2 -c "$POLYBAR"/config.ini) &
		# (MONITOR=$mon polybar -q pam3 -c "$POLYBAR"/config.ini) &
		# We can launch multiple bars per monitor in this way, but I am only interested in having 1 bar. No longer interested in "rice switching". The only thing I change from time to time is wallpaper.
	done

}

### ---------- Apply Configurations ---------- ###

set_bspwm_config
launch_bars
set_eww_colors
