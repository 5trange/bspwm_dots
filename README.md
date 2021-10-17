# bspwm-desktop
An arctic, north-bluish color palette setup for BSPWM.

## nvidia-driver-problem-llvmpipe
For some reason, The NVIDIA proprietary drivers choose ```llvmpipe``` to render OpenGL. To fix this:

First, enable DRM Kernel mode setting by adding the ```nvidia-drm.modeset=1``` kernel parameter.<br>
To add the ```nvidia-drm.modeset=1``` kernel parameter, edit the ```/etc/default/grub``` file and append the kernel options between the ```GRUB_CMDLINE_LINUX_DEFAULT``` line. [Follow this.](https://wiki.archlinux.org/title/Kernel_parameters#GRUB)

Then, edit the ```/etc/mkinitcpio.conf``` file and add ```nvidia nvidia_modeset nvidia_uvm nvidia_drm``` into the modules section. [Follow this.](https://wiki.archlinux.org/title/Mkinitcpio#MODULES)

Then, manually regenerate the initramdisk by running ```mkinitcpio -p linux-zen``` (Assuming we are using ```linux-zen```). AFAIK this step needs to be repeated after driver updates.

After that, reboot.

## Steam font fix
Steam requires some fonts to work properly.
Either install ```ttf-liberation``` or
[follow this thread](https://steamcommunity.com/app/221410/discussions/0/864961175388383181/)
