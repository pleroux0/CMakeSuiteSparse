cmake_minimum_required(VERSION 3.11 FATAL_ERROR)

project(CMakeSuiteSparseAll VERSION 5.4.0 LANGUAGES C)

include(${PROJECT_SOURCE_DIR}/cmake/setup_suitesparse.cmake)

add_subdirectory(config)
add_subdirectory(amd)
add_subdirectory(btf)
add_subdirectory(colamd)
add_subdirectory(klu)
