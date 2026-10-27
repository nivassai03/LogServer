include(FetchContent)

set(BUILD_SHARED_LIBS OFF CACHE BOOL "" FORCE)
set(BOOST_INCLUDE_LIBRARIES asio beast json url)

FetchContent_Declare(Boost
URL https://github.com/boostorg/boost/releases/download/boost-1.91.0-1/boost-1.91.0-1-cmake.tar.xz
DOWNLOAD_EXTRACT_TIMESTAMP ON
EXCLUDE_FROM_ALL)

set(BUILD_STATIC_LIBS ON CACHE BOOL "" FORCE)
set(BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
set(BUILD_TESTING OFF CACHE BOOL "" FORCE)
set(ENABLE_ZLIB_COMPRESSION OFF CACHE BOOL "" FORCE)

if(WIN32)
    set(CRYPTO_BACKEND WinCNG CACHE STRING "" FORCE)
else()
    set(CRYPTO_BACKEND OpenSSL CACHE STRING "" FORCE)
endif()


FetchContent_Declare(libssh2
GIT_REPOSITORY https://github.com/libssh2/libssh2.git
GIT_TAG libssh2-1.11.1
GIT_SHALLOW ON
EXCLUDE_FROM_ALL)

set(SODIUM_DISABLE_TESTS ON CACHE BOOL "" FORCE)
FetchContent_Declare(Sodium
GIT_REPOSITORY https://github.com/robinlinden/libsodium-cmake.git
GIT_TAG master
EXCLUDE_FROM_ALL)

set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
set(INSTALL_GTEST OFF CACHE BOOL "" FORCE)
FetchContent_Declare(googletest 
URL https://github.com/google/googletest/archive/refs/tags/v1.17.0.zip
DOWNLOAD_EXTRACT_TIMESTAMP ON
EXCLUDE_FROM_ALL)

FetchContent_MakeAvailable(Boost libssh2 Sodium googletest)

