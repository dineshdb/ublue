#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

rpm-ostree override remove power-profiles-daemon gnome-tour gnome-software gnome-software-rpm-ostree
rpm-ostree install tuned-ppd

# dev tools
rpm-ostree install zsh podman-docker openssl git-absorb

# basic utilites
rpm-ostree install syncthing powertop vulkan-tools tailscale wl-clipboard

# gnome tools
rpm-ostree install gpaste gnome-shell-extension-gpaste

#### Example for enabling a System Unit File
systemctl enable podman.socket
systemctl enable tailscaled
