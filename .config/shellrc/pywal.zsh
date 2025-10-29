function update_kitty_theme {
        rm $XDG_CONFIG_HOME/kitty/current-theme.conf
        cp $HOME/.cache/wal/colors-kitty.conf $XDG_CONFIG_HOME/kitty/current-theme.conf
}
function update_vim_theme {
        rm $XDG_CONFIG_HOME/vim/colorscheme.vim
        cp $HOME/.cache/wal/colors-wal.vim $XDG_CONFIG_HOME/vim/colorscheme.vim
}
function update_waybar_theme {
        rm $XDG_CONFIG_HOME/waybar/theme.css
        cp $HOME/.cache/wal/colors-waybar.css $XDG_CONFIG_HOME/waybar/theme.css
}
function update_wofi_theme {
        rm $XDG_CONFIG_HOME/wofi/colors
        cp $HOME/.cache/wal/colors $XDG_CONFIG_HOME/wofi/colors
}
function pywal {
        wallpaper="$(find "$XDG_CONFIG_HOME"/wallpapers -type f | shuf -n 1)"

	exec 3>&2
        exec 4>&1
	exec 2> /dev/null # mute errors
	exec 1> /dev/null # mute out
        wal -i "$wallpaper" > /dev/null
	swww img $wallpaper > /dev/null  # set wallpaper 
        update_kitty_theme > /dev/null
        update_vim_theme > /dev/null
        update_waybar_theme > /dev/null
        update_wofi_theme > /dev/null
	exec 2>&3 # unmute errors
	exec 1>&4 # unmute out
}

export pywal
