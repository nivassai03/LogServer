add_library(logserver_core STATIC
    CsvParser.cpp
)
target_include_directories(logserver_core PUBLIC ${PROJECT_SOURCE_DIR}/src)
add_library(LogServer::core ALIAS logserver_core)