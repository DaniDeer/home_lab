#!/bin/bash

# Initialize Parameters
# Choose a uefi firmware release
RPI4_UEFI_URL="https://github.com/pftf/RPi4/releases/download/v1.36/RPi4_UEFI_Firmware_v1.36.zip"
# Specify which deb package to replace that comes  with RPi4 UEFI firmware (depends on version)
RPI4_DEB_PACKAGE="bcm2711-rpi-4-b.dtb"
# Specify deb package version with dtbs as the replacement
UBUNTU_DEB_PACKAGE_URL="http://ports.ubuntu.com/pool/main/l/linux/linux-modules-5.15.0-102-generic_5.15.0-102.112_arm64.deb"
UBUNTU_DEB_PACKAGE_VERSION="5.15.0-102-generic"

echo "Start building custom UEFI firmware ..."

# Create a temporary build dir
mkdir build
cd build/

echo
echo
echo "Get RPi4 UEFI Firmware from \"$RPI4_UEFI_URL\" ..."
curl -L ${RPI4_UEFI_URL} -o uefi.firmware.zip
echo '...and unzip archive ...'
unzip uefi.firmware.zip
rm uefi.firmware.zip

echo
echo
echo "Remove \"$RPI4_DEB_PACKAGE\" that comes with RPi4 UEFI firmware ..."
rm ${RPI4_DEB_PACKAGE}

echo
echo
echo "Get deb package with the dtbs from \"$UBUNTU_DEB_PACKAGE_URL\" ..."
# Get the deb package with the dtbs
curl -L ${UBUNTU_DEB_PACKAGE_URL} -o ubuntu.deb

echo
echo
echo "Open and extract $RPI4_DEB_PACKAGE from \"lib/firmware/$UBUNTU_DEB_PACKAGE_VERSION/device-tree/broadcom/\" ..."
mkdir temp/
dpkg -x ubuntu.deb temp/
cp ./temp/lib/firmware/${UBUNTU_DEB_PACKAGE_VERSION}/device-tree/broadcom/${RPI4_DEB_PACKAGE} .
rm -r temp/ ubuntu.deb

echo
echo
echo "Create a new RPi4 UEFI firmware archive and output it to this root folder ..."
zip -r rpi4-impish.zip *
mv rpi4-impish.zip ..

# Clean up 
cd ..
rm -r build/

echo "Finished"