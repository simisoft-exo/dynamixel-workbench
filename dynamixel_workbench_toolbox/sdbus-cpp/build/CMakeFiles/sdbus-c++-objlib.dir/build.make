# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/examples

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/examples/build

# Include any dependencies generated for this target.
include /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/depend.make

# Include the progress variables for this target.
include /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/progress.make

# Include the compile flags for this target's objects.
include /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/flags.make

/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Connection.cpp.o: /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/flags.make
/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Connection.cpp.o: /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/src/Connection.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/examples/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Connection.cpp.o"
	cd /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/sdbus-c++-objlib.dir/src/Connection.cpp.o -c /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/src/Connection.cpp

/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Connection.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sdbus-c++-objlib.dir/src/Connection.cpp.i"
	cd /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/src/Connection.cpp > CMakeFiles/sdbus-c++-objlib.dir/src/Connection.cpp.i

/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Connection.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sdbus-c++-objlib.dir/src/Connection.cpp.s"
	cd /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/src/Connection.cpp -o CMakeFiles/sdbus-c++-objlib.dir/src/Connection.cpp.s

/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Error.cpp.o: /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/flags.make
/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Error.cpp.o: /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/src/Error.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/examples/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Error.cpp.o"
	cd /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/sdbus-c++-objlib.dir/src/Error.cpp.o -c /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/src/Error.cpp

/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Error.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sdbus-c++-objlib.dir/src/Error.cpp.i"
	cd /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/src/Error.cpp > CMakeFiles/sdbus-c++-objlib.dir/src/Error.cpp.i

/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Error.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sdbus-c++-objlib.dir/src/Error.cpp.s"
	cd /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/src/Error.cpp -o CMakeFiles/sdbus-c++-objlib.dir/src/Error.cpp.s

/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Message.cpp.o: /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/flags.make
/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Message.cpp.o: /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/src/Message.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/examples/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Message.cpp.o"
	cd /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/sdbus-c++-objlib.dir/src/Message.cpp.o -c /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/src/Message.cpp

/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Message.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sdbus-c++-objlib.dir/src/Message.cpp.i"
	cd /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/src/Message.cpp > CMakeFiles/sdbus-c++-objlib.dir/src/Message.cpp.i

/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Message.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sdbus-c++-objlib.dir/src/Message.cpp.s"
	cd /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/src/Message.cpp -o CMakeFiles/sdbus-c++-objlib.dir/src/Message.cpp.s

/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Object.cpp.o: /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/flags.make
/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Object.cpp.o: /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/src/Object.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/examples/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Object.cpp.o"
	cd /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/sdbus-c++-objlib.dir/src/Object.cpp.o -c /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/src/Object.cpp

/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Object.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sdbus-c++-objlib.dir/src/Object.cpp.i"
	cd /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/src/Object.cpp > CMakeFiles/sdbus-c++-objlib.dir/src/Object.cpp.i

/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Object.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sdbus-c++-objlib.dir/src/Object.cpp.s"
	cd /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/src/Object.cpp -o CMakeFiles/sdbus-c++-objlib.dir/src/Object.cpp.s

/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Proxy.cpp.o: /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/flags.make
/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Proxy.cpp.o: /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/src/Proxy.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/examples/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Proxy.cpp.o"
	cd /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/sdbus-c++-objlib.dir/src/Proxy.cpp.o -c /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/src/Proxy.cpp

/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Proxy.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sdbus-c++-objlib.dir/src/Proxy.cpp.i"
	cd /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/src/Proxy.cpp > CMakeFiles/sdbus-c++-objlib.dir/src/Proxy.cpp.i

/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Proxy.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sdbus-c++-objlib.dir/src/Proxy.cpp.s"
	cd /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/src/Proxy.cpp -o CMakeFiles/sdbus-c++-objlib.dir/src/Proxy.cpp.s

/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Types.cpp.o: /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/flags.make
/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Types.cpp.o: /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/src/Types.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/examples/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Types.cpp.o"
	cd /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/sdbus-c++-objlib.dir/src/Types.cpp.o -c /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/src/Types.cpp

/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Types.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sdbus-c++-objlib.dir/src/Types.cpp.i"
	cd /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/src/Types.cpp > CMakeFiles/sdbus-c++-objlib.dir/src/Types.cpp.i

/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Types.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sdbus-c++-objlib.dir/src/Types.cpp.s"
	cd /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/src/Types.cpp -o CMakeFiles/sdbus-c++-objlib.dir/src/Types.cpp.s

/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Flags.cpp.o: /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/flags.make
/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Flags.cpp.o: /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/src/Flags.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/examples/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Flags.cpp.o"
	cd /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/sdbus-c++-objlib.dir/src/Flags.cpp.o -c /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/src/Flags.cpp

/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Flags.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sdbus-c++-objlib.dir/src/Flags.cpp.i"
	cd /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/src/Flags.cpp > CMakeFiles/sdbus-c++-objlib.dir/src/Flags.cpp.i

/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Flags.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sdbus-c++-objlib.dir/src/Flags.cpp.s"
	cd /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/src/Flags.cpp -o CMakeFiles/sdbus-c++-objlib.dir/src/Flags.cpp.s

/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/VTableUtils.c.o: /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/flags.make
/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/VTableUtils.c.o: /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/src/VTableUtils.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/examples/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/VTableUtils.c.o"
	cd /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/sdbus-c++-objlib.dir/src/VTableUtils.c.o   -c /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/src/VTableUtils.c

/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/VTableUtils.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sdbus-c++-objlib.dir/src/VTableUtils.c.i"
	cd /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/src/VTableUtils.c > CMakeFiles/sdbus-c++-objlib.dir/src/VTableUtils.c.i

/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/VTableUtils.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sdbus-c++-objlib.dir/src/VTableUtils.c.s"
	cd /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/src/VTableUtils.c -o CMakeFiles/sdbus-c++-objlib.dir/src/VTableUtils.c.s

/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/SdBus.cpp.o: /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/flags.make
/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/SdBus.cpp.o: /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/src/SdBus.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/examples/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/SdBus.cpp.o"
	cd /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/sdbus-c++-objlib.dir/src/SdBus.cpp.o -c /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/src/SdBus.cpp

/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/SdBus.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sdbus-c++-objlib.dir/src/SdBus.cpp.i"
	cd /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/src/SdBus.cpp > CMakeFiles/sdbus-c++-objlib.dir/src/SdBus.cpp.i

/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/SdBus.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sdbus-c++-objlib.dir/src/SdBus.cpp.s"
	cd /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/src/SdBus.cpp -o CMakeFiles/sdbus-c++-objlib.dir/src/SdBus.cpp.s

sdbus-c++-objlib: /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Connection.cpp.o
sdbus-c++-objlib: /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Error.cpp.o
sdbus-c++-objlib: /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Message.cpp.o
sdbus-c++-objlib: /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Object.cpp.o
sdbus-c++-objlib: /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Proxy.cpp.o
sdbus-c++-objlib: /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Types.cpp.o
sdbus-c++-objlib: /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/Flags.cpp.o
sdbus-c++-objlib: /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/VTableUtils.c.o
sdbus-c++-objlib: /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/src/SdBus.cpp.o
sdbus-c++-objlib: /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/build.make

.PHONY : sdbus-c++-objlib

# Rule to build all files generated by this target.
/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/build: sdbus-c++-objlib

.PHONY : /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/build

/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/clean:
	cd /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build && $(CMAKE_COMMAND) -P CMakeFiles/sdbus-c++-objlib.dir/cmake_clean.cmake
.PHONY : /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/clean

/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/depend:
	cd /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/examples/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/examples /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/examples/build /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : /home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/sdbus-c++-objlib.dir/depend
