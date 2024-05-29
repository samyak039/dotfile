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
export TERMINAL_ALT="alacritty"
# export TERM="screen-256color"
# export VISUAL="emacsclient -c -s doom -a 'emacs'"
export VSCODE="code"


############
# REQUIRED #
############
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"


########
# TEMP #
########
export LEDGER_FILE_CURRENT="$HOME/papers/ledger/2023-24.journal"

########
# EVAL #
########
eval "$(jenv init -)"
# eval "$(starship init zsh)"
eval "$(zoxide init zsh --cmd d)"
