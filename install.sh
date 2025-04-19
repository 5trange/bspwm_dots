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
	echo '*** Enabling Mutillib... ***'
	mline=$(grep -n "\\[multilib\\]" /etc/pacman.conf | cut -d: -f1)
	rline=$(($mline + 1))
	sudo sed -i ''$mline's|#\[multilib\]|\[multilib\]|g' /etc/pacman.conf
	sudo sed -i ''$rline's|#Include = /etc/pacman.d/mirrorlist|Include = /etc/pacman.d/mirrorlist|g' /etc/pacman.conf

	echo '*** Refreshing repositories... ***'
	sudo pacman -Syu
}

install_base_pkgs() {
    echo '*** Installing packages... ***'
	sudo pacman -S --needed --noconfirm - < pkglist.txt
}

install_aur_pkgs() {
	echo '*** Installing AUR packages... ***'
	yay -S polybar arc-gtk-theme librewolf-bin
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

	echo '*** Installing XORG config... ***'
	sudo cp xorg_configs/* /etc/X11/xorg.conf.d/

	echo '*** Refreshing font cache... ***'
	fc-cache -f -v

	echo '*** Copying wallpapers... ***'
	cp -r Pictures/ ~
}

setup_yay
refresh_repos
install_base_pkgs
install_aur_pkgs
setup_services
install_config
echo '*** Install complete! ***'
