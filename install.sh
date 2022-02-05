#!/bin/bash

install_base() {
	echo 'Remember to run this script as superuser!'
	refresh_repos
    	echo 'Installing packages...'
	pacman -S --needed --noconfirm - < pkglist.txt
}

refresh_repos() {
	echo 'Refreshing repositories...'
	pacman -Sy
}

setup_yay() {
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si
	cd ..
	rm -rf yay
}

setup_yay
refresh_repos
install_base
