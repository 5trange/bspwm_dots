# BSPWM Arch Linux Setup
An arctic, north-bluish color palette setup for BSPWM.

## Screenshots
![image](https://user-images.githubusercontent.com/64513428/153715832-86d003e8-1e87-4f4b-8c2f-fdf63d036d39.png)

## Installation
1. Install dependencies using Pacman
```
sudo pacman -Sy --needed base-devel
```

2. Clone the repo
```
git clone https://github.com/5trange/bspwm-dots
cd bspwm-dots
```

3. Execute the install script
```
./install.sh
```

## nvidia-driver-problem-llvmpipe
For some reason, The NVIDIA proprietary drivers choose ```llvmpipe``` to render OpenGL. To fix this:

First, enable DRM Kernel mode setting by adding the ```nvidia-drm.modeset=1``` kernel parameter.<br>
To add the ```nvidia-drm.modeset=1``` kernel parameter, edit the ```/etc/default/grub``` file and append the kernel options between the ```GRUB_CMDLINE_LINUX_DEFAULT``` line. [Follow this.](https://wiki.archlinux.org/title/Kernel_parameters#GRUB)
After that, regenerate GRUB config.

Then, edit the ```/etc/mkinitcpio.conf``` file and add ```nvidia nvidia_modeset nvidia_uvm nvidia_drm``` into the modules section. [Follow this.](https://wiki.archlinux.org/title/Mkinitcpio#MODULES)

Then, manually regenerate the initramdisk by running ```mkinitcpio -p linux-zen``` (Assuming we are using ```linux-zen```). AFAIK this step needs to be repeated after every driver update.

After that, reboot.
