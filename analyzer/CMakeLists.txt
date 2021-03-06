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

get_filename_component(TARGET_NAME ${CMAKE_CURRENT_SOURCE_DIR} NAME)

# PGN Library
add_library(pgn
	pgn.c)

target_include_directories(pgn
  PUBLIC "../common")

set_property(TARGET pgn PROPERTY C_STANDARD 99)

# Analyzer
add_executable(${TARGET_NAME}
	analyzer.c)

target_link_libraries(${TARGET_NAME}
	pgn
	common)

target_include_directories(${TARGET_NAME}
  PUBLIC "../common")

set_property(TARGET ${TARGET_NAME} PROPERTY C_STANDARD 99)

install(TARGETS ${TARGET_NAME} RUNTIME DESTINATION /usr/bin COMPONENT binaries)
