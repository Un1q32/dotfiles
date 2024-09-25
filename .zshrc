# shellcheck disable=SC2034,SC1091,SC1090
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_BIN_HOME="${XDG_BIN_HOME:-$HOME/.local/bin}"

[ -d "$XDG_CONFIG_HOME" ] || mkdir -p "$XDG_CONFIG_HOME"
[ -d "$XDG_CACHE_HOME" ] || mkdir -p "$XDG_CACHE_HOME"
[ -d "$XDG_BIN_HOME" ] || mkdir -p "$XDG_BIN_HOME"
[ -d "$XDG_DATA_HOME/zsh" ] || mkdir -p "$XDG_DATA_HOME/zsh"
[ -f "$XDG_CONFIG_HOME/env" ] && . "$XDG_CONFIG_HOME/env"
[ -f "$XDG_CONFIG_HOME/aliases" ] && . "$XDG_CONFIG_HOME/aliases"

HISTFILE="$XDG_CONFIG_HOME/history"
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

if [ "$(uname -s)" = "Darwin" ]; then
    compinit -d "$XDG_CACHE_HOME/zcompdump" -i
else
    compinit -d "$XDG_CACHE_HOME/zcompdump"
fi

if [ "$EUID" = 0 ]; then
    PROMPT=$'%{\e[1;31m%}%M%{\e[1;34m%} %~ #%{\e[0m%} '
else
    PROMPT=$'%{\e[1;32m%}%n@%M%{\e[1;34m%} %~ $%{\e[0m%} '

    clear
    pfetch

    if [ -d "$XDG_DATA_HOME/zsh/plugins" ]; then
        for plug in "$XDG_DATA_HOME"/zsh/plugins/*/*.plugin.zsh; do
            . "$plug"
        done
    fi
    unset plug
fi
