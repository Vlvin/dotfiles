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

alias _nvim='~/.local/share/bob/$(cat ~/.local/share/bob/used)/bin/nvim'

function nvim {
  [ -v IS_NVIM_c ] && echo "Lanching nested nvim is pointless. You perhaps missclick" && return
  export IS_NVIM_c=HELLO
  NVIM_SOCK=$(mktemp -p $HOME/.cache/nvim/socks -t nvim.sock.XXX)
  NVIM_SESS=$HOME/.cache/nvim/sessions/${NVIM_SOCK##*/}
  ln -sn $NVIM_SOCK $NVIM_SESS
  rm $NVIM_SOCK
  _nvim --listen $NVIM_SESS $@
  unset IS_NVIM_c
}
function wqa {
  for sock in $(ls ~/.cache/nvim/socks/*); do
    _nvim --server $sock --remote-send "<CMD>wqa<CR>"
  done
}

function random {
  echo $(date -u +%N)
}

function random_wallpaper {
  [ "$WALLPAPER_PATH" = "" ] && WALLPAPER_PATH=$HOME"/.config/wallpapers"
  local wallpapers=("$WALLPAPER_PATH"/**/*)
  local len=${#wallpapers}
  local index=$(( ($( random ) % (len - 1)) + 1 ))
  echo "${wallpapers[index]}"
}
