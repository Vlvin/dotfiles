# # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# # Initialization code that may require console input (password prompts, [y/n]
# # confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi


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
	if [[ ${rc:0:1} == '-' ]]; then
		# do nothing
		# echo 'skip ' $rc
	else
		source "$RC_PATH/$rc"
	fi
done
