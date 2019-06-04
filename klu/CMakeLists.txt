cmake_minimum_required(VERSION 3.11 FATAL_ERROR)

project(CMakeSuiteSparseKLU VERSION 5.4.0 LANGUAGES C)

set(KLU_SRC
    src/klu.c
    src/klu_analyze.c
    src/klu_analyze_given.c
    src/klu_defaults.c
    src/klu_diagnostics.c
    src/klu_dump.c
    src/klu_extract.c
    src/klu_factor.c
    src/klu_free_numeric.c
    src/klu_free_symbolic.c
    src/klu_kernel.c
    src/klu_memory.c
    src/klu_refactor.c
    src/klu_scale.c
    src/klu_solve.c
    src/klu_sort.c
    src/klu_tsolve.c)

suitesparse_target(KLU "${KLU_SRC}")

target_link_libraries(klu
                      suitesparse::config
                      suitesparse::amd
                      suitesparse::colamd
                      suitesparse::btf)
