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

function fzf_file_search() {
	local file=$(find ~ | fzf)
	if [ -n "$file" ]; then
		BUFFER="$(echo $BUFFER) $file"
		CURSOR=$#BUFFER
		zle redisplay
	fi
}
zle -N fzf_file_search
bindkey '^s' fzf_file_search
