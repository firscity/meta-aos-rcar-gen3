FILESEXTRAPATHS:prepend:aos-main-node := "${THISDIR}/files/main-node:"

SRC_URI:append:aos-main-node = " \
    file://aos-vis-service.conf \
"

AOS_IAM_IDENT_MODULES:aos-main-node = " \
    identhandler/modules/visidentifier \
"

do_install:append:aos-main-node() {
    install -d ${D}${sysconfdir}/systemd/system/aos-iamanager.service.d
    install -m 0644 ${WORKDIR}/aos-vis-service.conf ${D}${sysconfdir}/systemd/system/aos-iamanager.service.d/10-aos-vis-service.conf
}
