[ -f $HOME/.scripts/.generate-envvars ] && $HOME/.scripts/.generate-envvars "posix" | source /dev/stdin

if [[ "$(tty)" = "/dev/tty1" ||  "$(tty)" = "/dev/tty2" ]]; then
		exec startx $XINITRC
fi
