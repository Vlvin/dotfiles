export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
[ -d  "$HOME/.local/bin/env" ] && source "$HOME/.local/bin/env"
[ -d  "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
