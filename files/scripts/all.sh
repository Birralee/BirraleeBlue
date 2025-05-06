#!/usr/bin/env bash
set -euo pipefail

# Enable ntp time server sync
systemctl enable systemd-timesyncd.service

# Enable flatpak auto updater
#systemctl enable flatpak-update.timer

# Make sure image is signed
systemctl enable birralee-sign-image.service

# Enable automatic hostname generation
systemctl enable birralee-hostname.service
