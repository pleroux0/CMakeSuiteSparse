cmake_minimum_required(VERSION 3.11 FATAL_ERROR)

project(CMakeSuiteSparseConfig VERSION 5.4.0 LANGUAGES C)

set(CONFIG_SRC src/config.c)

suitesparse_target(Config "${CONFIG_SRC}")
