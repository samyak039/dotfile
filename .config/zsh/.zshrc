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
# Set editor default keymap to emacs (`-e`) or vi (`-v`)
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
# advmv
alias m='advmv -ig'
# dotfile config
alias cfg="/usr/bin/git --git-dir=$CONFIG/dotfile --work-tree=$HOME"
# no confusion between doas --option or cmd --option
alias doas='doas --'

# leetcode-cli
alias ll="leetcode"
alias lld="leetcode data"
alias lls="leetcode stat"
llp() { leetcode pick $q; }
lle() { leetcode edit $q; }
llt() { leetcode test $q; }
llx() { leetcode exec $q; }

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
alias codium=code --extensions-dir "$XDG_DATA_HOME/vscode"
alias ldgr='ledger --init-file "$XDG_CONFIG_HOME"/ledgerrc --sort date'
alias startx='startx $XDG_CONFIG_HOME/X11/xinitrc'
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"

###########################
# pre zimfw customization #
###########################

### completion
zstyle ':completion::complete:*' cache-path ${XDG_CACHE_HOME}/zsh/zcompcache

### fzf-zsh-plugin
export FZF_PREVIEW_ADVANCED=true

### git
# Set a custom prefix for the generated aliases. The default prefix is 'G'.
# zstyle ':zim:git' aliases-prefix 'g'

### pacman
# zstyle ':zim:pacman' frontend 'powerpill'
# zstyle ':zim:pacman' helpers 'paru'

### termtitle TODO
# zstyle ':zim:termtitle' format '%~'

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

##########
# zoxide #
##########
eval "$(zoxide init zsh)"

############
# starship #
############
eval "$(starship init zsh)"
