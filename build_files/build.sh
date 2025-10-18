#!/bin/bash

set -ouex pipefail

# Enabling RPM Fusion repos:
rpm-ostree install -y \
  https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
  https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

rpm-ostree override remove \
  libavcodec-free libavfilter-free libavformat-free libavutil-free libpostproc-free libswresample-free libswscale-free ffmpeg-free libavdevice-free \
  --install ffmpeg

# Fingerprint setup, following:
# https://www.reddit.com/r/Fedora/comments/1gj5jbn/get_fingerprint_authentication_working_fedora_41/

rpm-ostree install -y fprintd libfprint

rpm-ostree install -y libva-intel-media-driver

