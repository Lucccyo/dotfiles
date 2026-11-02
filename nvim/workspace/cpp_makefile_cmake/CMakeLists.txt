cmake_minimum_required(VERSION 3.20)
project(cpp_demo LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
# Génère build/compile_commands.json, lu par clangd
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(demo src/main.cpp src/greeter.cpp)
target_include_directories(demo PRIVATE include)
target_compile_options(demo PRIVATE -Wall -Wextra)
