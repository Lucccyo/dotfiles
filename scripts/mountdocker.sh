#!/bin/bash

mount /dev/sda /mnt/docker-usb
systemctl start docker
echo "Docker enabled on /mnt/docker-usb."
