################################################################################
#
# qt5gamepad
#
################################################################################

QT5GAMEPAD_VERSION = v5.15.4-lts-lgpl
QT5GAMEPAD_SITE = https://code.qt.io/qt/qtgamepad.git
QT5GAMEPAD_SITE_METHOD = git
#QT5GAMEPAD_SOURCE = qtgamepad-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5GAMEPAD_VERSION).tar.xz
QT5GAMEPAD_INSTALL_STAGING = YES
QT5GAMEPAD_SYNC_QT_HEADERS = YES
QT5GAMEPAD_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
QT5GAMEPAD_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL

$(eval $(qmake-package))
