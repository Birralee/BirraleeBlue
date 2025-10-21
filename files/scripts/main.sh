#!/usr/bin/env bash
set -euo pipefail

# Remove things we do not want on the image
rpm-ostree override remove \
    krfb \
    krfb-libs \
    kde-connect \
    kde-connect-libs \
    kdeconnectd && \
#rpm-ostree override remove \
#    rygel \
#    input-leap \
#    solaar \
#    solaar-udev \
#    input-remapper \
#    tailscale \
#    kwrite
rpm-ostree override remove \
    power-profiles-daemon \
    || true && \
rpm-ostree override remove \
    tlp \
    tlp-rdw \
    kwrite \
    || true && \
rpm-ostree install \
    tuned \
    tuned-ppd \
    tuned-utils \
    tuned-gtk \
    tuned-profiles-atomic \
    tuned-profiles-cpu-partitioning

# Adding repositories should be a LAST RESORT. Contributing to Terra or `ublue-os/packages` is much preferred
# over using random coprs. Please keep this in mind when adding external dependencies.
# If adding any dependency, make sure to always have it disabled by default and _only_ enable it on `dnf install`

dnf5 config-manager addrepo --set=baseurl="https://packages.microsoft.com/yumrepos/vscode" --id="vscode"
dnf5 config-manager setopt vscode.enabled=0
# FIXME: gpgcheck is broken for vscode due to it using `asc` for checking
# seems to be broken on newer rpm security policies.
dnf5 config-manager setopt vscode.gpgcheck=0
dnf5 install --nogpgcheck --enable-repo="vscode" -y \
    code

# Enable student user generation
systemctl enable student-user.service
