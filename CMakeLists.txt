cmake_minimum_required(VERSION 3.24)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/deps/cyberpunk_cmake")

include(CyberpunkMod)

project(
  project_slug
  DESCRIPTION "Project Name"
  VERSION 0.0.0
  LANGUAGES CXX
  HOMEPAGE_URL "https://github.com/*/*"
)

# Customizable options
set(MOD_NAME ${PROJECT_DESCRIPTION})
set(MOD_SLUG ${PROJECT_NAME})
set(MOD_AUTHOR "Your Name")
set(MOD_URL ${PROJECT_HOMEPAGE_URL})
set(MOD_COPYRIGHT_BLURB "Copyright (c) ${CURRENT_YEAR} ${MOD_AUTHOR}. All rights reserved.")
set(MOD_LICENSE "Licensed under the MIT license. See the license.md in the root project for details.")

# Mod base
configure_mod()

# RED4ext plugin compilation & options
# https://github.com/jac3km4/zoltan/releases/download/${version}/zoltan-clang.exe
find_program(ZOLTAN_CLANG_EXE NAMES zoltan-clang.exe PATHS "${MOD_TOOLS_DIR}" CACHE)
find_program(CYBERPUNK_2077_EXE NAMES Cyberpunk2077.exe PATHS "${CYBERPUNK_2077_GAME_DIR}/bin/x64" DOC "Cyberpunk2077.exe Executable File" CACHE)

# set(ZOLTAN_USER_SIGNATURES "${MOD_RED4EXT_SOURCE_DIR}/Main.cpp")
# set(ZOLTAN_ADDRESSES_OUTPUT "${MOD_RED4EXT_SOURCE_DIR}/Addresses.hpp")
# add_subdirectory(red4ext)
configure_red4ext(red4ext)

# Redscript 
find_program(REDSCRIPT_CLI_EXE NAMES redscript-cli.exe PATHS "${MOD_TOOLS_DIR}" CACHE)
configure_redscript(redscript)

# Archive/.xl management
configure_archives(mod.archive mod.archive.xl)

# Tweaks
configure_tweaks(tweaks)

# Release zip file location/name
configure_release(${MOD_SOURCE_DIR}/${MOD_SLUG}_${MOD_VERSION_STR}.zip)

# Install game_dir to Cyberpunk game directory
configure_install()

# Uninstall script generation
configure_uninstall()