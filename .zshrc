# shellcheck disable=SC2034,SC1091,SC1090
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

[ -n "$XDG_CONFIG_HOME" ] && CONF="$XDG_CONFIG_HOME" || CONF="$HOME/.config"
[ -n "$XDG_CACHE_HOME" ] && CACHE="$XDG_CACHE_HOME" || CACHE="$HOME/.cache"
[ -n "$XDG_DATA_HOME" ] && DATA="$XDG_DATA_HOME" || DATA="$HOME/.local/share"
[ -n "$XDG_BIN_HOME" ] && BIN="$XDG_BIN_HOME" || BIN="$HOME/.local/bin"
ZSHDATA="$DATA/zsh"

[ -d "$CONF" ] || mkdir -p "$CONF"
[ -d "$CACHE" ] || mkdir -p "$CACHE"
[ -d "$ZSHDATA" ] || mkdir -p "$ZSHDATA"
[ -f "$CONF/env" ] && . "$CONF/env"
[ -f "$CONF/aliases" ] && . "$CONF/aliases"
[ -d "$BIN" ] || mkdir -p "$BIN" && export PATH="$BIN:$PATH"

export HISTFILE="$CACHE/history"
export HISTSIZE=10000
export SAVEHIST=10000
setopt appendhistory

if [ "$(uname -s)" = "Darwin" ]; then
    compinit -d "$CACHE/zcompdump" -i
else
    compinit -d "$CACHE/zcompdump"
fi

if [ "$EUID" -eq 0 ]; then
    PROMPT=$'%{\e[1;31m%}%M%{\e[1;34m%} %~ #%{\e[0m%} '
else
    PROMPT=$'%{\e[1;32m%}%n@%M%{\e[1;34m%} %~ $%{\e[0m%} '

    clear
    pfetch

    if [ -d "$ZSHDATA/plugins" ]; then
        for plug in "$ZSHDATA"/plugins/*/*.plugin.zsh; do
            . "$plug"
        done
    fi
    unset plug
fi
