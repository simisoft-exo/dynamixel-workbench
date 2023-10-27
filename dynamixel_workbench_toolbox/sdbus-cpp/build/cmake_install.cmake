# Install script for directory: /home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/libsdbus-c++.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sdbus-c++" TYPE FILE FILES
    "/home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/include/sdbus-c++/ConvenienceApiClasses.h"
    "/home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/include/sdbus-c++/ConvenienceApiClasses.inl"
    "/home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/include/sdbus-c++/Error.h"
    "/home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/include/sdbus-c++/IConnection.h"
    "/home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/include/sdbus-c++/AdaptorInterfaces.h"
    "/home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/include/sdbus-c++/ProxyInterfaces.h"
    "/home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/include/sdbus-c++/StandardInterfaces.h"
    "/home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/include/sdbus-c++/IObject.h"
    "/home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/include/sdbus-c++/IProxy.h"
    "/home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/include/sdbus-c++/Message.h"
    "/home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/include/sdbus-c++/MethodResult.h"
    "/home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/include/sdbus-c++/Types.h"
    "/home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/include/sdbus-c++/TypeTraits.h"
    "/home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/include/sdbus-c++/Flags.h"
    "/home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/include/sdbus-c++/sdbus-c++.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdocx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/sdbus-c++" TYPE FILE FILES
    "/home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/README"
    "/home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/README.md"
    "/home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/NEWS"
    "/home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/COPYING"
    "/home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/ChangeLog"
    "/home/ubuntu/wavelamp/dynamixel-workbench/sdbus-cpp/AUTHORS"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/sdbus-c++/sdbus-c++-targets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/sdbus-c++/sdbus-c++-targets.cmake"
         "/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/Export/lib/cmake/sdbus-c++/sdbus-c++-targets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/sdbus-c++/sdbus-c++-targets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/sdbus-c++/sdbus-c++-targets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/sdbus-c++" TYPE FILE FILES "/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/Export/lib/cmake/sdbus-c++/sdbus-c++-targets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/sdbus-c++" TYPE FILE FILES "/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/CMakeFiles/Export/lib/cmake/sdbus-c++/sdbus-c++-targets-noconfig.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/sdbus-c++" TYPE FILE FILES
    "/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/cmake/sdbus-c++-config.cmake"
    "/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/cmake/sdbus-c++-config-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/pkgconfig/sdbus-c++.pc")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/ubuntu/wavelamp/dynamixel-workbench/dynamixel_workbench_toolbox/sdbus-cpp/build/docs/cmake_install.cmake")

endif()

