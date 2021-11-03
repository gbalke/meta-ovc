FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10/patches:${THISDIR}/${PN}-5.10:"
SRC_URI_append = " \
	${@' file://cfg/'.join("${KERNEL_FEATURES}".split(" "))} \
"

KERNEL_FEATURES_append = "${@bb.utils.contains('DISTRO_FEATURES','intel-wifi',' intel-wifi.cfg','',d)}"

SRC_URI_append_mx8 = " \
	file://dts/freescale/imx8mm-qsxm-mm60-qsbase3-ovc.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mp-qsxp-ml81-qsbase3-ovc.dts;subdir=git/arch/arm64/boot \
"
