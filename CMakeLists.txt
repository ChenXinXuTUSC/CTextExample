cmake_minimum_required(VERSION 3.20)
project(kmp-demo)

message("This is project [${PROJECT_NAME}]")
message("build-type ${CMAKE_BUILD_TYPE}")

# GoogleTest requires at least C++14
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
SET(CMAKE_INSTALL_PREFIX ${CMAKE_CURRENT_BINARY_DIR}/${CMAKE_BUILD_TYPE}/install)

include(cmake/macro.cmake)

# integrate gtest framework
include(FetchContent)
FetchContent_Declare(
    googletest
    GIT_REPOSITORY https://github.com/google/googletest
    GIT_TAG v1.15.2
)
if(CMAKE_TESTING_ENABLE)
    enable_testing()
    include(cmake/gtest.cmake)
endif()

add_subdirectory(src) # build src first
add_subdirectory(app) # build app after all src are built
add_subdirectory(test) # test after all apps are built

install(
    FILES README.md
    DESTINATION share
)
