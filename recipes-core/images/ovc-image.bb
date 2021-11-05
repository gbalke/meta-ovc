LICENSE = "MIT"
SUMMARY = "Minimal configuration for ovc-mini"

require recipes-core/images/karo-image.inc

IMAGE_FEATURES_append = " \
    ssh-server-openssh \
"

IMAGE_INSTALL_append = " \
    iperf3 \
"
