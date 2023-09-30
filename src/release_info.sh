#!/usr/bin/env bash

source /etc/os-release
DIST_NAME=$ID
DIST_VERSION=$VERSION_ID

# For Ubuntu and Debian, use the above information as-is
if [[ "$DIST_NAME" == "ubuntu" || "$DIST_NAME" == "debian" ]]; then
    export DIST_NAME=$DIST_NAME;
    export DIST_VERSION=$DIST_VERSION;
elif [[ "$DIST_NAME" == "zorin" ]]; then
    export DIST_NAME="ubuntu"
    if [[ "$UBUNTU_CODENAME" == "focal" ]]; then
        export DIST_VERSION="20.04"
    elif [[ "$UBUNTU_CODENAME" == "jammy" ]]; then
        export DIST_VERSION="22.04"
    else
        echo "Unexpected Zorin OS version." && exit 1;
    fi
else
    echo "Unexpected distro: $DIST_NAME." && exit 1;
fi
