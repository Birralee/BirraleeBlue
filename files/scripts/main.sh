#!/usr/bin/env bash
set -euo pipefail

# Remove things we do not want on the image
rpm-ostree override remove \
    krfb \
    krfb-libs \
    kde-connect \
    kde-connect-libs \
    kdeconnectd && \
rpm-ostree override remove \
    rygel \
    input-leap \
    solaar \
    solaar-udev \
    input-remapper \
    tailscale \
    kwrite

# Enable student user generation
systemctl enable student-user.service
