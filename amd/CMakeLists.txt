cmake_minimum_required(VERSION 3.11 FATAL_ERROR)

project(CMakeSuiteSparseAMD VERSION 5.4.0 LANGUAGES C)

# Fetch SuiteSparse
include(${PROJECT_SOURCE_DIR}/cmake/setup_suitesparse.cmake)

# Dependencies
suitesparse_find_package(Config)

set(AMD_SRC
    amd_aat.c
    amd_1.c
    amd_2.c
    amd_dump.c
    amd_postorder.c
    amd_defaults.c
    amd_post_tree.c
    amd_order.c
    amd_control.c
    amd_info.c
    amd_valid.c
    amd_preprocess.c)

setup_suitesparse_library(AMD "${AMD_SRC}")

target_link_libraries(amd suitesparse::config)
