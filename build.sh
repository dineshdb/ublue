#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

dnf remove -y gnome-tour gnome-software

# dev tools
dnf install -y zsh podman-docker openssl git-absorb

# basic utilites
dnf install -y syncthing powertop vulkan-tools tailscale wl-clipboard

# gnome tools
dnf install -y gpaste gnome-shell-extension-gpaste gnome-shell-extension-blur-my-shell

dnf install -y pritunl-client

#### Example for enabling a System Unit File
systemctl enable podman.socket
systemctl enable tailscaled
