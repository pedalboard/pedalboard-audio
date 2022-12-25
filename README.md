# Pedalboard Audio Processor

## Hardware 
* Raspberry Pi Compute Module 4, 4 GB RAM, 32GB eMMC, Wireless
* Waveshare [CM4 Nano A](https://www.waveshare.com/wiki/CM4-NANO-A) 
* XSONIC XTONE Audio Interface

## Configuration

1. Disable Audio

diff /boot/config.txt /boot/config.txt.orig

```diff
53c53
< dtparam=audio=off
---
> dtparam=audio=on
62c62
< dtoverlay=vc4-kms-v3d,noaudio
---
> dtoverlay=vc4-kms-v3d
```


