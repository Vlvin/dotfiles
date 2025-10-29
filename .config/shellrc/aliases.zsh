function activate {
	venv=$1
    if [[ "$venv" -eq "" ]]; then
        venv='.venv'
    fi
	if [[ -f $venv/bin/activate ]]; then 
		. .venv/bin/activate; 
	else
		echo \"not a python project\"; 
	fi
}
alias av='activate'
alias dv='deactivate'

alias denv='. $HOME/.zshrc'
alias tmux='wl-copy $(pwd);cd ~; tmux'
alias ls='ls --color=auto'

alias nvim='bob run nightly'
