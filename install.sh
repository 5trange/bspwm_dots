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

refresh_repos
install_base
