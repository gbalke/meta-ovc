FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10/patches:${THISDIR}/${PN}-5.10:"
SRC_URI_append = " \
	${@' file://cfg/'.join("${KERNEL_FEATURES}".split(" "))} \
"

KERNEL_FEATURES_append = "${@bb.utils.contains('DISTRO_FEATURES','intel-wifi',' intel-wifi.cfg','',d)}"

SRC_URI_remove_mx8 = " \
	file://dts/freescale/imx8m-qs8m-dsi83.dtsi;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8m-qs8m-raspi-display.dtsi;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8m-qs8m-tc358867.dtsi;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8m-qs8m.dtsi;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8m-tx8m.dtsi;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mm-qs8m-mq00-qsbase2-cam.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mm-qs8m-mq00-qsbase2-dsi83-cam.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mm-qs8m-mq00-qsbase2-dsi83.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mm-qs8m-mq00-qsbase2-raspi-display-cam.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mm-qs8m-mq00-qsbase2-raspi-display.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mm-qs8m-mq00-qsbase2-tc358867.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mm-qs8m-mq00-qsbase2.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mm-qs8m-mq00.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mm-qs8m-raspi-camera.dtsi;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mm-qsxm-mm60-qsbase3-dsi83.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mm-qsxm-mm60-qsbase3-laird.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mm-qsxm-mm60-qsbase3-raspi-display.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mm-qsxm-mm60-qsbase3-tc358867.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mm-qsxm-mm60-qsbase3.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mm-qsxm-mm60.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mm-tx8m-1610-mipi-mb-wifi.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mm-tx8m-1610-mipi-mb.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mm-tx8m-1610.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mm-tx8m-1620-lvds-mb-wifi.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mm-tx8m-1620-lvds-mb.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mm-tx8m-1620-mb7.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mm-tx8m-1620.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mm-tx8m-1622.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mm-tx8m-ath9k-wifi.dtsi;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mm-tx8m-lvds-mb.dtsi;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mm-tx8m-mipi-mb.dtsi;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mm-tx8m-mb7.dtsi;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mm-tx8m.dtsi;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mn-qs8m-nd00-qsbase2-dsi83.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mn-qs8m-nd00-qsbase2-raspi-display.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mn-qs8m-nd00-qsbase2-tc358867.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mn-qs8m-nd00-qsbase2.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mn-qs8m-nd00.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mn-tx8m-mipi-mb.dtsi;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mn-tx8m-nd00-mipi-mb.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mn-tx8m-nd00.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mp-karo.dtsi;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mp-qsxp-ml81-qsbase3-dsi83.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mp-qsxp-ml81-qsbase3-laird.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mp-qsxp-ml81-qsbase3-laird.dtsi;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mp-qsxp-ml81-qsbase3-raspi-display.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mp-qsxp-ml81-qsbase3-raspi-display.dtsi;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mp-qsxp-ml81-qsbase3-tc358867.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mp-qsxp-ml81-qsbase3.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mp-qsxp-ml81-qsbase3.dtsi;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mp-qsxp-ml81.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mp-tx8p-lvds-mb.dtsi;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mp-tx8p-mb7.dtsi;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mp-tx8p-ml81-lvds-mb.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mp-tx8p-ml81-mb7.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mp-tx8p-ml81.dts;subdir=git/arch/arm64/boot \
"

SRC_URI_append_mx8 = " \
	file://dts/freescale/imx8mm-qsxm-mm60-qsbase3-ovc.dts;subdir=git/arch/arm64/boot \
	file://dts/freescale/imx8mp-qsxp-ml81-qsbase3-ovc.dts;subdir=git/arch/arm64/boot \
"
