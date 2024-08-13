# Zombie Rice part
Run this: 
`curl -L https://is.gd/gh0stzk_dotfiles -o $HOME/RiceInstaller`
`chmod u+x RiceInstaller`
`./RiceInstaller`

# My dotfiles
clone this repo
copy files as needed

# Packages to download

sudo pacman -S python-six python-cffi python-wheel zip unzip go cargo xcolor gzip unrar noto-fonts-cjk man-db man-pages nvidia-utils nvidia xf86-video-intel

yay -S lobster miru-bin ytfzf anki kcc nordvpn-bin steam

steam(https://archlinux.org/packages/multilib/x86_64/steam/)



# Language Keyboards

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
- I don't fucking remember. Fuck me.
- set up caps lock remap
- Probably just set up npm and update it.

## set up systemd services
systemctl --user daemon-reload
systemctl --user enable reminders.timer
systemctl --user start reminders.timer

