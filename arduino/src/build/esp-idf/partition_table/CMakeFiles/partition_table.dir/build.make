# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.29

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
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.29.2/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.29.2/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/rodriguedeguerre/Desktop/EPFHelp/HALytics/arduino/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/rodriguedeguerre/Desktop/EPFHelp/HALytics/arduino/src/build

# Utility rule file for partition_table.

# Include any custom commands dependencies for this target.
include esp-idf/partition_table/CMakeFiles/partition_table.dir/compiler_depend.make

# Include the progress variables for this target.
include esp-idf/partition_table/CMakeFiles/partition_table.dir/progress.make

esp-idf/partition_table/CMakeFiles/partition_table:
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/rodriguedeguerre/Desktop/EPFHelp/HALytics/arduino/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Warning: command \"partition_table\" is deprecated. Have you wanted to run \"partition-table\" instead?"
	cd /Users/rodriguedeguerre/Desktop/EPFHelp/HALytics/arduino/src/build/esp-idf/partition_table && /opt/homebrew/Cellar/cmake/3.29.2/bin/cmake -E echo 

partition_table: esp-idf/partition_table/CMakeFiles/partition_table
partition_table: esp-idf/partition_table/CMakeFiles/partition_table.dir/build.make
.PHONY : partition_table

# Rule to build all files generated by this target.
esp-idf/partition_table/CMakeFiles/partition_table.dir/build: partition_table
.PHONY : esp-idf/partition_table/CMakeFiles/partition_table.dir/build

esp-idf/partition_table/CMakeFiles/partition_table.dir/clean:
	cd /Users/rodriguedeguerre/Desktop/EPFHelp/HALytics/arduino/src/build/esp-idf/partition_table && $(CMAKE_COMMAND) -P CMakeFiles/partition_table.dir/cmake_clean.cmake
.PHONY : esp-idf/partition_table/CMakeFiles/partition_table.dir/clean

esp-idf/partition_table/CMakeFiles/partition_table.dir/depend:
	cd /Users/rodriguedeguerre/Desktop/EPFHelp/HALytics/arduino/src/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/rodriguedeguerre/Desktop/EPFHelp/HALytics/arduino/src /Users/rodriguedeguerre/esp/esp-idf/components/partition_table /Users/rodriguedeguerre/Desktop/EPFHelp/HALytics/arduino/src/build /Users/rodriguedeguerre/Desktop/EPFHelp/HALytics/arduino/src/build/esp-idf/partition_table /Users/rodriguedeguerre/Desktop/EPFHelp/HALytics/arduino/src/build/esp-idf/partition_table/CMakeFiles/partition_table.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : esp-idf/partition_table/CMakeFiles/partition_table.dir/depend

