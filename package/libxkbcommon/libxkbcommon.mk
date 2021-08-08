################################################################################
#
# libxkbcommon
#
################################################################################

LIBXKBCOMMON_VERSION = 1.3.0
LIBXKBCOMMON_SITE = http://xkbcommon.org/download
LIBXKBCOMMON_SOURCE = libxkbcommon-$(LIBXKBCOMMON_VERSION).tar.xz
LIBXKBCOMMON_LICENSE = MIT/X11
LIBXKBCOMMON_LICENSE_FILES = LICENSE
LIBXKBCOMMON_INSTALL_STAGING = YES
LIBXKBCOMMON_DEPENDENCIES = host-bison host-flex
LIBXKBCOMMON_CONF_OPTS = \
	-Denable-docs=false \
	-Denable-wayland=false \
	-Denable-xkbregistry=false

ifeq ($(BR2_PACKAGE_XORG7),y)
LIBXKBCOMMON_CONF_OPTS += -Denable-x11=true
LIBXKBCOMMON_DEPENDENCIES += libxcb
else
LIBXKBCOMMON_CONF_OPTS += -Denable-x11=false
endif

ifeq ($(BR2_PACKAGE_WESTON),y)
LIBXKBCOMMON_CONF_OPTS += -Denable-wayland=true
LIBXKBCOMMON_CONF_OPTS += -Dxkb-config-root=/usr/share/X11/xkb
#LIBXKBCOMMON_CONF_OPTS += -Dx-locale-root=/usr/share/X11/locale
LIBXKBCOMMON_CONF_OPTS += -Dx-locale-root=/usr/share/locale
LIBXKBCOMMON_DEPENDENCIES += weston
endif

$(eval $(meson-package))
