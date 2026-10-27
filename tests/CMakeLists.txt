include(GoogleTest)
add_executable(LogServerTests smoke_test.cpp)
target_link_libraries(LogServerTests PRIVATE LogServer::core GTest::gtest_main)
gtest_discover_tests(LogServerTests)