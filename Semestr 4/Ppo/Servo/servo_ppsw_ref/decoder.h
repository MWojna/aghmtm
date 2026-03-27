#define MAX_TOKEN_NR 2            //maksymalna dopuszczalna ilosc tokenów 
#define MAX_KEYWORD_STRING_LTH 10 // mksymalna dlugosc komendy 
#define KEYWORD_NR 4              // liczba zdefiniowanych keywordow

enum TokenType {
   KEYWORD,
   NUMBER,
   STRING
};

enum KeywordCode {
   ID,
   CALLIB,
   GOTO,
   STEP
};

struct Keyword {
   enum KeywordCode eCode;
   char cString[MAX_KEYWORD_STRING_LTH + 1];
};

union TokenValue {
   enum KeywordCode eKeywordCode; // jezeli KEYWORD unsigned 
   unsigned int uiNumber;  // jezeli NUMBER 
   char * pcString;        // jezeli STRING 
};

struct Token {
   enum TokenType eType;    // KEYWORD, NUMBER, STRING 
   union TokenValue uValue; // enum, unsigned int, char* 
};

void DecodeMsg(char * String);
