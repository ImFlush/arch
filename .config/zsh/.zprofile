[ -f ~/.config/rice/envvars.sh ] && source ~/.config/rice/envvars.sh

if [[ "$(tty)" = "/dev/tty1" ||  "$(tty)" = "/dev/tty2" ]]; then
		exec startx $XINITRC
fi
