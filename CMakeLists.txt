cmake_minimum_required(VERSION 3.14)

include(cmake/prelude.cmake)

project(
    cdt-qt
    VERSION 0.1.0
    DESCRIPTION "Short description"
    HOMEPAGE_URL "https://example.com/"
    LANGUAGES CXX
)

include(cmake/project-is-top-level.cmake)
include(cmake/variables.cmake)

# ---- Declare library ----

add_library(
    cdt-qt_lib OBJECT
    source/lib.cpp
)

target_include_directories(
    cdt-qt_lib ${warning_guard}
    PUBLIC
    "$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/source>"
)

target_compile_features(cdt-qt_lib PUBLIC cxx_std_20)

find_package(fmt REQUIRED)
target_link_libraries(cdt-qt_lib PRIVATE fmt::fmt)

# ---- Declare executable ----

add_executable(cdt-qt_exe source/main.cpp)
add_executable(cdt-qt::exe ALIAS cdt-qt_exe)

set_target_properties(
    cdt-qt_exe PROPERTIES
    OUTPUT_NAME cdt-qt
    EXPORT_NAME exe
)

target_compile_features(cdt-qt_exe PRIVATE cxx_std_20)

target_link_libraries(cdt-qt_exe PRIVATE cdt-qt_lib)

# ---- Install rules ----

if(NOT CMAKE_SKIP_INSTALL_RULES)
  include(cmake/install-rules.cmake)
endif()

# ---- Developer mode ----

if(NOT cdt-qt_DEVELOPER_MODE)
  return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
  message(
      AUTHOR_WARNING
      "Developer mode is intended for developers of cdt-qt"
  )
endif()

include(cmake/dev-mode.cmake)
