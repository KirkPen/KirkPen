# License: Apache 2.0. See LICENSE file in root directory.
# Copyright(c) 2019 Intel Corporation. All Rights Reserved.
#  minimum required cmake version: 3.1.0
cmake_minimum_required(VERSION 3.1.0)

project(RealsenseExamplesHelloRealSense)

#used for intelisense by vscode
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

find_package(realsense2 REQUIRED)
include_directories(${realsense2_INCLUDE_DIRS})
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED TRUE)

add_executable(rs-hello-realsense rs-hello-realsense.cpp)
set_property(TARGET rs-hello-realsense PROPERTY CXX_STANDARD 11)
target_link_libraries(rs-hello-realsense ${DEPENDENCIES})
set_target_properties (rs-hello-realsense PROPERTIES FOLDER "Examples")

install(TARGETS rs-hello-realsense RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
