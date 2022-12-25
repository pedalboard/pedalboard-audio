#!/bin/bash

apt-get update
apt-get upgrade
apt-get install -y build-essential snapd git jackd2 libasound2-dev libjack-jackd2-dev liblilv-dev lilv-utils lv2-dev lv2-examples mda-lv2 ninja-build
snap install core
snap install cmake --classic

# for RPI with less memory increase swap

#dphys-swapfile swapoff
#vi /etc/dphys-swapfile
#dphys-swapfile setup
#dphys-swapfile swapon
#reboot

