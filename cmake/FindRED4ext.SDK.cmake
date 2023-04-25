set(RED4EXT_USE_PCH ON)
set(RED4EXT_HEADER_ONLY ON)

add_subdirectory(${MOD_SOURCE_DIR}/deps/red4ext.sdk deps/red4ext.sdk)
set_target_properties(RED4ext.SDK PROPERTIES FOLDER "Red4ext/Dependencies")

set(MOD_RED4EXT_SDK_DIR "${MOD_SOURCE_DIR}/deps/red4ext.sdk")