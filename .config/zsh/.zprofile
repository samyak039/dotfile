#
#                         __ _ _
#    _____ __  _ __ ___  / _(_) | ___
#   |_  / '_ \| '__/ _ \| |_| | |/ _ \
#  _ / /| |_) | | | (_) |  _| | |  __/
# (_)___| .__/|_|  \___/|_| |_|_|\___|
#       |_|
#
# @samyak039

########
# PATH #
########

# bin
export PATH="${PATH}:${XDG_BIN_HOME:-$HOME/.local/bin}"
export PATH="${PATH}:${SCRIPT:-$HOME/script}"
export PATH="${PATH}:${SCRIPT:-$HOME/script}/crt"
export PATH="${PATH}:${SCRIPT:-$HOME/script}/statusbar"
export PATH="${PATH}:${XDG_DATA_HOME:-$HOME/.local/share}/applications"
export PATH="${PATH}:${XDG_DATA_HOME:-$HOME/.local/share}/doomemacs/bin"

# dart & flutter
export FLUTTER_ROOT="${XDG_DATA_HOME:-$HOME/.local/share}/fvm/default"
#export FLUTTER_ROOT=$(which flutter | rev | cut -d / -f3- | rev)
export PATH="${PATH}:$HOME/.pub-cache/bin"
export PATH="${PATH}:${XDG_DATA_HOME:-$HOME/.local/share}/fvm/default/bin"
export PATH="${PATH}:/usr/lib/dart/bin"

# java & android
export JAVA_HOME='/usr/lib/jvm/default'
export ANDROID_SDK_ROOT='/opt/android-sdk'
export PATH="${PATH}:${JAVA_HOME:-/usr/lib/jvm/default}/bin"
export PATH="${PATH}:${ANDROID_SDK_ROOT:-/opt/android-sdk}/emulator"
export PATH="${PATH}:${ANDROID_SDK_ROOT:-/opt/android-sdk}/platform-tools"
export PATH="${PATH}:${ANDROID_SDK_ROOT:-/opt/android-sdk}/tools"
export PATH="${PATH}:${ANDROID_SDK_ROOT:-/opt/android-sdk}/tools/bin"
# `cmdline-tolos/bin` AFTER `tools/bin` only. need to override the above one
export PATH="${PATH}:${ANDROID_SDK_ROOT:-/opt/android-sdk}/cmdline-tools/latest/bin"

###################
# XDG Directories #
###################
export XDG_BIN_HOME="$HOME/.local/bin"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_RUNTIME_DIR="/run/user/$UID"

export BIN="$XDG_BIN_HOME"
export CONFIG="$XDG_CONFIG_HOME"
export CACHE="$XDG_CACHE_HOME"
export DATA="$XDG_DATA_HOME"
export SCRIPT="$HOME/script"

#######
# XDG #
#######
export DOOMDIR="$XDG_CONFIG_HOME/doom"
export FVM_HOME="$XDG_DATA_HOME/fvm"
# export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export FZF_PATH="$XDG_DATA_HOME/fzf"

#######
# ENV #
#######

# android studio
export _JAVA_AWT_WM_NONREPARENTING=1

# Brave -> Chrome
export CHROME_EXECUTABLE="/usr/bin/brave"

# https://github.com/oldratlee/hacker-quotes
export ZSH_HACKER_QUOTES_ENABLE_WHEN_INTERACTIVE=true

# nodejs
export NVM_DIR="$XDG_DATA_HOME/nvm"
source /usr/share/nvm/init-nvm.sh

# PNPM
export PNPM_HOME="/home/samyak/.local/share/pnpm"
# case ":$PATH:" in
#   *":$PNPM_HOME:"*) ;;
#   *) export PATH="$PNPM_HOME:$PATH" ;;
# esac
export PATH="${PNPM_HOME}:${PATH}"

# python
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
# eval "$(_PIPENV_COMPLETE=zsh_source pipenv)"

# zsh
export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"

#############
# XDG-Ninja #
#############
alias svn="svn --config-dir $XDG_CONFIG_HOME/subversion"
export ATOM_HOME="$XDG_DATA_HOME/atom"
export CABAL_CONFIG="$XDG_CONFIG_HOME/cabal/config"
export CABAL_DIR="$XDG_DATA_HOME/cabal"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export ERRFILE="$XDG_CACHE_HOME/X11/xsession-errors"
export GOPATH="$XDG_DATA_HOME/go"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export LEDGER_FILE="$HOME/paper/ledger/hledger.journal"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
# export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export PYTHONSTARTUP="/etc/python/pythonrc"
export STACK_XDG=1
export STACK_ROOT="$XDG_DATA_HOME/stack"
export TERMINFO="$XDG_DATA_HOME/terminfo"
export TERMINFO_DIRS="$XDG_DATA_HOME/terminfo:/usr/share/terminfo"
export TEXMFVAR="$XDG_CACHE_HOME/texlive/texmf-var"
export WAKATIME_HOME="$XDG_CONFIG_HOME/wakatime"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
# export npm_config_cache="$XDG_CACHE_HOME/npm"
# export npm_config_init_module="$XDG_CONFIG_HOME/npm/config/npm-init.js"
# export npm_config_prefix="$XDG_DATA_HOME"
# export npm_config_tmp="$XDG_RUNTIME_DIR/npm"
# export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"

##########
# STARTX #
##########
[[ -z "${DISPLAY}" ]] && [[ $XDG_VTNR -eq 1 ]] && exec startx "$XDG_CONFIG_HOME/X11/xinitrc"
