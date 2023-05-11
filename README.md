# Debian ISO release builder

## Purpose

The project facilitetes using live-build package on Debian. It allows
to build customized iso install edge appliences, more or less demanding
in terms of disk/ram/cpu.

## Images build with live-build

The version of Debian used is: 11.3 (bullseye) with minbase. The images may
customized in a special way with commands in build.sh script wchih launches
live-build command lb wioth appropriate paramteres and specific configuration
files.

## Usage

### Make file

The main make file allows to work on all images. It provieds however a base
for all specific image dir make files so that they need just to include it.

WARNING: Sudo access is required to run the commands.

### Common make file targets

The main make file targets are:

- build-all
- build
- build-iso
- build-hdd
- clean-all
- clean
- install
- test-iso
- test-hdd

### Specific customized builders

A bulder directory is where the build target is executed. This script
contains specific paramters and commands used to shape an image of live
image.

## Installation

It is done with make install target. It installs live-build and kvm packages
on debian system.

WARNING: The custom apt repo access must be added in /etc/apt/sources.list config file.