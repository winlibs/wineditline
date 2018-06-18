set(WinEditLine_INCLUDE_DIRS "${CMAKE_INSTALL_PREFIX}/include/editline")

if(NOT DEFINED LIB_SUFFIX)
  if(CMAKE_SIZEOF_VOID_P MATCHES 4)
    set(LIB_SUFFIX "32")
  else()
    set(LIB_SUFFIX "64")
  endif()
endif()

if (MSVC AND MSVC_USE_STATIC_RUNTIME)
  set(WinEditLine_LIBRARY_DIRS "${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX}")
else()
  set(WinEditLine_LIBRARY_DIRS "${CMAKE_INSTALL_PREFIX}/bin${LIB_SUFFIX}")
endif()

set(WinEditLine_LIBRARIES WinEditLine_LIBRARY_DIRS)
set(WinEditLine_FOUND TRUE)
