#!bin/zsh

#bindkey -v

function fzf_z_search() {
	local target=$(z | sort -n | cut -c 12- | fzf )
	if [ -n "$target" ]; then
		BUFFER+="z $target"
		zle accept-line
	else
		return 1;
	fi
}
zle -N fzf_z_search
bindkey '^f' fzf_z_search

