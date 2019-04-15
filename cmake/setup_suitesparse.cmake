cmake_minimum_required(VERSION 3.11 FATAL_ERROR)

# Fetch SuiteSparse
include(FetchContent)

set(SUITESPARSE_URL
    "http://faculty.cse.tamu.edu/davis/SuiteSparse/SuiteSparse-5.4.0.tar.gz")

fetchcontent_declare(SUITESPARSE URL "${SUITESPARSE_URL}")
fetchcontent_getproperties(suitesparse)

if(NOT suitesparse_POPULATED)
  fetchcontent_populate(SUITESPARSE)

  message("SuiteSparse source directory: ${suitesparse_SOURCE_DIR}")
  message("SuiteSparse binary directory: ${suitesparse_BINARY_DIR}")
endif()

include(GNUInstallDirs)

# Install target helper
function(install_suitesparse_target name)

  string(TOLOWER ${name} lcname)

  install(TARGETS ${lcname}
          EXPORT suitesparse-${lcname}-targets
          LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
          ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
          RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
          INCLUDES
          DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

  install(EXPORT suitesparse-${lcname}-targets
          FILE CMakeSuiteSparse${name}Config.cmake
          NAMESPACE suitesparse::
          DESTINATION share/CMakeSuiteSparse${name}/)

endfunction()

# Setup library
function(setup_suitesparse_library name sources)

  string(TOLOWER ${name} lcname)
  string(TOUPPER ${name} ucname)
  set(DIR "${suitesparse_SOURCE_DIR}/${name}")
  list(TRANSFORM sources PREPEND "${DIR}/Source/")

  # Add library and it's alias
  add_library(${lcname} ${sources})
  add_library(suitesparse::${lcname} ALIAS ${lcname})

  # Change library properties
  set_target_properties(${lcname} PROPERTIES OUTPUT_NAME suitesparse_${lcname})
  set_target_properties(${lcname} PROPERTIES POSITION_INDEPENDENT_CODE ON)

  # Set include directories
  target_include_directories(${lcname}
                             PUBLIC $<BUILD_INTERFACE:${DIR}/Include>
                                    $<INSTALL_INTERFACE:include/suitesparse>)

  # Install headers
  install(DIRECTORY "${DIR}/Include/"
          DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}/suitesparse")

  # Install targets
  install_suitesparse_target(${name})

endfunction()
