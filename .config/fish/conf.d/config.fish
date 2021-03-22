# sources
[ -f $HOME/.scripts/.generate-alias ] && $HOME/.scripts/.generate-alias "fish" | source
[ -f $HOME/.scripts/.generate-envvars ] && $HOME/.scripts/.generate-envvars "fish" | source
[ -f $HOME/.scripts/fuzzy ] && source $HOME/.scripts/fuzzy
source $XDG_CONFIG_HOME/fish/functions/*.fish

# settings
fish_vi_key_bindings
set fish_greeting
set fish_handle_reflow 1

# prompt
function fish_prompt
		__fish_prompt -u -h -p -b -g
end

# binds
bind --mode insert ! __history_previous_command
bind --mode insert ° __history_previous_argument

#alias
alias udo /usr/bin/sudo

# Start X at login
if status is-login
	[ (tty) = "/dev/tty1" ] || [ (tty) = "/dev/tty2" ] && exec startx $XINITRC
end
