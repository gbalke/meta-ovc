SUMMARY = "Intel micro-code installer"                                        
DESCRIPTION = "Loads in intel microcodes used on this system."                                                                     
LICENSE = "Apache-2.0"                                                          
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/LICENSE-APACHE;md5=7b486c2338d225a1405d979ed2c15ce8"

SRC_URI_append += "file://${WORKDIR}/ucode"

FILES_${PN} += "/lib/firmware"

do_install() {
  install -d ${D}/lib/firmware
  cp -r ${WORKDIR}/ucode/* ${D}/lib/firmware/
}
