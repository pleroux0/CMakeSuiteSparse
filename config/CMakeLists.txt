cmake_minimum_required(VERSION 3.11 FATAL_ERROR)

project(CMakeSuiteSparseConfig VERSION 5.4.0 LANGUAGES C)

set(CMakeSuiteSparseConfig_FOUND TRUE)

if(NOT BUILD_SHARED_LIBS)
  option(WITH_PIC "Build library with PIC" ON)
endif()

include(GNUInstallDirs)

# Fetch SuiteSparse
include(${PROJECT_SOURCE_DIR}/cmake/setup_suitesparse.cmake)

set(CONFIG_DIR ${suitesparse_SOURCE_DIR}/SuiteSparse_config)

add_library(config ${CONFIG_DIR}/SuiteSparse_config.c)
add_library(suitesparse::config ALIAS config)

set_target_properties(config PROPERTIES OUTPUT_NAME suitesparse_config)
set_target_properties(config PROPERTIES POSITION_INDEPENDENT_CODE ON)

target_include_directories(config
                           PUBLIC $<BUILD_INTERFACE:${CONFIG_DIR}>
                                  $<INSTALL_INTERFACE:include>)

install(FILES "${CONFIG_DIR}/SuiteSparse_config.h"
        DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}/suitesparse")

install_suitesparse_target(Config)
