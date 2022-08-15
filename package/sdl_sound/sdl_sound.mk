################################################################################
#
# sdl_sound
#
################################################################################

SDL_SOUND_VERSION = v2.0.1
SDL_SOUND_SOURCE = $(SDL_SOUND_VERSION).tar.gz
SDL_SOUND_SITE = https://github.com/icculus/SDL_sound/archive/refs/tags
SDL_SOUND_LICENSE = LGPL-2.1+
SDL_SOUND_LICENSE_FILES = COPYING
SDL_SOUND_INSTALL_STAGING = YES
SDL_SOUND_DEPENDENCIES = sdl2

ifneq ($(BR2_ENABLE_LOCALE),y)
SDL_SOUND_DEPENDENCIES += libiconv
endif

$(eval $(cmake-package))
