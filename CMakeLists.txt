cmake_minimum_required(VERSION 3.13)

set(exec1 coro_copy)
set(exec2 regular_copy)
set(exec3 nm3)

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


message(STATUS "C Compiler ID: ${CMAKE_C_COMPILER_ID}")
if (CMAKE_C_COMPILER_ID STREQUAL "GNU")
    add_compile_options(-Wno-maybe-uninitialized
                        -save-temps)

endif()

file(GLOB_RECURSE SRC_FILES "src/*.c")


add_executable(${exec1} coro_copy_toy.c)
add_executable(${exec2} regular_copy_toy.c)
add_executable(${exec3} coro.c)
