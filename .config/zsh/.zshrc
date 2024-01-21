#
#            _
#    _______| |__  _ __ ___
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__
# (_)___|___/_| |_|_|  \___|
#
#
# @samyak039


#######
# zsh #
#######

## History
# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS


## input / output
# Set editor default keymap to emacs (`-e`) or vi/vim (`-v`)
bindkey -e
# Prompt for spelling correction of commands.
setopt CORRECT
# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '
# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# history

# beep-beep
unsetopt beep

#######################
# aliases & functions #
#######################
# source ${ZDOTDIR}/aliasrc

# advcp
alias c='advcp -igr'
# emacs
alias e="emacsclient --no-wait --socket-name='doom' -a 'emacs --fg-daemon'"
# advmv
alias m='advmv -ig'

# clear -x
alias cx='clear -x'

# qrencode
alias qrcode="qrencode -t UTF8"
alias qrpng="qrencode -t PNG -o qr.png"
alias qrsvg="qrencode -t PNG -o qr.svg"

# pipenv https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/pipenv
alias pch="pipenv check"
alias pcl="pipenv clean"
alias pgr="pipenv graph"
alias pi="pipenv install"
alias pidev="pipenv install --dev"
alias pl="pipenv lock"
alias po="pipenv open"
alias prun="pipenv run"
alias psh="pipenv shell"
alias psy="pipenv sync"
alias pu="pipenv uninstall"
alias pwh="pipenv --where"
alias pvenv="pipenv --venv"
alias ppy="pipenv --py"

# neovim
alias v="nvim"

# zoxide
alias zw="source zoxide_tmux_window.sh"

# function v() {
# 	if [ $# -gt 0 ]; then
# 		nvim $@
# 	else
# 		nvim .
# 	fi
# }

# case conversion

function camelcase() {
    perl -pe 's#(_)(.)#\u$2#g'
}

function snakecase() {
    perl -pe 's#([A-Z])#_\L$1#g' | perl -pe 's#^_##'
}

function tmux-window-name() {
	($TMUX_PLUGIN_MANAGER_PATH/tmux-window-name/scripts/rename_session_windows.py &)
}

# dotfile config
alias cfg="/usr/bin/git --git-dir=$CONFIG/dotfiles --work-tree=$HOME"
# no confusion between doas --option or cmd --option
alias doas='doas --'
# update system
alias pmsyu='doas pacman -Sy && doas powerpill -Su && paru -Su'
# dart & flutter pub
alias drt='fvm dart'
alias fltr='fvm flutter'
alias dpub='dart pub'
alias fpub='flutter pub'
# fvm
alias ffvm='fvm flutter'
alias dfvm='fvm dart'

# color
alias ip='ip -c'

# # leetcode-cli
# alias ll="leetcode"
# alias lld="leetcode data"
# alias lls="leetcode stat"
# llp() { leetcode pick $q; }
# lle() { leetcode edit $q; }
# llt() { leetcode test $q; }
# llx() { leetcode exec $q; }

# adb quick connect connect
adbcon() {
  if ( adb connect "192.168.$1.93:5555" | rg connected ); then
    if ( adb devices | rg 'device$' ); then
      if ( flutter devices | rg -i android ); then
      else
        echo '\e[1;33mNOT CONNECTED\e[m' && return 2;
      fi
    else
      echo 'echo';
    fi
  else
    echo '\e[1;33mADB cannot reach Device\e[m';  return 1;
  fi
}

# better X tools
xxev() {
  xev | awk -F'[ )]+' ' /^KeyPress/ {a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'
}
xxprop() {
  xprop | awk '
      /^WM_CLASS/{sub(/.* =/, "instance:"); sub(/,/, "\nclass:"); print}
      /^WM_NAME/{sub(/.* =/, "title:"); print}'
}

#######
# XDG #
#######
alias ldgr='ledger --init-file "$XDG_CONFIG_HOME"/ledgerrc --sort date'
alias startx='startx $XDG_CONFIG_HOME/X11/xinitrc'
alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'

###########################
# pre zimfw customization #
###########################

### completion
zstyle ':completion::complete:*' cache-path ${XDG_CACHE_HOME}/zsh/zcompcache

# ### fzf-tab
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':fzf-tab:*' popup-min-size 50 8
zstyle ':fzf-tab*' fzf-min-height 20
zstyle ':fzf-tab:complete:cd:*' fzf-min-height 30
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa --color=always $realpath'
zstyle ':fzf-tab:complete:cd:*' popup-pad 30 0
zstyle ':fzf-tab:complete:cht.sh:argument-1' fzf-preview 'cht.sh $word'
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

# zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ${(Q)realpath}'

### fzf-tab-source
zstyle ':fzf-tab:sources' config-directory /the/directory/containing/your/source.zsh

### fzf-zsh-plugin
export FZF_PREVIEW_ADVANCED=true

### git
# Set a custom prefix for the generated aliases. The default prefix is 'G'.
zstyle ':zim:git' aliases-prefix 'g'

### ohmyzsh/nvm
# zstyle ':omz:plugins:nvm' lazy yes
# zstyle ':omz:plugins:nvm' lazy-cmd eslint prettier typescript tsc
# zstyle ':zim:ohmyzsh:plugins:nvm' lazy yes

### pacman
# zstyle ':zim:pacman' frontend 'powerpill'
# zstyle ':zim:pacman' helpers 'paru'

## termtitle
# set the titles to show the command name typed by the user while the command
# is being executed and then the current directory name after the command ended
# (i.e. before each prompt)
zstyle ':zim:termtitle' hooks 'preexec' 'precmd'
zstyle ':zim:termtitle:preexec' format '${${(A)=1}[1]}'
zstyle ':zim:termtitle:precmd'  format '%1~'

### zim
# use degit instead of git
zstyle ':zim:zmodule' use 'degit'

### zsh-autosuggestion
# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

### zsh-syntax-highlighting
# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor root)


#########
# zimfw #
#########
ZIM_HOME=${XDG_CONFIG_HOME:-$HOME/.config}/zim

# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi

# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi

# Initialize modules.
source ${ZIM_HOME}/init.zsh


#####################
# post zimfw config #
#####################

zmodload -F zsh/terminfo +p:terminfo

# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
for key ('k') bindkey -M vicmd ${key} history-substring-search-up
for key ('j') bindkey -M vicmd ${key} history-substring-search-down
unset key

# exa
alias ls='exa --group-directories-first --icons --classify'

########
# eval #
########
eval "$(starship init zsh)"
