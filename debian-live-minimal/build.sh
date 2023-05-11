#!/bin/bash

#
# default config for 256MB USB key boot media from
# https://live-team.pages.debian.net/live-manual/html/live-manual/examples.en.html#16.6 A minimal image for a 256MB USB key 
#

binary=${1:-hdd}
distribution=${2:-bullseye}

lb clean --purge
rm -Rf config .build build.log

lb config -b $binary \
   -d $distribution \
   --apt-indices false \
   --apt-recommends false \
   --debian-installer live \
   --debian-installer-distribution $distribution \
   --debian-installer-gui false \
   --archive-areas "main contrib non-free" \
   --debootstrap-options "--variant=minbase" \
   --memtest none

# 3rd party packages to be installed but no problem if none used
cp *.deb config/packages.chroot/ || :

# minimal set of packages as all were purged with --apt-recommends false
echo "user-setup sudo" > config/package-lists/recommends.list.chroot

# as we need a network access
echo "ifupdown isc-dhcp-client" >> config/package-lists/recommends.list.chroot

# to overcome install without network access to repo
echo "grub-pc" >> config/package-lists/recommends.list.chroot

lb build 2>&1 | tee build.log
