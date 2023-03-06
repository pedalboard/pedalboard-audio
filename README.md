# Pedalboard Audio Processor

## Hardware
* Raspberry Pi Compute Module 4, 4 GB RAM, 32GB eMMC, Wireless
* Waveshare [CM4 Nano A](https://www.waveshare.com/wiki/CM4-NANO-A)
* [HiFiBerry DAC+ADC](https://www.hifiberry.com/shop/boards/hifiberry-dac-adc-pro/)

## Software

### Pedalboard OS

See ../pedalboard-os

### Sushi (Digital Audio Processing Engine)

This repo contains the configuration for sushi.

## Enable/Disable Readonly Filesystem

```bash
make enable-ro
# or
make disable-ro
```

## Backup on OSX

1. run [usbbot](https://github.com/raspberrypi/usbboot)
2. find disk `diskutil list`
3. copy `sudo dd if=/dev/diskX of=backup/pedalboard-audio-20230129.dmg`
4. shrink the image with [pyshrink](https://github.com/lisanet/PiShrink-macOS)


