# Zombie Rice part
Run this: 
`curl -L https://is.gd/gh0stzk_dotfiles -o $HOME/RiceInstaller`
`chmod u+x RiceInstaller`
`./RiceInstaller`

# My dotfiles
clone this repo
copy files as needed

# Packages to download

sudo pacman -S python-six python-cffi python-wheel zip unzip go cargo xcolor gzip unrar noto-fonts-cjk man-db man-pages nvidia-utils nvidia xf86-video-intel xev xorg-xev xorg-xmodmap xorg-xkbcomp discord gdb pipewire-pulse alsa-utils obsidian thunar ripgrep flameshot tesseract tesseract-data-eng glow cups

yay -S lobster miru-bin ytfzf anki kcc nordvpn-bin steam ulauncher

steam(https://archlinux.org/packages/multilib/x86_64/steam/)



# Language Keyboards
copying the fcitx5 config should do this automatically. But:

## Japanese
- install fcitx5 and it's dependencies. 

- sudo pacman -S fcitx5 fcitx5-configtool fcitx5-gtk fcitx5-m17n fcitx5-mozc fcitx5-qt

- open the configtool.

- Press on the + in the bottom left corner. Uncheck the option for Only Show Current Language.

- if it's empty make sure fcitx is running

- fcitx should start automatically in bspwmrc


## Hebrew
simply add it through fcitx5 config tool. Make sure your language switch keys are properly set. Should be in the config file in this repo.

# Next up

## Set a github ssh key and clone Linux-Machine to Desktop.
- ChatGPT it i'm lazy

## Patch up the tmux config
- clone npm into tmux from github (maybe just add this to the dotfiles... Idiot lmao)
- set up caps lock remap
- remap tmux to tmux -U to fix weird UTF 8 __ bug
- make sure the correct TERM and TERMINAL env variables are set in ~/.zshrc

## set up systemd services

- systemctl --user daemon-reload

- systemctl --user enable reminders.timer

- systemctl --user start reminders.timer

## Screen casting


- yay -S Gnome-Network-displays
- sudo systemctl enable avahi-daemon
- sudo systemctl enable NetworkManager
- sudo pacman -S xdg-desktop-portal xdg-desktop-portal-gnome

## Yomichan
-  grab dicts from the dotfiles and add them through your browser

## Python packages

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```
Use `uv` to manage python packages globally when they aren't available via `AUR` under `python-packagename`(or even when they are available.)

## Fonts

## Gaming

- Set up steam with proton-play
- install all the necessary nvidia drivers. Look it up on youtube.
- install vulkan-intel for better rendering.
    * in general it is wise to look up stuff about vulkan and openGL, etc. 

## Printing stuff


sudo systemctl enable cups.service
sudo systemctl start cups.service

Some more [drivers](https://wiki.archlinux.org/title/CUPS/Printer-specific_problems)

Make sure to search the official printer site for some more drivers, if needed.


#### Misc

sudo pacman -S python-pwntools

FZF HISTORY WIDGET WITH ^R IS GOATED FZF IS KING ALL HAIL FZF


##### Open links with firefox
xdg-mime default firefox.desktop x-scheme-handler/https x-scheme-handler/http
