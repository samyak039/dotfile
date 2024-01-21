#
#            _
#    _______| |__   ___ _ ____   __
#   |_  / __| '_ \ / _ \ '_ \ \ / /
#  _ / /\__ \ | | |  __/ | | \ V /
# (_)___|___/_| |_|\___|_| |_|\_/
#
#
# @samyak039

############
# DEFAULTS #
############
export BROWSER="firefox-developer-edition"
export BROWSER2="brave-beta"
export EDITOR="nvim"
# export MANPAGER="sh -c 'col -bx | bat -l man -p --theme default'"
export READER="zathura"
export TERMINAL="wezterm"
# export TERM="screen-256color"
# export VISUAL="emacsclient -c -s doom -a 'emacs'"
export VSCODE="code-insiders"

############
# REQUIRED #
############
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"

#######
# TEMP #
########

export ANDROID_SDK_ROOT="${HOME}/Android/Sdk"
export PATH="${PATH}:${ANDROID_SDK_ROOT}/emulator"
export PATH="${PATH}:${ANDROID_SDK_ROOT}/platform-tools"
export PATH="${PATH}:${ANDROID_SDK_ROOT}/tools"
export PATH="${PATH}:${ANDROID_SDK_ROOT}/tools/bin"
# `cmdline-tolos/bin` AFTER `tools/bin` only. need to override the above one
export PATH="${PATH}:${ANDROID_SDK_ROOT}/cmdline-tools/latest/bin"

export CHROME_EXECUTABLE="/usr/bin/brave-beta"

