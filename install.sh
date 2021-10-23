#!/bin/bash

install_base() {
	echo 'Remember to run this script as superuser!'
	refresh_repos
    echo 'Installing packages...'
	pacman -S bpswm sxhkd rofi papiprus-icon-theme arc-gtk-theme dunst alacritty pcmanfm ttf-font-awesome ttf-jetbrains-mono ttf-liberation nitrogen viewnior polkit lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
}

refresh_repos() {
	echo 'Refreshing repositories...'
	pacman -Sy
}

setup_lightdm() {
	systemctl enable lighdm.service
}

install_base