cmake_minimum_required(VERSION 3.11 FATAL_ERROR)

project(CMakeSuiteSparseBTF VERSION 5.4.0 LANGUAGES C)

set(BTF_SRC src/btf_maxtrans.c src/btf_order.c src/btf_strongcomp.c)

suitesparse_target(BTF "${BTF_SRC}")

target_link_libraries(btf suitesparse::config)
