cmake_minimum_required(VERSION 3.6)

set(lib_name zlib)
set(target_name ext_${lib_name})

project(${lib_name})

include(../cmake/CocosExternalConfig.cmake)

if(WINDOWS)
  add_library(${target_name} SHARED IMPORTED GLOBAL)
else()
  add_library(${target_name} STATIC IMPORTED GLOBAL)
endif()

if(MACOSX OR ANDROID OR IOS)
  set_target_properties(${target_name} PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_SOURCE_DIR}/include"
  )
  set_target_properties(${target_name} PROPERTIES
    IMPORTED_LOCATION "${platform_spec_path}/libz.a"
  )
elseif(WINDOWS)
  set_target_properties(${target_name} PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_SOURCE_DIR}/../win32-specific/zlib/include"
  )
  set_target_properties(${target_name} PROPERTIES
    IMPORTED_LOCATION "${CMAKE_CURRENT_SOURCE_DIR}/../win32-specific/zlib/prebuilt/zlib1.dll"
    IMPORTED_IMPLIB "${CMAKE_CURRENT_SOURCE_DIR}/../win32-specific/zlib/prebuilt/libzlib.lib"
  )
endif()
