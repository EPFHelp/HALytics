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

# Include any dependencies generated for this target.
include esp-idf/cmock/CMakeFiles/__idf_cmock.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include esp-idf/cmock/CMakeFiles/__idf_cmock.dir/compiler_depend.make

# Include the progress variables for this target.
include esp-idf/cmock/CMakeFiles/__idf_cmock.dir/progress.make

# Include the compile flags for this target's objects.
include esp-idf/cmock/CMakeFiles/__idf_cmock.dir/flags.make

esp-idf/cmock/CMakeFiles/__idf_cmock.dir/CMock/src/cmock.c.obj: esp-idf/cmock/CMakeFiles/__idf_cmock.dir/flags.make
esp-idf/cmock/CMakeFiles/__idf_cmock.dir/CMock/src/cmock.c.obj: /Users/rodriguedeguerre/esp/esp-idf/components/cmock/CMock/src/cmock.c
esp-idf/cmock/CMakeFiles/__idf_cmock.dir/CMock/src/cmock.c.obj: esp-idf/cmock/CMakeFiles/__idf_cmock.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/rodriguedeguerre/Desktop/EPFHelp/HALytics/arduino/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object esp-idf/cmock/CMakeFiles/__idf_cmock.dir/CMock/src/cmock.c.obj"
	cd /Users/rodriguedeguerre/Desktop/EPFHelp/HALytics/arduino/src/build/esp-idf/cmock && /Users/rodriguedeguerre/.espressif/tools/riscv32-esp-elf/esp-12.2.0_20230208/riscv32-esp-elf/bin/riscv32-esp-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT esp-idf/cmock/CMakeFiles/__idf_cmock.dir/CMock/src/cmock.c.obj -MF CMakeFiles/__idf_cmock.dir/CMock/src/cmock.c.obj.d -o CMakeFiles/__idf_cmock.dir/CMock/src/cmock.c.obj -c /Users/rodriguedeguerre/esp/esp-idf/components/cmock/CMock/src/cmock.c

esp-idf/cmock/CMakeFiles/__idf_cmock.dir/CMock/src/cmock.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/__idf_cmock.dir/CMock/src/cmock.c.i"
	cd /Users/rodriguedeguerre/Desktop/EPFHelp/HALytics/arduino/src/build/esp-idf/cmock && /Users/rodriguedeguerre/.espressif/tools/riscv32-esp-elf/esp-12.2.0_20230208/riscv32-esp-elf/bin/riscv32-esp-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/rodriguedeguerre/esp/esp-idf/components/cmock/CMock/src/cmock.c > CMakeFiles/__idf_cmock.dir/CMock/src/cmock.c.i

esp-idf/cmock/CMakeFiles/__idf_cmock.dir/CMock/src/cmock.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/__idf_cmock.dir/CMock/src/cmock.c.s"
	cd /Users/rodriguedeguerre/Desktop/EPFHelp/HALytics/arduino/src/build/esp-idf/cmock && /Users/rodriguedeguerre/.espressif/tools/riscv32-esp-elf/esp-12.2.0_20230208/riscv32-esp-elf/bin/riscv32-esp-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/rodriguedeguerre/esp/esp-idf/components/cmock/CMock/src/cmock.c -o CMakeFiles/__idf_cmock.dir/CMock/src/cmock.c.s

# Object files for target __idf_cmock
__idf_cmock_OBJECTS = \
"CMakeFiles/__idf_cmock.dir/CMock/src/cmock.c.obj"

# External object files for target __idf_cmock
__idf_cmock_EXTERNAL_OBJECTS =

esp-idf/cmock/libcmock.a: esp-idf/cmock/CMakeFiles/__idf_cmock.dir/CMock/src/cmock.c.obj
esp-idf/cmock/libcmock.a: esp-idf/cmock/CMakeFiles/__idf_cmock.dir/build.make
esp-idf/cmock/libcmock.a: esp-idf/cmock/CMakeFiles/__idf_cmock.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/rodriguedeguerre/Desktop/EPFHelp/HALytics/arduino/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C static library libcmock.a"
	cd /Users/rodriguedeguerre/Desktop/EPFHelp/HALytics/arduino/src/build/esp-idf/cmock && $(CMAKE_COMMAND) -P CMakeFiles/__idf_cmock.dir/cmake_clean_target.cmake
	cd /Users/rodriguedeguerre/Desktop/EPFHelp/HALytics/arduino/src/build/esp-idf/cmock && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/__idf_cmock.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
esp-idf/cmock/CMakeFiles/__idf_cmock.dir/build: esp-idf/cmock/libcmock.a
.PHONY : esp-idf/cmock/CMakeFiles/__idf_cmock.dir/build

esp-idf/cmock/CMakeFiles/__idf_cmock.dir/clean:
	cd /Users/rodriguedeguerre/Desktop/EPFHelp/HALytics/arduino/src/build/esp-idf/cmock && $(CMAKE_COMMAND) -P CMakeFiles/__idf_cmock.dir/cmake_clean.cmake
.PHONY : esp-idf/cmock/CMakeFiles/__idf_cmock.dir/clean

esp-idf/cmock/CMakeFiles/__idf_cmock.dir/depend:
	cd /Users/rodriguedeguerre/Desktop/EPFHelp/HALytics/arduino/src/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/rodriguedeguerre/Desktop/EPFHelp/HALytics/arduino/src /Users/rodriguedeguerre/esp/esp-idf/components/cmock /Users/rodriguedeguerre/Desktop/EPFHelp/HALytics/arduino/src/build /Users/rodriguedeguerre/Desktop/EPFHelp/HALytics/arduino/src/build/esp-idf/cmock /Users/rodriguedeguerre/Desktop/EPFHelp/HALytics/arduino/src/build/esp-idf/cmock/CMakeFiles/__idf_cmock.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : esp-idf/cmock/CMakeFiles/__idf_cmock.dir/depend

