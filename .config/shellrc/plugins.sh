PLUGINS_DIR=$XDG_CONFIG_HOME/shellrc/plugins

for plugin in $(ls $PLUGINS_DIR); do
        source $PLUGINS_DIR/$plugin/$plugin.plugin.zsh
done
source $XDG_CONFIG_HOME/shellrc/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

function source_dir {
	local source_path=$1
	echo $source_path
	echo $(ls $source_path)
	echo $PATH
	if [[ -d $source_path ]]; then
		for file in $(ls $source_path); do
			source "$source_path/$file"
		done
	else;
        echo "$path is not a directory"
		return
	fi
}
# source_dir $PLUGINS_DIR/oh-my-zsh-defaults/

