# sources
[ -f $HOME/.scripts/.generate-alias ] && $HOME/.scripts/.generate-alias "fish" | source
[ -f $HOME/.scripts/.generate-envvars ] && $HOME/.scripts/.generate-envvars "fish" | source
[ -f $HOME/.scripts/fuzzy.fish ] && source $HOME/.scripts/fuzzy.fish
source $XDG_CONFIG_HOME/fish/functions/*.fish
source $XDG_CONFIG_HOME/fish/functions/fzf.fish

# settings
fish_vi_key_bindings
set fish_greeting
set fish_handle_reflow 1

# prompt
function fish_prompt
		__fish_prompt -u -h -p -b -g
end

#function fish_mode_prompt
#end

function fish_command_not_found
		echo "command "(set_color red)"'$argv[1]'"(set_color normal)" not found!"
end

function udo
		abbr -q $argv[1] && set argv[1] (abbr | grep " $argv[1] " | cut -b 15- | cut -d' ' -f2- | cut -d"'" -f2)
		/usr/bin/sudo $argv
end

# binds
bind --mode insert ! __history_previous_command
bind --mode insert ° __history_previous_argument

#alias
#alias udo /usr/bin/sudo

# Start X at login
if status is-login
	[ (tty) = "/dev/tty1" ] || [ (tty) = "/dev/tty2" ] && exec startx $XINITRC
end
