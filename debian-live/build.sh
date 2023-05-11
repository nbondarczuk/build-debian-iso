#!/bin/bash

#
# default config from
# https://lecorbeausvault.wordpress.com/2021/01/10/quickly-build-a-custom-bootable-installable-debian-live-iso-with-live-build/
#

binary=${1:-hdd}
distribution=${2:-bullseye}

lb clean --purge
rm -Rf config .build build.log

lb config -b $binary \
   -d $distribution \
   --debian-installer live \
   --debian-installer-distribution $distribution \
   --debian-installer-gui false \
   --archive-areas "main contrib non-free" \
   --debootstrap-options "--variant=minbase"

lb build 2>&1 | tee build.log
