#!/bin/bash

sudo pacman -Syu

sh /home/tom/.config/xinit.sh

sudo pacman -S zsh networkmanager dhcpcd wget dmenu git htop sxhkd pulseaudio pulseaudio-alsa pulseaudio-bluetooth alsa-utils xcompmgr xorg-server xorg-xrandr xorg.xinit xorg-xset xorg-xrdb xorg-xsetroot xorgproto xorg-xmodmap xorg-setxkbmap xorg-xprop xorg-xauth xwallpaper unzip sxiv

mkdir /home/tom/repos
cd /home/tom/repos
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -S brave-bin ttf-font-awesome ttf-material-design-icons-desktop-git

cd /home/tom/repos
git clone git://git.suckless.org/dwm
cd dwm
git remote add tom https://github.com/ImFlush/dwm
git pull tom

cd /home/tom/repos
git clone https://git.suckless.org/st
cd st
git remote add tom https://github.com/ImFlush/st.git
git pull tom

cd /home/tom/repos
git clone https://github.com/junegunn/fzf
