#!/bin/bash

set -ouex pipefail

# Fingerprint setup, following:
# https://www.reddit.com/r/Fedora/comments/1gj5jbn/get_fingerprint_authentication_working_fedora_41/
dnf5 install -y fprintd libfprint
