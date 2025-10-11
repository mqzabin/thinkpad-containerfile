#!/bin/bash

set -ouex pipefail

# Install packages

# Fingerprint setup, following:
# https://www.reddit.com/r/Fedora/comments/1gj5jbn/get_fingerprint_authentication_working_fedora_41/

sudo dnf reinstall -y fprintd libfprint

