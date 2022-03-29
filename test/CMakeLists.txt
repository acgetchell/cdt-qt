# Parent project does not export its library target, so this CML implicitly
# depends on being added from it, i.e. the testing is done only from the build
# tree and is not feasible from an install location

project(cdt-qtTests LANGUAGES CXX)

# ---- Dependencies ----

find_package(Catch2 REQUIRED)
include(Catch)

# ---- Tests ----

add_executable(cdt-qt_test source/cdt-qt_test.cpp)
target_link_libraries(
    cdt-qt_test PRIVATE
    cdt-qt_lib
    Catch2::Catch2WithMain
)
target_compile_features(cdt-qt_test PRIVATE cxx_std_20)

catch_discover_tests(cdt-qt_test)

# ---- End-of-file commands ----

add_folders(Test)
