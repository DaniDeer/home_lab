# How to build a custom UEFI for RPi4

1. Run `bash build.custom.uefi` and get `rpi4-impish.zip` as a custom UEFI firmware for RPi-4 for Ubuntu OS
2. Check the device name with `blslk` of your sd card (e.g. `/dev/sda`)
3. Run `bash uefi.make.sh rpi4-impish.zip` to create a bootable sd card with the UEFI
