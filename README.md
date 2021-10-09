# bspwm-desktop
bspwm dot files from my desktop setup.

## nvidia-llvmpipe-issue
First, enable DRM Kernel mode setting.<br>
To do this add the ```nvidia-drm.modeset=1``` kernel parameter by manually editing ```/boot/grub/grub.cfg```. [Follow this.](https://wiki.archlinux.org/title/Kernel_parameters#GRUB)<br><br>
Then, edit the ```/etc/mkinitcpio.conf``` file and add ```nvidia nvidia_modeset nvidia_uvm nvidia_drm``` into the modules section.<br><br>
Finally manually generate the initial ramdisk by running ```mkinitcpio -p linux-zen``` assuming we are using ```linux-zen```.<br><br>
This step must be done again after a driver update.

## Steam font fix
Steam requires some fonts to work properly.<br>
Either install ```ttf-liberation``` or
[follow this thread](https://steamcommunity.com/app/221410/discussions/0/864961175388383181/)
