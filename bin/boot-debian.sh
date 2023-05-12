#!/bin/bash

sudo virt-install \
     --name deb11 \
     --ram 2048 \
     --vcpus 2 \
     --disk path=/var/lib/libvirt/images/deb11-vm.qcow2,size=20 \
     --os-type linux \
     --os-variant debian9 \
     --network bridge=default \
     --graphics none \
     --console pty,target_type=serial \
     --extra-args 'console=ttyS0,115200n8 serial' \
     --location 'http://ftp.debian.org/debian/dists/bullseye/main/installer-amd64/'
