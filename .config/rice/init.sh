#!/bin/bash

echo "\n/bin/zsh\n/usr/bin/zsh" >> /etc/shells

[ ! -d /etc/zsh ] && mkdir /etc/zsh
touch /etc/zsh/zshenv
echo "#!/bin/sh\n\nexport ZDOTDIR='$HOME/.config/zsh'\nexport HISTFILE='$HOME/.local/share/zsh/history'" > /etc/zsh/zshenv

ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

hwclock --systohc

echo "\nde_DE.UTF-8 UTF-8\nde_DE ISO-8859-1\nde_DE@euro ISO-8859-15" >> /etc/locale.gen
locale-gen

touch /etc/locale.conf
echo "LANG=de_DE.UTF-8" > /etc/locale.conf

touch /etc/vconsole.conf
echo "KEYMAP=de-latin1" > /etc/vconsole.conf

touch /etc/hostname
echo "arch" > /etc/hostname

touch /etc/hosts
echo "127.0.0.1	localhost\n::1		localhost\n127.0.1.1	arch.localdomain	arch" > /etc/hosts

mkinitcpio -P

source $HOME/.config/rice/alias
