#!/usr/bin/env bash
set -euo pipefail

systemctl enable sshd.service

# Remove things we do not want on the image
rpm-ostree override remove \
    kde-connect \
    kde-connect-libs \
    kdeconnectd

# Enable librarian user generation
systemctl enable librarian-user.service

# Enable Birralee Update timer
systemctl enable birralee-update.timer
