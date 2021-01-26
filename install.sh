#!/bin/bash
#
# This script file is used in ubuntu 20.04 to modify the working environment to be suitable for installing GD-CRM system.
#

###############################################################################
# Update our machine to the latest code if we need to.
###############################################################################

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

###############################################################################
# Install linux-tools-virtual-hwe-20.04
###############################################################################
# Install hv_kvp utils
apt install -y linux-tools-virtual-hwe-20.04
apt install -y linux-cloud-tools-virtual-hwe-20.04

###############################################################################
# Install the xrdp service so we have the auto start behavior
###############################################################################
apt install -y xrdp

systemctl stop xrdp
systemctl stop xrdp-sesman





