#!/usr/bin/env bash
set -euo pipefail

# Add /sysroot to GRUB_DEVICE in grub-mkconfig
# shellcheck disable=SC2016
sed -i 's/^GRUB_DEVICE=.*/GRUB_DEVICE="`${grub_probe} --target=device \/sysroot`"/' /usr/bin/grub2-mkconfig
