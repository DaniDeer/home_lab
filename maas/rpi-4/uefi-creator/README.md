# How to build a custom UEFI for RPi4
For some Ubuntu releases it is required to alter the UEFI image with an updated DTB that matches the respective linux kernel.
The scrpits provided here uses RPi-4 UEFI firmware `v1.36` together with `linux-modules-5.15.0-102-generic_5.15.0-102.112_arm64.deb` for `Ubuntu 22.04 LTS`.
The RPi-4 eeprom flash version used is `2023-01-11-vl805-000138c0`.

## Steps
1. Run `bash build.custom.uefi` and get `rpi4-impish.zip` as a custom UEFI firmware for RPi-4 for Ubuntu OS
2. Check the device name with `blslk` of your sd card (e.g. `/dev/sda`)
3. Run `bash uefi.make.sh rpi4-impish.zip` to create a bootable sd card with the UEFI

# Ressources
- Detailed instructions here: https://maas.io/tutorials/build-your-own-bare-metal-cloud-using-a-raspberry-pi-cluster-with-maas#4-prepare-rpis-to-be-managed-by-maas
- Ubuntu OS deb package: https://ubuntu.pkgs.org/22.04/ubuntu-proposed-main-arm64/linux-modules-5.15.0-102-generic_5.15.0-102.112_arm64.deb.html
- RPi4 UEFI firmware releases: https://github.com/pftf/RPi4/releases
- RPi4 EEPROM firmware releases: https://github.com/raspberrypi/rpi-eeprom/releases
- Modified `uefi.make.sh` from: https://github.com/gilesknap/IaC-at-home/blob/main/nas/03-maas/uefi.make.sh

