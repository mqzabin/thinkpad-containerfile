#!/bin/bash

set -ouex pipefail


####################################
# Installing Firefox PWA connector #
####################################
# See:
# - https://packagecloud.io/filips/FirefoxPWA
# - https://addons.mozilla.org/pt-BR/firefox/addon/pwas-for-firefox/

# Enable the repository
sudo tee /etc/yum.repos.d/firefoxpwa.repo > /dev/null <<EOF
[firefoxpwa]
name=FirefoxPWA
metadata_expire=7d
baseurl=https://packagecloud.io/filips/FirefoxPWA/rpm_any/rpm_any/\$basearch
gpgkey=https://packagecloud.io/filips/FirefoxPWA/gpgkey
       https://packagecloud.io/filips/FirefoxPWA/gpgkey/filips-FirefoxPWA-912AD9BE47FEB404.pub.gpg
repo_gpgcheck=1
gpgcheck=1
enabled=1
EOF

# Import GPG key and update DNF cache
sudo dnf -q makecache -y --disablerepo="*" --enablerepo="firefoxpwa"

# Install the package
sudo dnf install -y firefoxpwa

