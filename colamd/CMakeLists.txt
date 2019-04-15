cmake_minimum_required(VERSION 3.11 FATAL_ERROR)

project(CMakeSuiteSparseCOLAMD VERSION 5.4.0 LANGUAGES C)

# Fetch SuiteSparse
include(${PROJECT_SOURCE_DIR}/cmake/setup_suitesparse.cmake)

# Dependencies
suitesparse_find_package(Config)

set(COLAMD_SRC colamd.c)
setup_suitesparse_library(COLAMD "${COLAMD_SRC}")

target_link_libraries(colamd suitesparse::config)
