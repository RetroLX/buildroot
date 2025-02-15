################################################################################
#
# libcec
#
################################################################################

LIBCEC_VERSION = 6.0.2
LIBCEC_SITE = $(call github,Pulse-Eight,libcec,libcec-$(LIBCEC_VERSION))
LIBCEC_LICENSE = GPL-2.0+
LIBCEC_LICENSE_FILES = COPYING

LIBCEC_INSTALL_STAGING = YES
LIBCEC_DEPENDENCIES = host-pkgconf libplatform

ifeq ($(BR2_PACKAGE_LOCKDEV),y)
LIBCEC_DEPENDENCIES += lockdev
endif

ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
LIBCEC_DEPENDENCIES += udev
endif

ifeq ($(BR2_PACKAGE_PYTHON3),y)
LIBCEC_DEPENDENCIES += host-swig python3
endif

# batocera
ifeq ($(BR2_PACKAGE_LIBCEC_EXYNOS_API),y)
LIBCEC_CONF_OPTS += -DHAVE_EXYNOS_API=1
endif

ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
LIBCEC_DEPENDENCIES += rpi-userland
LIBCEC_CONF_OPTS += \
	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -lvcos -lvchiq_arm" \
	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) \
		-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux \
		-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads"
endif 

# batocera
ifeq ($(BR2_PACKAGE_BATOCERA_RPI_MESA3D),y)
LIBCEC_CONF_OPTS += \
	-DHAVE_RPI_API=0 \
	-DHAVE_LINUX_API=1
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_ROCKCHIP_ANY),y)
LIBCEC_CONF_OPTS += \
	-DBUILD_SHARED_LIBS=1 \
	-DCMAKE_INSTALL_LIBDIR:STRING=lib \
	-DCMAKE_INSTALL_LIBDIR_NOARCH:STRING=lib \
	-DSKIP_PYTHON_WRAPPER=1 \
	-DHAVE_AOCEC_API=0 -DHAVE_AMLOGIC_API=0 \
	-DHAVE_IMX_API=0 \
	-DHAVE_LINUX_API=1
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
LIBCEC_DEPENDENCIES += xlib_libXrandr
endif

# Disable information about how libCEC is compiled.
LIBCEC_CONF_OPTS += -DHAVE_GIT_BIN="" \
	-DHAVE_WHOAMI_BIN="" \
	-DHAVE_HOSTNAME_BIN="" \
	-DHAVE_UNAME_BIN=""

$(eval $(cmake-package))
