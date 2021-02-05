#!/bin/bash

ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

hwclock --systohc

echo "de_DE.UTF-8 UTF-8\nde_DE ISO-8859-1\nde_DE@euro ISO-8859-15" > /etc/locale.gen
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
