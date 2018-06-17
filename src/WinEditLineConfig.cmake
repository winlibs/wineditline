set(WinEditLine_FOUND TRUE)
set(WinEditLine_INCLUDE_DIRS "${CMAKE_CURRENT_LIST_DIR}/editline")

string(TOUPPER "${CMAKE_BUILD_TYPE}" uppercase_CMAKE_BUILD_TYPE)
if (MSVC AND uppercase_CMAKE_BUILD_TYPE MATCHES "DEBUG")
  set(WinEditLine_LIBRARY_DIRS "${PROJECT_BINARY_DIR}/src/Debug")
else()
  set(WinEditLine_LIBRARY_DIRS "${PROJECT_BINARY_DIR}/src/Release")
endif()

set(WinEditLine_LIBRARIES WinEditLine_LIBRARY_DIRS)
