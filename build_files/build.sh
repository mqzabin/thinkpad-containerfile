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

########################
# Installing 1Password #
########################
# See:
# - https://support.1password.com/install-linux/#fedora-or-red-hat-enterprise-linux

# Add the key for the 1Password yum repository
sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc

# Add the 1Password yum repository:
sudo tee /etc/yum.repos.d/1password.repo > /dev/null << EOF
[1password]
name=1Password Stable Channel
baseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://downloads.1password.com/linux/keys/1password.asc
EOF

# Install 1Password:
sudo dnf install -y 1password

