# Install script for directory: F:/WorkSpace/Flutter/flutter_cookbook/windows

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "$<TARGET_FILE_DIR:cookbook>")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
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

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("F:/WorkSpace/Flutter/flutter_cookbook/windows/flutter/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("F:/WorkSpace/Flutter/flutter_cookbook/windows/plugins/dart_vlc/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("F:/WorkSpace/Flutter/flutter_cookbook/windows/plugins/flutter_native_view/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("F:/WorkSpace/Flutter/flutter_cookbook/windows/plugins/permission_handler_windows/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("F:/WorkSpace/Flutter/flutter_cookbook/windows/plugins/window_manager/cmake_install.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Debug/cookbook.exe")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Debug" TYPE EXECUTABLE FILES "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Debug/cookbook.exe")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Profile/cookbook.exe")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Profile" TYPE EXECUTABLE FILES "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Profile/cookbook.exe")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Release/cookbook.exe")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Release" TYPE EXECUTABLE FILES "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Release/cookbook.exe")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Debug/data/icudtl.dat")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Debug/data" TYPE FILE FILES "F:/WorkSpace/Flutter/flutter_cookbook/windows/flutter/ephemeral/icudtl.dat")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Profile/data/icudtl.dat")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Profile/data" TYPE FILE FILES "F:/WorkSpace/Flutter/flutter_cookbook/windows/flutter/ephemeral/icudtl.dat")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Release/data/icudtl.dat")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Release/data" TYPE FILE FILES "F:/WorkSpace/Flutter/flutter_cookbook/windows/flutter/ephemeral/icudtl.dat")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Debug/flutter_windows.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Debug" TYPE FILE FILES "F:/WorkSpace/Flutter/flutter_cookbook/windows/flutter/ephemeral/flutter_windows.dll")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Profile/flutter_windows.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Profile" TYPE FILE FILES "F:/WorkSpace/Flutter/flutter_cookbook/windows/flutter/ephemeral/flutter_windows.dll")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Release/flutter_windows.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Release" TYPE FILE FILES "F:/WorkSpace/Flutter/flutter_cookbook/windows/flutter/ephemeral/flutter_windows.dll")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Debug/dart_vlc_plugin.dll;F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Debug/libvlc.dll;F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Debug/libvlccore.dll;F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Debug/plugins;F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Debug/flutter_native_view_plugin.dll;F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Debug/permission_handler_windows_plugin.dll;F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Debug/window_manager_plugin.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Debug" TYPE FILE FILES
      "F:/WorkSpace/Flutter/flutter_cookbook/windows/plugins/dart_vlc/Debug/dart_vlc_plugin.dll"
      "F:/WorkSpace/Flutter/flutter_cookbook/windows/dart_vlc_core_packages/vlc-3.0.9.2/libvlc.dll"
      "F:/WorkSpace/Flutter/flutter_cookbook/windows/dart_vlc_core_packages/vlc-3.0.9.2/libvlccore.dll"
      "F:/WorkSpace/Flutter/flutter_cookbook/windows/dart_vlc_core_packages/vlc-3.0.9.2/plugins"
      "F:/WorkSpace/Flutter/flutter_cookbook/windows/plugins/flutter_native_view/Debug/flutter_native_view_plugin.dll"
      "F:/WorkSpace/Flutter/flutter_cookbook/windows/plugins/permission_handler_windows/Debug/permission_handler_windows_plugin.dll"
      "F:/WorkSpace/Flutter/flutter_cookbook/windows/plugins/window_manager/Debug/window_manager_plugin.dll"
      )
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Profile/dart_vlc_plugin.dll;F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Profile/libvlc.dll;F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Profile/libvlccore.dll;F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Profile/plugins;F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Profile/flutter_native_view_plugin.dll;F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Profile/permission_handler_windows_plugin.dll;F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Profile/window_manager_plugin.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Profile" TYPE FILE FILES
      "F:/WorkSpace/Flutter/flutter_cookbook/windows/plugins/dart_vlc/Profile/dart_vlc_plugin.dll"
      "F:/WorkSpace/Flutter/flutter_cookbook/windows/dart_vlc_core_packages/vlc-3.0.9.2/libvlc.dll"
      "F:/WorkSpace/Flutter/flutter_cookbook/windows/dart_vlc_core_packages/vlc-3.0.9.2/libvlccore.dll"
      "F:/WorkSpace/Flutter/flutter_cookbook/windows/dart_vlc_core_packages/vlc-3.0.9.2/plugins"
      "F:/WorkSpace/Flutter/flutter_cookbook/windows/plugins/flutter_native_view/Profile/flutter_native_view_plugin.dll"
      "F:/WorkSpace/Flutter/flutter_cookbook/windows/plugins/permission_handler_windows/Profile/permission_handler_windows_plugin.dll"
      "F:/WorkSpace/Flutter/flutter_cookbook/windows/plugins/window_manager/Profile/window_manager_plugin.dll"
      )
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Release/dart_vlc_plugin.dll;F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Release/libvlc.dll;F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Release/libvlccore.dll;F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Release/plugins;F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Release/flutter_native_view_plugin.dll;F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Release/permission_handler_windows_plugin.dll;F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Release/window_manager_plugin.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Release" TYPE FILE FILES
      "F:/WorkSpace/Flutter/flutter_cookbook/windows/plugins/dart_vlc/Release/dart_vlc_plugin.dll"
      "F:/WorkSpace/Flutter/flutter_cookbook/windows/dart_vlc_core_packages/vlc-3.0.9.2/libvlc.dll"
      "F:/WorkSpace/Flutter/flutter_cookbook/windows/dart_vlc_core_packages/vlc-3.0.9.2/libvlccore.dll"
      "F:/WorkSpace/Flutter/flutter_cookbook/windows/dart_vlc_core_packages/vlc-3.0.9.2/plugins"
      "F:/WorkSpace/Flutter/flutter_cookbook/windows/plugins/flutter_native_view/Release/flutter_native_view_plugin.dll"
      "F:/WorkSpace/Flutter/flutter_cookbook/windows/plugins/permission_handler_windows/Release/permission_handler_windows_plugin.dll"
      "F:/WorkSpace/Flutter/flutter_cookbook/windows/plugins/window_manager/Release/window_manager_plugin.dll"
      )
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    
  file(REMOVE_RECURSE "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Debug/data/flutter_assets")
  
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    
  file(REMOVE_RECURSE "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Profile/data/flutter_assets")
  
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    
  file(REMOVE_RECURSE "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Release/data/flutter_assets")
  
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Debug/data/flutter_assets")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Debug/data" TYPE DIRECTORY FILES "F:/WorkSpace/Flutter/flutter_cookbook/build//flutter_assets")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Profile/data/flutter_assets")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Profile/data" TYPE DIRECTORY FILES "F:/WorkSpace/Flutter/flutter_cookbook/build//flutter_assets")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Release/data/flutter_assets")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Release/data" TYPE DIRECTORY FILES "F:/WorkSpace/Flutter/flutter_cookbook/build//flutter_assets")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Profile/data/app.so")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Profile/data" TYPE FILE FILES "F:/WorkSpace/Flutter/flutter_cookbook/build/windows/app.so")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Release/data/app.so")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "F:/WorkSpace/Flutter/flutter_cookbook/windows/runner/Release/data" TYPE FILE FILES "F:/WorkSpace/Flutter/flutter_cookbook/build/windows/app.so")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "F:/WorkSpace/Flutter/flutter_cookbook/windows/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
