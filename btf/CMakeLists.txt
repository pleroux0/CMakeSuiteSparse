cmake_minimum_required(VERSION 3.11 FATAL_ERROR)

project(CMakeSuiteSparseBTF VERSION 5.4.0 LANGUAGES C)

# Fetch SuiteSparse
include(${PROJECT_SOURCE_DIR}/cmake/setup_suitesparse.cmake)

# Dependencies
suitesparse_find_package(Config)

set(BTF_SRC btf_maxtrans.c btf_order.c btf_strongcomp.c)

setup_suitesparse_library(BTF "${BTF_SRC}")

target_link_libraries(btf suitesparse::config)
