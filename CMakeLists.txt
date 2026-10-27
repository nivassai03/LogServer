cmake_minimum_required(VERSION 3.28)

project(LogServer LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

if(MSVC)
    set(CMAKE_MSVC_DEBUG_INFORMATION_FORMAT "$<$<CONFIG:Debug,Release,RelWithDebInfo>:ProgramDatabase>")
    add_link_options($<$<CONFIG:Release>:/DEBUG> $<$<CONFIG:Release>:/OPT:REF> $<$<CONFIG:Release>:/OPT:ICF>)
else()
    add_compile_options($<$<CONFIG:Release>:-g> $<$<CONFIG:Release>:-fno-omit-frame-pointer>)
endif()

include(cmake/Dependencies.cmake)

add_subdirectory(src/core)
add_subdirectory(src)


enable_testing()
add_subdirectory(tests)


