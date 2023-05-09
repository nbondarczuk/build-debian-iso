# Debian ISO release builder

## Purpose

The project facilitetes using live-build package on Debian. It allows
to build customized iso install edge appliences, more or less demanding
in terms of disk/ram/cpu.

## Images

The version of Debian used is: 11.3 (bullseye) with minbase.

### debian-live

It is standard Debian image with XWindows GUI but terminal installer.
It can be used as reference for more elaborate images. The size
of the iso file is about 700 MB.

### debian-live-minimal

The purpose of this image is to create small install image fitting size of
USB key so taht it can be used for bootig the minimalistic Debian system.
It allows to add 3rd party packages to be installed in the live image.
The installer is terminal based to the image can be installed practicly
everywhere. It has very small disk/memory/cpu requirements. The size
of the iso file is 383,6 MB.