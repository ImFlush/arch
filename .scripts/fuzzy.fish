set fzfstyle "--border=rounded"

function vsc 
		[ "$argv[1]" != "" ] && set file (find $HOME/.scripts -type f -printf '%P\n' | fzf -0 -f "$argv[1]" | head -1) || set file (find ~/.scripts -type f -printf '%P\n' | fzf $fzfstyle --prompt="$EDITOR ")
		#set file (find ~/.scripts -type f | fzf $fzfstyle --prompt="$EDITOR ")
		[ "$file" != "" ] && $EDITOR "$HOME/.scripts/$file"
end

function vco
		[ "$argv[1]" != "" ] && set file (find $HOME/.config -type f -printf '%P\n' | fzf -0 -f "$argv[1]" | head -1) || set file (find ~/.config -type f -printf '%P\n' | fzf $fzfstyle --prompt="$EDITOR ")
		[ "$file" != "" ] && $EDITOR "$HOME/.config/$file"
end

function gchf
		[ -d .git ] || return
    git checkout (git branch | fzf $fzfstyle --prompt='git checkout ' || exit) 
end

function c
    # cd $(find -type d | fzf $fzfstyle --prompt='cd ' || return)
	cd (find -type d | fzf $fzfstyle --prompt='cd ' || exit | sed -e 's= =\\ =g')
end

function dwmapply
		[ (pwd) != "/home/$USER/repos/dwm" ] && return
		git apply (find ~/downloads/dwm-patches/ -type f | fzf $fzfstyle --prompt='git apply ' || exit)
end

function stapply
		[ (pwd) != "/home/$USER/repos/st" ] && return
		git apply (find ~/downloads/st-patches/ -type f | fzf $fzfstyle --prompt='git apply ' || exit)
end
