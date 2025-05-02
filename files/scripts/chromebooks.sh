#!/usr/bin/env bash
set -euo pipefail

# Remove things we do not want on the image
rpm-ostree override remove \
    distrobox \
    toolbox \
    kwrite && \
rpm-ostree override remove \
    krfb \
    krfb-libs \
    kde-connect \
    kde-connect-libs \
    kdeconnectd && \
rpm-ostree override remove \
    power-profiles-daemon \
    || true && \
rpm-ostree override remove \
    tlp \
    tlp-rdw \
    || true && \
rpm-ostree install \
    tuned \
    tuned-ppd \
    tuned-utils \
    tuned-gtk \
    tuned-profiles-atomic \
    tuned-profiles-cpu-partitioning

# Enable tuned and fix gui application name
systemctl enable tuned.service
sed -i 's@Name=tuned-gui@Name=TuneD Manager@g' /usr/share/applications/tuned-gui.desktop

# Enable student user generation
systemctl enable student-user.service

# Enable Birralee Update timer
systemctl enable birralee-update.timer
