#!/bin/sh
wget https://dl.fedoraproject.org/pub/fedora/linux/releases/24/Spins/armhfp/images/Fedora-Minimal-armhfp-24-1.2-sda.raw.xz -O fedora.raw.xz
unxz fedora.raw.xz
#fdisk -l fedora.raw | grep raw3
losetup -r /dev/loop3 fedora.raw -o $((1501184*512))
mount /dev/loop3 /mnt 
tar --numeric-owner -C /mnt -cpvf - . | sudo docker import - gbraad/armhf-fedora:24
docker push gbraad/armhf-fedora:24

