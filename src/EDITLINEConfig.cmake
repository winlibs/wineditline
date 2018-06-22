set(EDITLINE_INCLUDE_DIR "${CMAKE_CURRENT_LIST_DIR}/include")

if(NOT DEFINED LIB_SUFFIX)
  if(CMAKE_SIZEOF_VOID_P MATCHES 4)
    set(LIB_SUFFIX "32")
  else()
    set(LIB_SUFFIX "64")
  endif()
endif()

if (WIN32 AND MSVC_USE_STATIC_RUNTIME)
  set(EDITLINE_LIBRARY_DIRS "${CMAKE_CURRENT_LIST_DIR}/lib${LIB_SUFFIX}/edit_a.lib")
elseif(WIN32)
  set(EDITLINE_LIBRARY_DIRS "${CMAKE_CURRENT_LIST_DIR}/bin${LIB_SUFFIX}/edit.lib")
else()
  message(WARNING "You are apparently not using Windows. We are not ready for that yet...")
endif()

set(EDITLINE_LIBRARIES "${EDITLINE_LIBRARY_DIRS}")
message(STATUS "EDITLINE_LIBRARIES: ${EDITLINE_LIBRARIES}")
set(EDITLINE_FOUND TRUE)
