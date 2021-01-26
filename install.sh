#!/bin/bash
#
# This script file is used in ubuntu 20.04 to modify the working environment to be suitable for installing GD-CRM system.
#

echo "###############################################################################"
echo "# Update our machine to the latest code if we need to."
echo "###############################################################################"

# if user id not equal to 0 then print error message to standard error.
if [ "$(id -u)" -ne 0 ]; then
    # &2 => Standard Error
    # &1 => Standard Output
    echo 'This script must be run with root privileges' >&2
    exit 1
fi

apt update && apt upgrade -y

# if file [/var/run/reboot-required] exist then print error message to standard error.
if [ -f /var/run/reboot-required ]; then
    echo "A reboot is required in order to proceed with the install." >&2
    echo "Please reboot and re-run this script to finish the install." >&2
    exit 1
fi

echo "###############################################################################"
echo "# Install linux-tools-virtual-hwe-20.04"
echo "###############################################################################"
# Install hv_kvp utils
apt install -y linux-tools-virtual-hwe-20.04
apt install -y linux-cloud-tools-virtual-hwe-20.04

echo "###############################################################################"
echo "# Install the xrdp service so we have the auto start behavior"
echo "###############################################################################"
apt install -y xrdp

echo "###############################################################################"
echo "# Stop xrdp service"
echo "###############################################################################"
systemctl stop xrdp
systemctl stop xrdp-sesman

echo "###############################################################################"
echo "Install is complete."
echo "Reboot your machine to begin using XRDP."
echo "###############################################################################"



