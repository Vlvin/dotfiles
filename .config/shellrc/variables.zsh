# xdg-settings set default-web-browser org.qutebrowser.qutebrowser.desktop
export BROWSER=librewolf
export XDG_MUSIC_DIR=$HOME/Music/
export EDITOR=nvim
# PATH=$PATH:~/.config/emacs/bin
PATH=$PATH:~/.local/bin/
[ -d "$HOME/.cargo/bin" ] && PATH=$HOME/.cargo/bin:$PATH
[ -d "$XDG_CONFIG_HOME/scripts" ] && PATH=$XDG_CONFIG_HOME/scripts:$PATH
[ -d "/var/lib/flatpak/exports/bin/" ] && PATH="/var/lib/flatpak/exports/bin/":$PATH
