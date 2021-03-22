# sources
[ -f $HOME/.scripts/.generate-alias ] && $HOME/.scripts/.generate-alias "fish" | source
[ -f $HOME/.scripts/.generate-envvars ] && $HOME/.scripts/.generate-envvars "fish" | source
[ -f $HOME/.scripts/fuzzy ] && source $HOME/.scripts/fuzzy
source $XDG_CONFIG_HOME/fish/functions/*.fish

# settings
fish_vi_key_bindings
set fish_greeting

# git prompt
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_hide_untrackedfiles 1

set -g __fish_git_prompt_color_branch magenta #bold
set -g __fish_git_prompt_showupstream "informative"
set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_prefix ""

set -g __fish_git_prompt_char_stagedstate "●"
set -g __fish_git_prompt_char_dirtystate "✚"
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_char_conflictedstate "✖️"
set -g __fish_git_prompt_char_cleanstate "✔️"

set blue (set_color blue)
set yellow (set_color yellow)
set normal (set_color normal)
set red (set_color red)
set green (set_color green)

set -g __fish_git_prompt_color_dirtystate blue
set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
set -g __fish_git_prompt_color_cleanstate green #bold

# prompt
function fish_prompt
		set __fish_git_prompt_color 'yes'

		# [DATE] usr@host git 󰞷
		printf '[%s%s%s] %s%s%s@%s %s%s%s%s 󰞷  ' \
		(set_color green) (date +"%H:%M") (set_color normal) \
		(set_color green) $USER (set_color normal) \
		$hostname \
		(set_color yellow) (prompt_pwd) (set_color normal) \
		(fish_git_prompt)
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
