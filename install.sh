#!/bin/bash

setup_yay() {
	sudo pacman -S --needed --noconfirm base-devel
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si --noconfirm
	cd ..
	rm -rf yay
}

refresh_repos() {
	echo '*** Refreshing repositories... ***'
	sudo pacman -Sy
}

install_base_pkgs() {
    echo '*** Installing packages... ***'
	sudo pacman -S --needed --noconfirm - < pkglist.txt
}

install_aur_pkgs() {
	echo '*** Installing AUR packages... ***'
	yay -S polybar
	echo '*** Cleaning up... ***'
	yay -Yc --noconfirm
}

setup_services() {
	echo '*** Enabling services... ***'
	sudo systemctl enable lightdm.service
}

install_config() {
	echo '*** Installing config... ***'
	cp -r .config/ ~
	cp -r .local/ ~
	cp -r .fonts/ ~
	echo '*** Refreshing font cache... ***'
	fc-cache -f -v
	echo '*** Copying wallpapers... ***'
	cp -r Pictures/ ~
	echo '*** Setting up ZSH... ***'
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
}

setup_yay
refresh_repos
install_base_pkgs
install_aur_pkgs
setup_services
install_config
echo '*** Install complete! ***'
echo '*** You might want to install display drivers though. ***'
