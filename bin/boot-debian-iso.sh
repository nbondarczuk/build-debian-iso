#!/bin/bash

sudo virt-install \
    --virt-type qemu \
    --connect qemu:///system \
    --memory 2048 \
    --vcpus 2 \
    --disk /var/lib/libvirt/images/deb11-vm.qcow2 \
    --network network=default \
    --name debian-iso-test \
    --os-type=linux \
    --os-variant debian9 \
    --cdrom $1

#    --graphics none \
#    --console pty,target_type=serial \
#    --location https://us.archive.ubuntu.com/ubuntu/dists/wily/main/installer-amd64/
#    --install kernel_args=xxx
#    --unattended
