################################################################################
#   COMPINSTALL
################################################################################
zstyle ':completion:*' completer _list _oldlist _expand _complete _match _correct _approximate _prefix
zstyle ':completion:*' completions 1
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' glob 1
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '+m:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=* r:|=*' '+l:|=* r:|=*'
zstyle ':completion:*' max-errors 5 numeric
zstyle ':completion:*' menu select
zstyle ':completion:*' prompt '%e'
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' substitute 1
zstyle ':completion:*' word true
zstyle :compinstall filename '/home/samyak039/.config/zsh/.zshrc'

autoload -Uz compinit
compinit

autoload -Uz promptinit
promptinit
################################################################################
#   ZSH-NEWUSER-INSTALL
################################################################################
HISTFILE=~/.local/share/zsh/history
HISTSIZE=1000
SAVEHIST=100000
setopt autocd extendedglob nomatch notify
unsetopt beep

################################################################################
#   colors
#load colors
autoload colors && colors
for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
    eval $COLOR='%{$fg_no_bold[${(L)COLOR}]%}'  #wrap colours between %{ %} to avoid weird gaps in autocomplete
    eval BOLD_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
	eval BG_$COLOR='%{$bg_no_bold[${(L)COLOR}]%}'
done
eval RESET='%{$reset_color%}'

################################################################################
#   ANTIGEN
################################################################################
source /usr/share/zsh/share/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle adb
antigen bundle branch
antigen bundle command-not-found
antigen bundle copydir
antigen bundle copyfile
antigen bundle cp
antigen bundle dircycle
antigen bundle extract; alias ex=extract
antigen bundle history-substring-search
antigen bundle man
antigen bundle rand-quote
antigen bundle thefuck
antigen bundle vi-mode
antigen bundle spectrum

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
#antigen theme bureau
#antigen theme denysdovhan/spaceship-prompt

# Tell Antigen that you're done.
antigen apply

################################################################################
#   MY-CONFIG
################################################################################
source $CONFIG/aliasrc
source $ZDOTDIR/prompt

#eval "$(starship init zsh)"
