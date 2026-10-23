export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
[ -d /usr/local/lib/pkgconfig ] && export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig"
[ -f  "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"
[ -f  "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
[ -f  "$HOME/.local/share/bob/env/env.sh" ] && . "$HOME/.local/share/bob/env/env.sh"
[ -d "$HOME/.cargo/bin" ] && PATH=$HOME/.cargo/bin:$PATH
[ -d  "$HOME/.local/bin" ] && PATH=$HOME/.local/bin:$PATH
[ -d "$HOME/.local/share/pnpm/bin" ] && PATH=$HOME/.local/share/pnpm/bin:$PATH
# runsvdir $XDG_CONFIG_HOME/service &> /dev/null
