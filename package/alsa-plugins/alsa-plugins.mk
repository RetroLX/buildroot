################################################################################
#
# alsa-plugins
#
################################################################################

ALSA_PLUGINS_VERSION = 1.2.6
ALSA_PLUGINS_SOURCE = alsa-plugins-$(ALSA_PLUGINS_VERSION).tar.bz2
ALSA_PLUGINS_SITE = https://www.alsa-project.org/files/pub/plugins
ALSA_PLUGINS_LICENSE = LGPL-2.1+
ALSA_PLUGINS_LICENSE_FILES = COPYING
ALSA_PLUGINS_DEPENDENCIES = host-pkgconf alsa-lib alsa-utils

ALSA_PLUGINS_CONF_OPTS = \
	--with-plugindir=/usr/lib/alsa-lib \
	--localstatedir=/var \
	--disable-jack \
	--disable-libav \
	--disable-maemo-plugin \
	--disable-maemo-resource-manager \
	--disable-pulseaudio \
	--with-speex=builtin

ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
ALSA_PLUGINS_CONF_OPTS += --enable-samplerate
ALSA_PLUGINS_DEPENDENCIES += libsamplerate
ALSA_PLUGINS_LICENSE += , GPL-2.0+ (samplerate plugin)
ALSA_PLUGINS_LICENSE_FILES += COPYING.GPL
else
ALSA_PLUGINS_CONF_OPTS += --disable-samplerate
endif

$(eval $(autotools-package))
