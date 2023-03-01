# Pedalboard Audio Processor

## Hardware 
* Raspberry Pi Compute Module 4, 4 GB RAM, 32GB eMMC, Wireless
* Waveshare [CM4 Nano A](https://www.waveshare.com/wiki/CM4-NANO-A) 
* [HiFiBerry DAC+ADC](https://www.hifiberry.com/shop/boards/hifiberry-dac-adc-pro/)

## Raspberry Pi OS configuration

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

2. Make it read-only

https://learn.adafruit.com/read-only-raspberry-pi/ 

## Software build

1. Elk Audio Sushi

```bash
cd
sudo ./pedalboard-audio/sushi/install-deps.sh
./pedalboard-audio/sushi/build.sh
```

2. LV2 plugins

```bash
cd
sudo ./pedalboard-audio/zconvo.lv/install-deps.sh
./pedalboard-audio/zconvo.lv/build.sh
```

## Backup on OSX

1. run [usbbot](https://github.com/raspberrypi/usbboot)
2. find disk `diskutil list`
3. copy `sudo dd if=/dev/diskX of=backup/pedalboard-audio-20230129.dmg`
4. shrink the image with [pyshrink](https://github.com/lisanet/PiShrink-macOS)

## Read only and overlayfs

see also https://learn.adafruit.com/read-only-raspberry-pi/

### Restore Read/Write access for rootfs

```bash
sudo mount -o remount,rw /boot
```

### Enable/Disable overlayfs

```bash
make enable-ro
# or
make disable-ro
```

## Snapd

Snapd is installed for `nvim` and `cmake` but it is disabled.

To start it:

```bash
sudo systemctl disable snapd.service
```
