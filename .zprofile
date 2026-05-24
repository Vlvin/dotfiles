export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
[ -d  "$HOME/.local/bin/env" ] && source "$HOME/.local/bin/env"
[ -d  "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
[ -d  "$HOME/.local/share/bob/env/env.sh" ] && source "$HOME/.local/share/bob/env/env.sh"
[ -d "$HOME/.cargo/bin" ] && PATH=$HOME/.cargo/bin:$PATH
