#!/bin/bash

#
# default config from
# https://lecorbeausvault.wordpress.com/2021/01/10/quickly-build-a-custom-bootable-installable-debian-live-iso-with-live-build/
#

apt-get install -y live-build kvm

lb clean --purge
rm -Rf config .build build.log

lb config -d bullseye \
   --debian-installer live \
   --debian-installer-distribution bullseye \
   --debian-installer-gui false \
   --archive-areas "main contrib non-free" \
   --debootstrap-options "--variant=minbase"

lb build 2>&1 | tee build.log
