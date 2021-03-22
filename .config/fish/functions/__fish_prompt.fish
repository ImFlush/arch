#!/usr/bin/fish

function __fish_prompt
		set __fish_git_prompt_color 'yes'
		set -x __status $status
		__prompt_settings

		set -q argv[1] && __select_prompt $argv || __normal_prompt
end

function __select_prompt

		for i in $argv
				switch $i
				case "-d"
						__date
				case "-u"
						__user
				case "-h"
						__host
				case "-p"
						__path
				case "-b"
						__bad_status
				case "-g"
						__git
				end
		end

		printf ' 󰞷  '
end

function __date
		printf '[%s%s%s] ' \
		(set_color green) (date +"%H:%M") (set_color normal)
end

function __user
		printf '%s%s%s' \
		(set_color green) $USER (set_color normal)
end

function __host
		printf '@%s' \
		$hostname
end

function __path
		printf ' %s%s%s' \
		(set_color yellow) (prompt_pwd) (set_color normal)
end

function __bad_status
		[ $__status != 0 ] && printf ' %s[%s]%s' \
		(set_color red) $__status (set_color normal)
end

function __git
		printf '%s' \
		(fish_git_prompt)
end

### basic prompt
function __normal_prompt
		# [DATE] usr@host ~ 󰞷
		printf '%s%s%s@%s %s%s%s 󰞷  ' \
		(set_color green) $USER (set_color normal) \
		$hostname \
		(set_color yellow) (prompt_pwd) (set_color normal)
end

### prompt settings
function __prompt_settings
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
end
