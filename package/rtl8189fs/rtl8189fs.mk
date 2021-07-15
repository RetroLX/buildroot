################################################################################
#
# rtl8189fs
#
################################################################################

RTL8189FS_VERSION = 03ac413135a355b55b693154c44b70f86a39732e
RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
RTL8189FS_LICENSE = GPL-2.0

RTL8189FS_MODULE_MAKE_OPTS = \
	CONFIG_RTL8189FS=m \
	KVER=$(LINUX_VERSION_PROBED) \
	KSRC=$(LINUX_DIR)

$(eval $(kernel-module))
$(eval $(generic-package))
