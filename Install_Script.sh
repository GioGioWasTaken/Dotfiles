#!/bin/sh

# This is a script for installing my dotfiles on a fresh arch install. 

# The user is expected to have pacman installed

# It will NOT backup the dotfiles saved on that system. DO NOT RUN UNLESS YOU ARE ME, OR KNOW WHAT YOU ARE DOING

# If you have any directory in $HOME/GioDotfiles it will be nuked once you run the script.

# Much credit goes to gh0stzk, whom I used for a reference in this.

# Get this file off of curl or something


ERROR_LOG="$HOME/RiceErrors.log"

# Handle errors
log_error() {
    error_msg=$1
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")

    printf "%s" "[${timestamp}] ERROR: ${error_msg}\n" >> "$ERROR_LOG" # Write to file
    printf "ERROR: \n" "${error_msg}" >&2 # Write to stderror
}

initial_checks() {

    if [ "$(id -u)" = 0 ]; then
        log_error "This script MUST NOT be run as root user."
        exit 1
    fi

    
    if [ "$PWD" != "$HOME" ]; then
        log_error "The script must be executed from HOME directory."
        exit 1
    fi

    # internet is up?
    if ! ping -q -c 1 -W 1 8.8.8.8 >/dev/null 2>&1; then
        log_error "No internet connection detected."
        exit 1
    fi
}

# Check if a package is installed
is_installed() {
    pacman -Qq "$1" >/dev/null 2>&1
}


install_dependencies() {
	clear 
	echo "Installing packages needed from offical arch repositories..."
	sleep 2
    # List of dependencies
    # It has some packages which are essentials in my opinion, despite not being required for the build 
    # Again if you aren't me and using this, why? get a better rice mine sucks.
    dependencies="gcc alacritty alsa-utils base-devel bat brightnessctl bspwm cargo clipcat cups discord dunst eza feh firefox flameshot fzf gdb geany git glow go gvfs-mtp gzip imagemagick jgmenu jq kitty libwebp lxsession-gtk3 maim man-db man-pages mpc mpd mpv ncmpcpp neovim noto-fonts-cjk npm nvidia nvidia-utils obsidian pacman-contrib pamixer papirus-icon-theme picom pipewire-pulse playerctl polybar python-cffi python-gobject python-six python-wheel redshift ripgrep rofi rustup sxhkd tesseract tesseract-data-eng thunar tmux ttf-inconsolata ttf-jetbrains-mono ttf-jetbrains-mono-nerd ttf-terminus-nerd ttf-ubuntu-mono-nerd tumbler unrar unzip webp-pixbuf-loader wezterm xclip xcolor xdg-user-dirs xdo xdotool xev xf86-video-intel xorg-xdpyinfo xorg-xev xorg-xkbcomp xorg-xkill xorg-xmodmap xorg-xprop xorg-xrandr xorg-xsetroot xorg-xwininfo xorg-server xsettingsd yazi zip zsh zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting ranger kmonad zathura zathura-pdf-mupdf fcitx5 fcitx5-configtool fcitx5-gtk fcitx5-m17n fcitx5-mozc fcitx5-qt lsd rofi-calc"

    printf "Checking for dependencies...\n"
	missing_pkgs=""
    for pkg in $dependencies; do 
	    if ! is_installed "$pkg"; then 
		    missing_pkgs="$missing_pkgs $pkg"
		    printf "$pkg Not installed.\n"
	    else
		    printf "$pkg Is already installed :)\n"
	    fi
    done

    if [-n $(printf "%s" "$missing_pkgs" | tr -s ' ') ]; then
	    count=$(printf "%s" "$missing_pkgs" | wc -w)
	    printf "Installing %s packages total." count

	    if sudo pacman -S --noconfirm $missing_pkgs 2>&1 | tee -a "$ERROR_LOG" >/dev/null; then
		    for pkg in $missing_pkgs do;
			if ! is_installed "$pkg";do 
				failed_pkgs="$failed_pkgs $pkg"
				log_error "Failed to install $pkg"
			fi
		done


		if [-z "$missing_pkgs" ]; then
			printf "Done! No packages failed\n"
		else
			printf "Was unable to install :$failed_pkgs\n"
		fi
	else
		log_error "CRITICAL error. pacman -S failed. Check error log"
		return 1 
	    fi
    else
	    printf "All dependencies are already installed! (the fuck?)\n"
}



clone_dotfiles() {
	printf "Downloading dotfiles from github..." 
	repo_url="https://github.com/GioGioWasTaken/Dotfiles"
	repo_dir="$HOME/GioDotfiles"
	if [-d "$repo_dir"]; then 
		printf "GioDotfiles already exists. Nuking it\n"
		rm -rf "$repo_dir"
	fi

	printf "Making GioDotfiles directory\n"
	mkdir -p "$repo_dir"


	if git clone $repo_url $repo_dir >> $ERROR_LOG 2>&1; then
		printf "Sucessfully cloned dotfiles\n"
		dotfiles_dir="$repo_dir/dotfiles"
	else 
		log_error "Failed to clone dotfiles from github url: $repo_url\nCheck $ERROR_LOG."
	fi

}

copy_dotfiles() {
	clear
	printf "Copying dotfiles to correct directories...\n"

	if [ ! -d "$dotfiles_dir"]; then 
		printf "GioDotfiles doesn't exist. Exiting with error code 1.\n"
		exit 1
	fi

	config_dir="${dotfiles_dir}/.config"
	cd "$config_dir"
	config_list=$("ls" | tr "\n" " ")

	printf "Copying ~/.config dotfiles\n"
	for config in $config_list; do
		printf "Copying %s to ~/.config...\n" $config 
		cp -r $config "$HOME/.config"
	done
	cd "$dotfiles_dir"

	printf "Copying non ~/.config essentials (like .xinitrc)\n"
	cp ".xinitrc" ".gdbinit" ".zshrc" "README.md" ".Xmodmap" $HOME
}


change_default_shell(){
	sleep 2
	printf "Changing default shell to ZSH\n"

	zsh_path=$(which zsh)

	if [ -z "$zsh_path" ]; then 
		log_error "zsh is not installed, so defualt shell cannot be modified to zsh."
		return 1
	fi 

	if [  "$SHELL" != "$zsh_path" ]; then 
		printf "Changing path to zsh...\n"
		if chsh -s "$zsh_path"; then
			printf "Shell was successfully set to zsh\n"
		else 
			log_error "chsh -s failed."
			return 1 
		fi
	else
		printf "ZSH is already the default shell.\n"
	fi
	sleep 3
}


misc(){
	# setting permissions
	chmod u+x "$HOME/.zshrc"
	chmod u+x "$HOME/.xinitrc"
	bspwm_dir="$HOME/.config/bspwm/"
	chmod u+x "$bspwm_dir/sxhdrc"
	chmod u+x "$bspwm_dir/bspwmrc"
	chmod u+x "$bspwm_dir/dunstrc"

	# Give current user permission to run all scripts: 
	scripts_dir="$bspwm_dir/scripts"

	# Give execute permission only to script files (sh, py)
	find "$scripts_dir" -type f \( -iname "*.sh" -o -iname "*.py" \) -exec chmod u+x {} +

	# To also ensure all directories are accessible:
	find "$scripts_dir" -type d -exec chmod u+rX {} +

	# Setting up my reminders on the new install
	reminders_dir="$HOME/.config/bspwm/scripts/Reminders/"
	systemd_user_dir="$HOME/.config/systemd/user/"
	mkdir -p "$systemd_user_dir"

	cd "$reminders_dir"
	cp reminders.service "$systemd_user_dir"
	cp reminders.timer "$systemd_user_dir"
	chmod +x reminders.sh

	systemctl --user daemon-reload
	systemctl --user enable reminders.timer
	systemctl --user start reminders.timer
}



# MAIN RUN : 


printf "Installing Gio's dotfiles"
initial_checks()
install_dependencies()
clone_dotfiles() 
copy_dotfiles()
change_default_shell()
misc()


printf "DONE. restart now"
source ~/.zshrc
