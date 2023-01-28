# shellcheck disable=SC1091
[ "$XDG_CONFIG_HOME" ] && CONF="$XDG_CONFIG_HOME" || CONF="$HOME/.config"
[ "$XDG_CACHE_HOME" ] && CACHE="$XDG_CACHE_HOME" || CACHE="$HOME/.cache"
[ "$XDG_DATA_HOME" ] && DATA="$XDG_DATA_HOME" || DATA="$HOME/.local/share"
[ "$XDG_BIN_HOME" ] && BIN="$XDG_BIN_HOME" || BIN="$HOME/.local/bin"

[ -d "$CONF" ] || mkdir -p "$CONF"
[ -d "$CACHE" ] || mkdir -p "$CACHE"
[ -d "$DATA" ] || mkdir -p "$DATA"
[ -d "$BIN" ] || mkdir -p "$BIN" && export PATH="$BIN:$PATH"
[ -f "$CONF/env" ] && . "$CONF/env"
[ -f "$CONF/aliases" ] && . "$CONF/aliases"

HISTFILE="$CACHE/history"

if [ "$EUID" -eq 0 ]; then
    PS1="\[\e[01;31m\]\u@\h\[\e[01;34m\] \w #\[\e[0m\] "
else
    PS1="\[\e[01;32m\]\u@\h\[\e[01;34m\] \w $\[\e[0m\] "

    clear
    pfetch
fi
