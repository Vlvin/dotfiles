function pywal {
        wallpaper="$(find "$XDG_CONFIG_HOME"/wallpapers -type f | shuf -n 1)"

	exec 3>&2
        exec 4>&1
	exec 2> /dev/null # mute errors
	exec 1> /dev/null # mute out
      wal -i "$wallpaper" > /dev/null
      swww img $wallpaper > /dev/null  # set wallpaper 
	exec 2>&3 # unmute errors
	exec 1>&4 # unmute out
}

export pywal
