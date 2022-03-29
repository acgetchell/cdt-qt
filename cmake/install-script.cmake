file(
    RELATIVE_PATH relative_path
    "/${cdt-qt_INSTALL_CMAKEDIR}"
    "/${CMAKE_INSTALL_BINDIR}/${cdt-qt_NAME}"
)

get_filename_component(prefix "${CMAKE_INSTALL_PREFIX}" ABSOLUTE)
set(config_dir "${prefix}/${cdt-qt_INSTALL_CMAKEDIR}")
set(config_file "${config_dir}/cdt-qtConfig.cmake")

message(STATUS "Installing: ${config_file}")
file(WRITE "${config_file}" "\
get_filename_component(
    _cdt-qt_executable
    \"\${CMAKE_CURRENT_LIST_DIR}/${relative_path}\"
    ABSOLUTE
)
set(
    CDT_QT_EXECUTABLE \"\${_cdt-qt_executable}\"
    CACHE FILEPATH \"Path to the cdt-qt executable\"
)
")
