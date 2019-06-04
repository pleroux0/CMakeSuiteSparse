cmake_minimum_required(VERSION 3.11 FATAL_ERROR)

project(CMakeSuiteSparseCOLAMD VERSION 5.4.0 LANGUAGES C)

set(COLAMD_SRC src/colamd.c)
suitesparse_target(COLAMD "${COLAMD_SRC}")

target_link_libraries(colamd suitesparse::config)
