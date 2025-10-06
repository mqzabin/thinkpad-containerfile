#!/bin/bash

set -ouex pipefail

### Install packages

# Kernel builds could be found here:
# https://bodhi.fedoraproject.org/updates/?packages=kernel&page=1
# rpm-ostree override replace https://koji.fedoraproject.org/koji/buildinfo?buildID=2820362

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
# dnf5 install -y tmux 

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

# systemctl enable podman.socket

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
sudo dnf install firefoxpwa

