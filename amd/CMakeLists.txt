cmake_minimum_required(VERSION 3.11 FATAL_ERROR)

project(CMakeSuiteSparseAMD VERSION 5.4.0 LANGUAGES C)

set(AMD_SRC
    src/amd_aat.c
    src/amd_1.c
    src/amd_2.c
    src/amd_dump.c
    src/amd_postorder.c
    src/amd_defaults.c
    src/amd_post_tree.c
    src/amd_order.c
    src/amd_control.c
    src/amd_info.c
    src/amd_valid.c
    src/amd_preprocess.c)

suitesparse_target(AMD "${AMD_SRC}")

target_link_libraries(amd suitesparse::config)
