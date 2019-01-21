#  The MIT License
#
#  Copyright (c) 2018 Jonathan Lovegren
#
#  Permission is hereby granted, free of charge, to any person obtaining a copy
#  of this software and associated documentation files (the "Software"), to deal
#  in the Software without restriction, including without limitation the rights
#  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#  copies of the Software, and to permit persons to whom the Software is
#  furnished to do so, subject to the following conditions:
#
#  The above copyright notice and this permission notice shall be included in
#  all copies or substantial portions of the Software.
#
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
#  THE SOFTWARE.


cmake_minimum_required(VERSION 3.10)
if ("${CMAKE_SOURCE_DIR}" STREQUAL "${CMAKE_BINARY_DIR}")
  message(SEND_ERROR "In-source builds are not allowed.")
endif ()

project("canboat")

add_subdirectory(common)
add_subdirectory(actisense-serial)
add_subdirectory(analyzer)
add_subdirectory(candump2analyzer)
add_subdirectory(ip)
add_subdirectory(n2kd)
add_subdirectory(nmea0183)
add_subdirectory(socketcan-writer)

# CPack configuration
set(CPACK_GENERATOR "DEB")
if("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "arm")
	message("Bulding armhf deb file.")
	set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE "armhf")
else()
	message("Building x86 deb file.")
endif()
set(CPACK_PACKAGE_VERSION_MAJOR "1")
set(CPACK_PACKAGE_VERSION_MINOR "1")
set(CPACK_PACKAGE_VERSION_PATCH "0")
set(CPACK_DEBIAN_PACKAGE_DEPENDS "")
set(CPACK_PACKAGE_DESCRIPTION "canboat from CMake")
set(CPACK_PACKAGE_CONTACT "Jonathan Lovegren jalovegren@gmail.com")
include(CPack)
