#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

cd /root
wget https://download.virtualbox.org/virtualbox/6.0.14/VBoxGuestAdditions_6.0.14.iso

mkdir -p /media/iso
mount VBoxGuestAdditions_6.0.14.iso /media/iso -o loop
cd /media/iso
yes | ./VBoxLinuxAdditions.run
rm -f /root/https://download.virtualbox.org/virtualbox/6.0.14/VBoxGuestAdditions_6.0.14.iso
