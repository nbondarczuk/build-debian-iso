#!/bin/bash

#
# default config from
# https://lecorbeausvault.wordpress.com/2021/01/10/quickly-build-a-custom-bootable-installable-debian-live-iso-with-live-build/
#

binary=${1:-iso}
distribution=${2:-bullseye}

lb clean
rm -Rf config .build build.log

echo "task-lxde-desktop iceweasel" >> config/package-lists/my.list.chroot

lb config -b $binary \
   -d $distribution \
   --debian-installer live \
   --debian-installer-distribution $distribution \
   --debian-installer-gui false \
   --archive-areas "main contrib non-free" \
   --debootstrap-options "--variant=minbase"

lb build 2>&1 | tee build.log

# Store result file in /data mounted volume
if [[ -d /results ]]
then
    cp *.${binary} /results
fi
