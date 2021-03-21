# bangbang
function __history_previous_command
				set input (read -n 1)
				string match -qr '^[0-9]+$' "$input" && commandline -i $history[$input] && commandline -f repaint || commandline -i "!$input"; commandline -f repaint
end

function __test
				echo "-a"
end
