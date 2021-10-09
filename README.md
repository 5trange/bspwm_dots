# bspwm-desktop
bspwm dot files from my desktop setup.

## nvidia-llvmpipe-fix
The recent updates switches the OpenGL renderer to llvmpipe, and causes many issues with picom.<br>
[Temporary fix for this is here.](https://bbs.archlinux.org/viewtopic.php?id=258201)

Or add these lines to the xorg config.
```
Section "Files"
    ModulePath "/usr/lib/nvidia/xorg"
    ModulePath "/usr/lib/xorg/modules"
EndSection
```

## Steam font fix
Steam requires some fonts to work properly.<br>
Either install ```ttf-liberation``` or
[follow this thread](https://steamcommunity.com/app/221410/discussions/0/864961175388383181/)
