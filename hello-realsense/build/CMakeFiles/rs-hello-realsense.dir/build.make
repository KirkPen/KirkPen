# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.20

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/kirk/librealsense-2.43.0/examples/hello-realsense

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/kirk/librealsense-2.43.0/examples/hello-realsense/build

# Include any dependencies generated for this target.
include CMakeFiles/rs-hello-realsense.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/rs-hello-realsense.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/rs-hello-realsense.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/rs-hello-realsense.dir/flags.make

CMakeFiles/rs-hello-realsense.dir/rs-hello-realsense.cpp.o: CMakeFiles/rs-hello-realsense.dir/flags.make
CMakeFiles/rs-hello-realsense.dir/rs-hello-realsense.cpp.o: ../rs-hello-realsense.cpp
CMakeFiles/rs-hello-realsense.dir/rs-hello-realsense.cpp.o: CMakeFiles/rs-hello-realsense.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kirk/librealsense-2.43.0/examples/hello-realsense/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/rs-hello-realsense.dir/rs-hello-realsense.cpp.o"
	/usr/bin/g++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/rs-hello-realsense.dir/rs-hello-realsense.cpp.o -MF CMakeFiles/rs-hello-realsense.dir/rs-hello-realsense.cpp.o.d -o CMakeFiles/rs-hello-realsense.dir/rs-hello-realsense.cpp.o -c /home/kirk/librealsense-2.43.0/examples/hello-realsense/rs-hello-realsense.cpp

CMakeFiles/rs-hello-realsense.dir/rs-hello-realsense.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rs-hello-realsense.dir/rs-hello-realsense.cpp.i"
	/usr/bin/g++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kirk/librealsense-2.43.0/examples/hello-realsense/rs-hello-realsense.cpp > CMakeFiles/rs-hello-realsense.dir/rs-hello-realsense.cpp.i

CMakeFiles/rs-hello-realsense.dir/rs-hello-realsense.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rs-hello-realsense.dir/rs-hello-realsense.cpp.s"
	/usr/bin/g++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kirk/librealsense-2.43.0/examples/hello-realsense/rs-hello-realsense.cpp -o CMakeFiles/rs-hello-realsense.dir/rs-hello-realsense.cpp.s

# Object files for target rs-hello-realsense
rs__hello__realsense_OBJECTS = \
"CMakeFiles/rs-hello-realsense.dir/rs-hello-realsense.cpp.o"

# External object files for target rs-hello-realsense
rs__hello__realsense_EXTERNAL_OBJECTS =

rs-hello-realsense: CMakeFiles/rs-hello-realsense.dir/rs-hello-realsense.cpp.o
rs-hello-realsense: CMakeFiles/rs-hello-realsense.dir/build.make
rs-hello-realsense: CMakeFiles/rs-hello-realsense.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/kirk/librealsense-2.43.0/examples/hello-realsense/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable rs-hello-realsense"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/rs-hello-realsense.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/rs-hello-realsense.dir/build: rs-hello-realsense
.PHONY : CMakeFiles/rs-hello-realsense.dir/build

CMakeFiles/rs-hello-realsense.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/rs-hello-realsense.dir/cmake_clean.cmake
.PHONY : CMakeFiles/rs-hello-realsense.dir/clean

CMakeFiles/rs-hello-realsense.dir/depend:
	cd /home/kirk/librealsense-2.43.0/examples/hello-realsense/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kirk/librealsense-2.43.0/examples/hello-realsense /home/kirk/librealsense-2.43.0/examples/hello-realsense /home/kirk/librealsense-2.43.0/examples/hello-realsense/build /home/kirk/librealsense-2.43.0/examples/hello-realsense/build /home/kirk/librealsense-2.43.0/examples/hello-realsense/build/CMakeFiles/rs-hello-realsense.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/rs-hello-realsense.dir/depend

