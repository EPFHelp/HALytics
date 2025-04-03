# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/Users/rodriguedeguerre/esp/esp-idf/components/bootloader/subproject"
  "/Users/rodriguedeguerre/Desktop/EPFHelp/HALytics/arduino/src/build/bootloader"
  "/Users/rodriguedeguerre/Desktop/EPFHelp/HALytics/arduino/src/build/bootloader-prefix"
  "/Users/rodriguedeguerre/Desktop/EPFHelp/HALytics/arduino/src/build/bootloader-prefix/tmp"
  "/Users/rodriguedeguerre/Desktop/EPFHelp/HALytics/arduino/src/build/bootloader-prefix/src/bootloader-stamp"
  "/Users/rodriguedeguerre/Desktop/EPFHelp/HALytics/arduino/src/build/bootloader-prefix/src"
  "/Users/rodriguedeguerre/Desktop/EPFHelp/HALytics/arduino/src/build/bootloader-prefix/src/bootloader-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/Users/rodriguedeguerre/Desktop/EPFHelp/HALytics/arduino/src/build/bootloader-prefix/src/bootloader-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/Users/rodriguedeguerre/Desktop/EPFHelp/HALytics/arduino/src/build/bootloader-prefix/src/bootloader-stamp${cfgdir}") # cfgdir has leading slash
endif()
