function fish_git_prompt
		__fish_is_git_repository && \
		printf ' (%s|%s/%s)' \
		(set_color green)(git branch | grep "*" | awk '{ print $2 }')(set_color normal) \
		(set_color yellow)(git status -s | grep "M" | wc -l)(set_color normal) \
		(set_color magenta)(git status -s | grep "??" | wc -l)(set_color normal)
end
