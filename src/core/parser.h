#pragma once
#include <vector>
#include <string>

enum class ParserStatus
{
    Success,
    EndOfFile,
    MalformedRow,
    MalformedQuote
};

struct ParserOptions
{
    char _delimiter = ',';
    char _quote = '"';
    size_t _expectedCols = 0;
};

class Parser
{
    public:
    virtual ParserStatus ReadNext(std::vector<std::string>& row) = 0;
    ~Parser() = default;
};

class CsvParser:public Parser
{
    private:
    std::istream& _file;
    std::vector<char> _buffer;
    std::vector<std::string> _row;
    std::string _field;

    bool EnsureData();
    bool NextChar(char& c);
    int PeekChar();

    public:
    ParserStatus ReadNext(std::vector<std::string>& row) override;
};