include(CMakePackageConfigHelpers)
include(GNUInstallDirs)

# find_package(<package>) call for consumers to find this project
set(package cdt-qt)

install(
    TARGETS cdt-qt_exe
    RUNTIME COMPONENT cdt-qt_Runtime
)

write_basic_package_version_file(
    "${package}ConfigVersion.cmake"
    COMPATIBILITY SameMajorVersion
)

# Allow package maintainers to freely override the path for the configs
set(
    cdt-qt_INSTALL_CMAKEDIR "${CMAKE_INSTALL_DATADIR}/${package}"
    CACHE PATH "CMake package config location relative to the install prefix"
)
mark_as_advanced(cdt-qt_INSTALL_CMAKEDIR)

install(
    FILES "${PROJECT_BINARY_DIR}/${package}ConfigVersion.cmake"
    DESTINATION "${cdt-qt_INSTALL_CMAKEDIR}"
    COMPONENT cdt-qt_Development
)

# Export variables for the install script to use
install(CODE "
set(cdt-qt_NAME [[$<TARGET_FILE_NAME:cdt-qt_exe>]])
set(cdt-qt_INSTALL_CMAKEDIR [[${cdt-qt_INSTALL_CMAKEDIR}]])
set(CMAKE_INSTALL_BINDIR [[${CMAKE_INSTALL_BINDIR}]])
" COMPONENT cdt-qt_Development)

install(
    SCRIPT cmake/install-script.cmake
    COMPONENT cdt-qt_Development
)

if(PROJECT_IS_TOP_LEVEL)
  include(CPack)
endif()
