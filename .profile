# shellcheck disable=SC1091
[ -d "$HOME/.config" ] || mkdir -p "$HOME/.config"
[ -f "$HOME/.config/env" ] && . "$HOME/.config/env"
[ -f "$HOME/.config/aliases" ] && . "$HOME/.config/aliases"

HISTFILE="$HOME/.config/history"

if [ "$(id -u)" -eq 0 ] && { [ -z "$SSH_CLIENT" ] && [ -z "$SSH_TTY" ]; }; then
    PS1="\[\e[1;31m\]\h\[\e[1;34m\] \w #\[\e[0m\] "
else
    PS1="\[\e[1;32m\]\u@\h\[\e[1;34m\] \w $\[\e[0m\] "

    clear
    pfetch
fi
