#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

#dnf remove -y gnome-tour gnome-software firefox firefox-langpacks

# dev tools
dnf install -y zsh podman-docker openssl

# basic utilites
dnf install -y syncthing powertop vulkan-tools tailscale wl-clipboard

dnf remove -y gnome-software

dnf install -y rawtherapee

# gnome tools
dnf install -y gpaste gnome-shell-extension-gpaste gnome-shell-extension-blur-my-shell gtk-layer-shell gtk4-layer-shell

dnf install -y pipewire-v4l2

dnf install -y pritunl-client

# add cosmic-desktop because I want to test run it
dnf install -y cosmic-ext-applet-clipboard-manager cosmic-desktop

#### Example for enabling a System Unit File
systemctl enable podman.socket
systemctl enable tailscaled
