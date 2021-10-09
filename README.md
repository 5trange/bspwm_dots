# bspwm-desktop
bspwm dot files with some patches for the desktop setup.

## nvidia-llvmpipe-fix
The recent updates switches the OpenGL renderer to llvmpipe, and causes many issues with picom.
[Temporary fix for this is here.](https://bbs.archlinux.org/viewtopic.php?id=258201)

Or add these lines to your xorg config.
```
Section "Files"
    ModulePath "/usr/lib/nvidia/xorg"
    ModulePath "/usr/lib/xorg/modules"
EndSection
```
