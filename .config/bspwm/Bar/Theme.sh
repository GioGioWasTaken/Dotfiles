#!/usr/bin/env bash
#  ██████╗  █████╗ ███╗   ███╗███████╗██╗      █████╗     ██████╗ ██╗ ██████╗███████╗
#  ██╔══██╗██╔══██╗████╗ ████║██╔════╝██║     ██╔══██╗    ██╔══██╗██║██╔════╝██╔════╝
#  ██████╔╝███████║██╔████╔██║█████╗  ██║     ███████║    ██████╔╝██║██║     █████╗
#  ██╔═══╝ ██╔══██║██║╚██╔╝██║██╔══╝  ██║     ██╔══██║    ██╔══██╗██║██║     ██╔══╝
#  ██║     ██║  ██║██║ ╚═╝ ██║███████╗███████╗██║  ██║    ██║  ██║██║╚██████╗███████╗
#  ╚═╝     ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝    ╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝
#  Author  :  z0mbi3
#  Url     :  https://github.com/gh0stzk/dotfiles
#  
# This is one of the only files I will keep from the original rice. All credit of course goes to z0mbi3.
#

set_bspwm_config() {
    bspc config border_width 0
    bspc config top_padding 59
    bspc config bottom_padding 2
    bspc config left_padding 2
    bspc config right_padding 2
    bspc config normal_border_color "#C574DD"
    bspc config active_border_color "#C574DD"
    bspc config focused_border_color "#8897F4"
    bspc config presel_feedback_color "#FF4971"
}

# Reload terminal colors
set_term_config() {
    cat > "$HOME"/.config/alacritty/rice-colors.toml << EOF

# Default colors
[colors.primary]
background = "#1D1F28"
foreground = "#FDFDFD"

# Cursor colors
[colors.cursor]
cursor = "#FF4971"
text = "#1D1F28"

# Normal colors
[colors.normal]
black = "#3D4C5F"
blue = "#8897F4"
cyan = "#79E6F3"
green = "#5ADECD"
magenta = "#C574DD"
red = "#F37F97"
white = "#FDFDFD"
yellow = "#F2A272"

# Bright colors
[colors.bright]
black = "#56687E"
blue = "#556FFF"
cyan = "#3FDCEE"
green = "#18E3C8"
magenta = "#B043D1"
red = "#FF4971"
white = "#BEBEC1"
yellow = "#FF8037"
EOF
}

# Set dunst notification daemon config
set_dunst_config() {
    sed -i "$HOME"/.config/bspwm/dunstrc \
        -e "s/transparency = .*/transparency = 9/g" \
        -e "s/frame_color = .*/frame_color = \"#1D1F28\"/g" \
        -e "s/separator_color = .*/separator_color = \"#8897F4\"/g" \
        -e "s/font = .*/font = JetBrainsMono NF Medium 9/g" \
        -e "s/foreground='.*'/foreground='#79E6F3'/g"

    sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
    cat >> "$HOME"/.config/bspwm/dunstrc <<- _EOF_
			[urgency_low]
			timeout = 3
			background = "#1D1F28"
			foreground = "#FDFDFD"

			[urgency_normal]
			timeout = 6
			background = "#1D1F28"
			foreground = "#FDFDFD"

			[urgency_critical]
			timeout = 0
			background = "#1D1F28"
			foreground = "#FDFDFD"
_EOF_
}

# Set eww colors
set_eww_colors() {
    cat > "$HOME"/.config/bspwm/eww/colors.scss << EOF
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

# Launch the bar
launch_bars() {

    for mon in $(polybar --list-monitors | cut -d":" -f1); do
        (MONITOR=$mon polybar -q pam1 -c "${rice_dir}"/config.ini)&
        (MONITOR=$mon polybar -q pam2 -c "${rice_dir}"/config.ini)&
        (MONITOR=$mon polybar -q pam3 -c "${rice_dir}"/config.ini)&
        (MONITOR=$mon polybar -q pam4 -c "${rice_dir}"/config.ini)&
        (MONITOR=$mon polybar -q pam5 -c "${rice_dir}"/config.ini)&
        (MONITOR=$mon polybar -q pam6 -c "${rice_dir}"/config.ini)&
    done

}



### ---------- Apply Configurations ---------- ###

set_bspwm_config
set_term_config
launch_bars
set_dunst_config
set_eww_colors
