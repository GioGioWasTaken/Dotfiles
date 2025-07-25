# Path Oh My Zsh installation.

## EXPORTS
export ZSH="$HOME/.oh-my-zsh"
export VISUAL="${EDITOR}"
export GAMES='/home/Ningen/.steam/steam/steamapps/common'
export EDITOR='nvim'
export TERM='wezterm'
export TERMINAL='wezterm'
export BROWSER='firefox'
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
export DOTFILES="$HOME/Desktop/Dotfiles"
export SCRIPTS="$HOME/.config/bspwm/scripts"
export BSPWM_DESKTOP="$DOTFILES/bspwm/Desktops/"

export XDG_DATA_DIRS=/var/lib/flatpak/exports/share:/home/Ningen/.local/share/flatpak/exports/share:$XDG_DATA_DIRS
export LANG=en_US.UTF-8
export XDG_DATA_DIRS="/usr/share:/home/Ningen/.local/share/:/var/lib/flatpak/exports/share:/home/Ningen/.local/share/flatpak/exports/share:$XDG_DATA_DIRS"

# android dev.
export ANDROID_HOME=$HOME/Android/Sdk


# ADD to path: 
# This is intentionally seperated so the PATH changes are incremental.
export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$PATH:"/home/Ningen/.local/share/gem/ruby/3.3.0/bin"
export PATH=$PATH:"$HOME/go/bin"

# Add all my scripts to PATH so sxhkdrc finds them without explicitly specifying the abs path, Does not include subdirs of $SCRIPTS

export PATH=$PATH:"$SCRIPTS"



if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi





autoload -Uz compinit

for dump in ~/.config/zsh/zcompdump(N.mh+24); do
  compinit -d ~/.config/zsh/zcompdump
done

compinit -C -d ~/.config/zsh/zcompdump

autoload -Uz add-zsh-hook
autoload -Uz vcs_info
precmd () { vcs_info }
_comp_options+=(globdots)

zstyle ':completion:*' verbose true
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} 'ma=48;5;197;1'
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:warnings' format "%B%F{red}No matches for:%f %F{magenta}%d%b"
zstyle ':completion:*:descriptions' format '%F{yellow}[-- %d --]%f'
zstyle ':vcs_info:*' formats ' %B%s-[%F{magenta}%f %F{yellow}%b%f]-'




# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
ZSH_THEME="robbyrussell"



#  ┬ ┬┌─┐┬┌┬┐┬┌┐┌┌─┐  ┌┬┐┌─┐┌┬┐┌─┐
#  │││├─┤│ │ │││││ ┬   │││ │ │ └─┐
#  └┴┘┴ ┴┴ ┴ ┴┘└┘└─┘  ─┴┘└─┘ ┴ └─┘
# dots while completion is loading
expand-or-complete-with-dots() {
  echo -n "\e[31m…\e[0m"
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots



#  ┬ ┬┬┌─┐┌┬┐┌─┐┬─┐┬ ┬
#  ├─┤│└─┐ │ │ │├┬┘└┬┘
#  ┴ ┴┴└─┘ ┴ └─┘┴└─ ┴ 
HISTFILE=~/.config/zsh/zhistory
HISTSIZE=5000
SAVEHIST=5000


#  ┌─┐┌─┐┬ ┬  ┌─┐┌─┐┌─┐┬    ┌─┐┌─┐┌┬┐┬┌─┐┌┐┌┌─┐
#  ┌─┘└─┐├─┤  │  │ ││ ││    │ │├─┘ │ ││ ││││└─┐
#  └─┘└─┘┴ ┴  └─┘└─┘└─┘┴─┘  └─┘┴   ┴ ┴└─┘┘└┘└─┘
setopt AUTOCD              # change directory just by typing its name
setopt PROMPT_SUBST        # enable command substitution in prompt
setopt MENU_COMPLETE       # Automatically highlight first element of completion menu
setopt LIST_PACKED		   # The completion menu takes less space.
setopt AUTO_LIST           # Automatically list choices on ambiguous completion.
setopt HIST_IGNORE_DUPS	   # Do not write events to history that are duplicates of previous events
setopt HIST_FIND_NO_DUPS   # When searching history don't display results already cycled through twice
setopt COMPLETE_IN_WORD    # Complete from both ends of a word.

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  history-substring-search
  fzf-tab
  you-should-use
  vi-mode
  auto-notify
  web-search
)

source $ZSH/oh-my-zsh.sh

#  ┌─┐┬  ┬┌─┐┌─┐
#  ├─┤│  │├─┤└─┐
#  ┴ ┴┴─┘┴┴ ┴└─┘
alias mirrors="sudo reflector --verbose --latest 5 --country 'United States' --age 6 --sort rate --save /etc/pacman.d/mirrorlist"

alias grub-update="sudo grub-mkconfig -o /boot/grub/grub.cfg"

alias mantenimiento="yay -Sc && sudo pacman -Scc" # no idea what this does


alias vim="nvim"
alias e="nvim" # I should move on to one letter. e for edit.

alias ongaku="ncmpcpp"

alias ls='lsd -a --group-directories-first'
alias ll='lsd -la --group-directories-first'

# get rid of AT&T syntax for the far superior intel syntax.
alias objdump='objdump -M intel'

alias lobster='lobster --rofi -i'

alias discord='discord --ignore-gpu-blocklist --disable-features=UseOzonePlatform --enable-features=VaapiVideoDecoder --use-gl=desktop --enable-gpu-rasterization --enable-zero-copy'

# awesome alias
man2() {
  curl cheat.sh/"$1"
}
alias ytfzf='ytfzf -t'
alias ytmusic='ytfzf -t -m -s'
alias tmux='tmux -u'
alias discord='discord --no-sandbox'
alias cl='printf "\033[H\033[2J"'
alias gog='google'
alias rop='ROPgadget --binary'
alias venv='source ~/.venvs/bin/activate'
alias cpdir='pwd | xclip -selection clipboard'

# ENV variable
export PROGRAMMING_DIR=$HOME/Desktop/Linux-Machine/

# Below is the definition for the ep (enter Programming) command. This command uses the ENV variable defined above in order to make CD'ing into my programming directory more comfortable.

ep() {
    if [ -z "$1" ]; then
        cd "$PROGRAMMING_DIR"
    else
        cd "${PROGRAMMING_DIR}/$1" || echo "Directory not found: ${PROGRAMMING_DIR}/$1"
    fi
}


# nvim switch
alias nvim-chad="NVIM_APPNAME=NvChad nvim"

function nvims() {
  items=("default" "NvChad")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

bindkey -s ^a "^Utmux attach\n"





# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)


# CD into chosen directory
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"

  bindkey '^P' fzf-cd-widget
# VIMMMMMMM
bindkey -v
bindkey 'qq' vi-cmd-mode
bindkey -M vicmd 'L' end-of-line
bindkey -M vicmd 'H' beginning-of-line
bindkey '^V' yank



# Add text object extension -- eg ci" da(:
# WHOEVER MADE THIS MAY ASK FOR MY HAND IN MARRIAGE
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
    for c in {a,i}{\',\",\`}; do
        bindkey -M $m $c select-quoted
    done
done



bindkey -s ^G "glow $PROGRAMMING_DIR/Brain\n"

#  ┌─┐┬ ┬┌┬┐┌─┐  ┌─┐┌┬┐┌─┐┬─┐┌┬┐
#  ├─┤│ │ │ │ │  └─┐ │ ├─┤├┬┘ │ 
#  ┴ ┴└─┘ ┴ └─┘  └─┘ ┴ ┴ ┴┴└─ ┴ 

eval "$(starship init zsh)"

python ~/.config/bspwm/scripts/Quotes/quotes.py
