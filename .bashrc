# shellcheck disable=1091
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_BIN_HOME="${XDG_BIN_HOME:-$HOME/.local/bin}"

[ -d "$XDG_CONFIG_HOME" ] || mkdir -p "$XDG_CONFIG_HOME"
[ -d "$XDG_CACHE_HOME" ] || mkdir -p "$XDG_CACHE_HOME"
[ -d "$XDG_BIN_HOME" ] || mkdir -p "$XDG_BIN_HOME"
[ -d "$XDG_DATA_HOME" ] || mkdir -p "$XDG_DATA_HOME"
[ -f "$XDG_CONFIG_HOME/env" ] && . "$XDG_CONFIG_HOME/env"
[ -f "$XDG_CONFIG_HOME/aliases" ] && . "$XDG_CONFIG_HOME/aliases"

HISTFILE="$XDG_CONFIG_HOME/history"

if [ "$EUID" = 0 ]; then
    PS1="\[\e[1;31m\]\h\[\e[1;34m\] \w #\[\e[0m\] "
else
    PS1="\[\e[1;32m\]\u@\h\[\e[1;34m\] \w $\[\e[0m\] "

    clear
    pfetch
fi
