# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.31

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
CMAKE_COMMAND = /opt/homebrew/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/ethan/school/spring25/cs6120/code/cs6120/lesson8

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/ethan/school/spring25/cs6120/code/cs6120/lesson8/build

# Include any dependencies generated for this target.
include loop/CMakeFiles/LoopPass.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include loop/CMakeFiles/LoopPass.dir/compiler_depend.make

# Include the progress variables for this target.
include loop/CMakeFiles/LoopPass.dir/progress.make

# Include the compile flags for this target's objects.
include loop/CMakeFiles/LoopPass.dir/flags.make

loop/CMakeFiles/LoopPass.dir/codegen:
.PHONY : loop/CMakeFiles/LoopPass.dir/codegen

loop/CMakeFiles/LoopPass.dir/loop.cpp.o: loop/CMakeFiles/LoopPass.dir/flags.make
loop/CMakeFiles/LoopPass.dir/loop.cpp.o: /Users/ethan/school/spring25/cs6120/code/cs6120/lesson8/loop/loop.cpp
loop/CMakeFiles/LoopPass.dir/loop.cpp.o: loop/CMakeFiles/LoopPass.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/ethan/school/spring25/cs6120/code/cs6120/lesson8/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object loop/CMakeFiles/LoopPass.dir/loop.cpp.o"
	cd /Users/ethan/school/spring25/cs6120/code/cs6120/lesson8/build/loop && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT loop/CMakeFiles/LoopPass.dir/loop.cpp.o -MF CMakeFiles/LoopPass.dir/loop.cpp.o.d -o CMakeFiles/LoopPass.dir/loop.cpp.o -c /Users/ethan/school/spring25/cs6120/code/cs6120/lesson8/loop/loop.cpp

loop/CMakeFiles/LoopPass.dir/loop.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/LoopPass.dir/loop.cpp.i"
	cd /Users/ethan/school/spring25/cs6120/code/cs6120/lesson8/build/loop && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/ethan/school/spring25/cs6120/code/cs6120/lesson8/loop/loop.cpp > CMakeFiles/LoopPass.dir/loop.cpp.i

loop/CMakeFiles/LoopPass.dir/loop.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/LoopPass.dir/loop.cpp.s"
	cd /Users/ethan/school/spring25/cs6120/code/cs6120/lesson8/build/loop && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/ethan/school/spring25/cs6120/code/cs6120/lesson8/loop/loop.cpp -o CMakeFiles/LoopPass.dir/loop.cpp.s

# Object files for target LoopPass
LoopPass_OBJECTS = \
"CMakeFiles/LoopPass.dir/loop.cpp.o"

# External object files for target LoopPass
LoopPass_EXTERNAL_OBJECTS =

loop/LoopPass.dylib: loop/CMakeFiles/LoopPass.dir/loop.cpp.o
loop/LoopPass.dylib: loop/CMakeFiles/LoopPass.dir/build.make
loop/LoopPass.dylib: /opt/homebrew/opt/llvm/lib/libLLVM.dylib
loop/LoopPass.dylib: loop/CMakeFiles/LoopPass.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/ethan/school/spring25/cs6120/code/cs6120/lesson8/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared module LoopPass.dylib"
	cd /Users/ethan/school/spring25/cs6120/code/cs6120/lesson8/build/loop && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/LoopPass.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
loop/CMakeFiles/LoopPass.dir/build: loop/LoopPass.dylib
.PHONY : loop/CMakeFiles/LoopPass.dir/build

loop/CMakeFiles/LoopPass.dir/clean:
	cd /Users/ethan/school/spring25/cs6120/code/cs6120/lesson8/build/loop && $(CMAKE_COMMAND) -P CMakeFiles/LoopPass.dir/cmake_clean.cmake
.PHONY : loop/CMakeFiles/LoopPass.dir/clean

loop/CMakeFiles/LoopPass.dir/depend:
	cd /Users/ethan/school/spring25/cs6120/code/cs6120/lesson8/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/ethan/school/spring25/cs6120/code/cs6120/lesson8 /Users/ethan/school/spring25/cs6120/code/cs6120/lesson8/loop /Users/ethan/school/spring25/cs6120/code/cs6120/lesson8/build /Users/ethan/school/spring25/cs6120/code/cs6120/lesson8/build/loop /Users/ethan/school/spring25/cs6120/code/cs6120/lesson8/build/loop/CMakeFiles/LoopPass.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : loop/CMakeFiles/LoopPass.dir/depend

