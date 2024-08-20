#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

rpm-ostree override remove power-profiles-daemon gnome-tour
rpm-ostree install tuned-ppd

# multi-media tools
rpm-ostree install intel-media-driver libheif-tools libheif-freeworld heif-pixbuf-loader pipewire-codec-aptx ffmpeg ffmpegthumbnailer
# dev tools
rpm-ostree install zsh podman-docker mold make openssl openssl-devel tinygo distrobox

# kmod provides lsmod
rpm-ostree install kmod
# java
rpm-ostree install java-21-openjdk-devel
# basic utilites
rpm-ostree install syncthing powertop vulkan-tools tailscale wl-clipboard
# gnome tools
rpm-ostree install gnome-tweaks gnome-tweak-tool gpaste gnome-shell-extension-gpaste

#### Example for enabling a System Unit File
systemctl enable podman.socket
systemctl enable tailscaled
