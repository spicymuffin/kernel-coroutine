cmake_minimum_required(VERSION 3.13)

set(basic_coroutine_test_target_name basic_coro_test)
set(c_coroutines_test_target_name c_coro_test)

# initialize project
project(kernel_coroutine VERSION 1.0 DESCRIPTION "help" LANGUAGES C CXX ASM)

# set standards
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

add_compile_options(-Wall
        -Wno-format          # int != int32_t as far as the compiler is concerned because gcc has int32_t as long int
        -Wno-unused-function # we have some for the docs that aren't called
        -Wno-unknown-pragmas
        )


if (CMAKE_C_COMPILER_ID STREQUAL "GNU")
    add_compile_options(-Wno-maybe-uninitialized)

endif()

file(GLOB_RECURSE SRC_FILES "src/*.cpp")


add_executable(${c_coroutines_test_target_name} c_coro_test.c)
add_executable(${basic_coroutine_test_target_name} basic_coro_test.cpp)