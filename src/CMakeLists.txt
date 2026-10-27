add_executable(LogServer main.cpp)
target_link_libraries(LogServer PRIVATE
LogServer::core
Boost::asio Boost::beast Boost::json Boost::url
libssh2_static
sodium)

if(WIN32)
    target_compile_definitions(LogServer PRIVATE _WIN32_WINNT=0x0A00)
endif()