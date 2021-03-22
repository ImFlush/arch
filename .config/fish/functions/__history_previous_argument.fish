# !$
function __history_previous_argument
				set cmd (read -n 1)
				string match -qr '^[1-9]+$' "$cmd" && set arg (read -n 1) || set arg "" && string match  -qr '^[0-9]+$' "$arg" && set selArg (echo $history[$cmd] | cut -d' ' -f (math $arg + 1)) && commandline -i " $selArg" || commandline -i "°$cmd$arg"
				commandline -f repaint
end
