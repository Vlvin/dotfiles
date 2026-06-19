export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
[ -f  "$HOME/.local/bin/env" ] && source "$HOME/.local/bin/env"
[ -f  "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
[ -f  "$HOME/.local/share/bob/env/env.sh" ] && source "$HOME/.local/share/bob/env/env.sh"
[ -d "$HOME/.cargo/bin" ] && PATH=$HOME/.cargo/bin:$PATH
[ -d  "$HOME/.local/bin" ] &&  PATH=$HOME/.local/bin:$PATH
# runsvdir $XDG_CONFIG_HOME/service &> /dev/null
