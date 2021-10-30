LICENSE = "MIT"
SUMMARY = "Minimal configuration for ovc-mini"

inherit core-image features_check rootfs-postprocess relative_symlinks

REQUIRED_DISTRO_FEATURES ??= ""

ROOTFS_POSTPROCESS_COMMAND_remove = " \
        rootfs_update_timestamp; \
        ${bb.utils.contains('DISTRO_FEATURES','read-only-rootfs','empty_var_volatile;','',d)} \
"

IMAGE_FEATURES_append = " tools-debug"

IMAGE_INSTALL_append = " \
        ${CORE_IMAGE_EXTRA_INSTALL} \
        bash \
        canutils \
        coreutils \
        curl \
        dhcpcd \
        dosfstools \
        e2fsprogs \
        e2fsprogs-resize2fs \
        file \
        gdbserver \
        git \
        iperf3 \
        i2c-tools \
        kmod \
        ldd \
        less \
        libgpiod \
        libgpiod-tools \
        libstdc++ \
        ${@bb.utils.contains('DISTRO_FEATURES','wifi','linux-firmware-pcie8997','',d)} \
        lsof \
        mmc-utils \
        ncurses \
        nfs-utils \
        ntp \
        ntpdate \
        parted \
        ${@bb.utils.contains('DISTRO_FEATURES','pcie','pciutils','',d)} \
        rsync \
        strace \
        tcp-wrappers \
        tzdata \
        util-linux-fsck \
        util-linux-mkfs \
        util-linux-setterm \
        ${@bb.utils.contains('DISTRO_FEATURES','imx219','v4l-utils','',d)} \
        ${@bb.utils.contains('DISTRO_FEATURES','wifi','wpa-supplicant','',d)} \
"

CORE_IMAGE_EXTRA_INSTALL += "kernel-modules"
DEPENDS_append_mx8 = " imx-boot"

PREFERRED_PROVIDER_fdisk = "util-linux"

IMAGE_ROOTFS_SIZE ?= "${@bb.utils.contains('MACHINE_FEATURES',"nand",64*1024,128*1024,d)}"
IMAGE_ROOTFS_ALIGNMENT ?= "${@bb.utils.contains('MACHINE_FEATURES',"nand",128*1024,1024,d)}"
IMAGE_ROOTFS_EXTRA_SPACE ?= "${@bb.utils.contains('MACHINE_FEATURES',"nand",2*128*1024,0,d)}"

IMAGE_FSTYPES_remove = "tar.gz"
IMAGE_FSTYPES += "${@bb.utils.contains('MACHINE_FEATURES',"nand","ubi","",d)}"
IMAGE_FSTYPES += "${@bb.utils.contains('MACHINE_FEATURES',"emmc","ext4","",d)}"

MKUBIFS_ARGS ?= "-F -x zlib -m 2048 -e 126976 -c 256"
UBINIZE_ARGS ?= "-m 2048 -s 2048 -p 128KiB"
UBI_VOLNAME = "rootfs"

# create bootfs image file with every karo-image-* build
do_image_complete[depends] += "karo-image-bootfs:do_image_complete"

# create uuu.auto file for image
IMAGE_POSTPROCESS_COMMAND_append = " do_create_uuu_auto_script;"

UUU_TEMPLATE_PATH_mx8mm = "uuu-templates/mx8mm"
UUU_TEMPLATE_PATH_mx8mp = "uuu-templates/mx8mp"

python do_create_uuu_auto_script() {
    import shutil
    from string import Template

    machine = d.getVar('MACHINE')
    imxboot_target = d.getVar('IMXBOOT_TARGETS')
    image = d.getVar('BPN')

    uuu_template_path = d.expand("${THISDIR}/${UUU_TEMPLATE_PATH}/uuu.auto.template")
    uuu_auto_path = d.expand("${IMGDEPLOYDIR}/uuu.auto")

    f = open(uuu_template_path, 'r')
    uuu_template_string = f.read()

    try:
        with open(uuu_auto_path, 'w') as uuu_script:
            uuu_template = Template(uuu_template_string)
            uuu_auto = uuu_template.substitute(image=image, machine=machine, imxboot_target=imxboot_target)
            uuu_script.write(uuu_auto)
    except OSError:
        bb.fatal('Unable to open %s' % (uuu_auto_path))
}
