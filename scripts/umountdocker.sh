#!/bin/bash

systemctl stop docker
umount "/mnt/docker-usb"
if mount | grep -q "/mnt/docker-usb"; then
    echo "Error: /mnt/docker-usb still mounted." >&2
    exit 1
fi
echo "Docker disabled on USB. Can be ejected"

