# Zombie Rice part
Run this: 
`curl -L https://is.gd/gh0stzk_dotfiles -o $HOME/RiceInstaller`
chmod u+x RiceInstaller
./RiceInstaller

# My dotfiles
clone this repo
copy files as needed

# Packages to download

sudo pacman -S python-six python-cffi python-wheel zip unzip go cargo xcolor gzip unrar noto-fonts-cjk man-db man-pages nvidia-utils nvidia xf86-video-intel
yay -S lobster miru-bin ytfzf anki kcc nordvpn-bin steam

steam(https://archlinux.org/packages/multilib/x86_64/steam/)



# Language Keyboards

## Japanese
install fcitx and it's dependencies. 
sudo pacman -S fcitx-mozc
sudo pacman -S fcitx-configtool

### Optionl: 
sudo pacman -S fcitx-qt5 kcm-fcitx fcitx-gtk2 fcitx-gtk3

open the configtool.
Press on the + in the bottom left corner. Uncheck the option for Only Show Current Language.
if it's empty make sure fcitx is running

fcitx should start automatically in bspwmrc


## Hebrew

you'll be fineeeee


