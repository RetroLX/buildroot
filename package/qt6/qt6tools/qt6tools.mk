################################################################################
#
# qt6tools
#
################################################################################

QT6TOOLS_VERSION = $(QT6_VERSION)
QT6TOOLS_SITE = $(QT6_SITE)
QT6TOOLS_SOURCE = qttools-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6TOOLS_VERSION).tar.xz
QT6TOOLS_DEPENDENCIES = \
	host-ninja \
	host-clang \
	host-qt6base \
	host-qt6tools \
	double-conversion \
	libb2 \
	pcre2 \
	zlib
QT6TOOLS_INSTALL_STAGING = YES

QT6TOOLS_CONF_OPTS = \
	-GNinja \
	-DQT_HOST_PATH=$(HOST_DIR) \
	-DQT_FEATURE_clang=ON \
	-DQT_FEATURE_linguist=ON \
	-DFEATURE_system_doubleconversion=ON \
	-DFEATURE_system_pcre2=ON \
	-DFEATURE_system_zlib=ON \
	-DFEATURE_system_libb2=ON

define QT6TOOLS_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(QT6TOOLS_BUILDDIR)
endef

define QT6TOOLS_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --install $(QT6TOOLS_BUILDDIR) --prefix $(STAGING_DIR)/usr
endef

define QT6TOOLS_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --install $(QT6TOOLS_BUILDDIR) --prefix $(TARGET_DIR)/usr
endef

HOST_QT6TOOLS_DEPENDENCIES = \
	host-ninja \
	host-clang \
	host-double-conversion \
	host-libb2 \
	host-pcre2 \
	host-zlib
HOST_QT6TOOLS_CONF_OPTS = \
	-GNinja \
	-DQT_FEATURE_clang=ON \
	-DQT_FEATURE_linguist=ON \
	-DFEATURE_system_doubleconversion=ON \
	-DFEATURE_system_libb2=ON \
	-DFEATURE_system_pcre2=ON \
	-DFEATURE_system_zlib=ON

define HOST_QT6TOOLS_BUILD_CMDS
	$(HOST_MAKE_ENV) $(BR2_CMAKE) --build $(HOST_QT6TOOLS_BUILDDIR)
endef

define HOST_QT6TOOLS_INSTALL_CMDS
	$(HOST_MAKE_ENV) $(BR2_CMAKE) --install $(HOST_QT6TOOLS_BUILDDIR)
endef

$(eval $(cmake-package))
$(eval $(host-cmake-package))
