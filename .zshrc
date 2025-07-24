source $HOME/.profile
guesses=("$XDG_CONFIG_HOME/shellrc" "$HOME/.dotfiles/shellrc" "$HOME/.shellrc")
discover_rc_path () {
	for rc_path in $guesses; do
		if [ -d "$rc_path" ]; then
			echo "$rc_path"
			return
		fi
	done
	echo ""
}

RC_PATH=$(discover_rc_path)

if [[ $RC_PATH == "" ]]; then
	echo "No shellrc was discovered"
	echo "lookup locations are:"
	for rc_path in $guesses; do
		echo "	$rc_path"
	done
	return
fi


for rc in $(ls $RC_PATH); do
		source "$RC_PATH/$rc"
done
