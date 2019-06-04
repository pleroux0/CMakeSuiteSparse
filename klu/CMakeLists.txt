cmake_minimum_required(VERSION 3.11 FATAL_ERROR)

project(CMakeSuiteSparseKLU VERSION 5.4.0 LANGUAGES C)

# Fetch SuiteSparse
include(${PROJECT_SOURCE_DIR}/cmake/setup_suitesparse.cmake)

# Dependencies
suitesparse_find_package(Config)
suitesparse_find_package(AMD)
suitesparse_find_package(COLAMD)
suitesparse_find_package(BTF)

set(KLU_SRC
    klu.c
    klu_analyze.c
    klu_analyze_given.c
    klu_defaults.c
    klu_diagnostics.c
    klu_dump.c
    klu_extract.c
    klu_factor.c
    klu_free_numeric.c
    klu_free_symbolic.c
    klu_kernel.c
    klu_memory.c
    klu_refactor.c
    klu_scale.c
    klu_solve.c
    klu_sort.c
    klu_tsolve.c)

setup_suitesparse_library(KLU "${KLU_SRC}")

target_link_libraries(klu
                      suitesparse::config
                      suitesparse::amd
                      suitesparse::colamd
                      suitesparse::btf)
