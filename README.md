# Pedalboard Audio Processor

Based on Raspberry Pi 4 using an XTONE audio interface 

## Hardware 
* Raspberry Pi Compute Module 4, 4 GB RAM, 32GB eMMC, Wireless

## Configuration

1. Disable Audio

diff /boot/config.txt /boot/config.txt.orig

'''diff
53c53
< dtparam=audio=off
---
> dtparam=audio=on
62c62
< dtoverlay=vc4-kms-v3d,noaudio
---
> dtoverlay=vc4-kms-v3d
'''

