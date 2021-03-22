# bangbang
function __history_previous_command
				set input (read -n 1)
				string match -qr '^[1-9]+$' "$input" && commandline -i $history[$input] || commandline -i "!$input"
				commandline -f repaint
end
