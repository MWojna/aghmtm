#include "strings.h"
#include "decoder.h"

#define NULL 0

struct Token asTokens[MAX_TOKEN_NR];
unsigned char ucTokenNr;

struct Keyword asKeywords[KEYWORD_NR]={{ID,"id"},{CALLIB,"cal"},{GOTO,"goto"}};

char ucFindTokensInString(char * String) {
   enum State {DELIMETER,TOKEN};

   unsigned char ucCharCtr;
   char cCurrrChar;
   unsigned char ucTokenNr = 0;	 
   enum State eState = DELIMETER;

   for (ucCharCtr = 0;; ucCharCtr++) {
      cCurrrChar = String[ucCharCtr];
      switch (eState) {
         case TOKEN:
            if (' ' == cCurrrChar) {
               eState = DELIMETER;
            } else if (NULL == cCurrrChar) {
               return ucTokenNr;
            } else if (MAX_TOKEN_NR == ucTokenNr) {
               return ucTokenNr;
            } else {
               eState = TOKEN;
            }
            break;
         case DELIMETER:
            if (' ' == cCurrrChar) {
               eState = DELIMETER;
            } else if (NULL == cCurrrChar) {
               return ucTokenNr;
            } else {
               asTokens[ucTokenNr].uValue.pcString = String + ucCharCtr;
               ucTokenNr++;
               eState = TOKEN;
            }
            break;
         }
   }
}

enum Result eSringToKeyword(char cStr[], enum KeywordCode * peKeyword) {
   unsigned char ucKeywordCtr;
   for (ucKeywordCtr = 0; ucKeywordCtr < KEYWORD_NR; ucKeywordCtr++) {
      if (EQUAL == eCompareString(cStr, asKeywords[ucKeywordCtr].cString)) {
         * peKeyword = asKeywords[ucKeywordCtr].eCode;
         return OK;
      }
   }
   return ERROR;
}

void DecodeTokens(void) {
   unsigned char ucTokenCtr;
   struct Token * psToken;

   for (ucTokenCtr = 0; ucTokenCtr < ucTokenNr; ucTokenCtr++) {
      psToken = & asTokens[ucTokenCtr];
      if (OK == eSringToKeyword(psToken -> uValue.pcString, &psToken -> uValue.eKeywordCode)) {
         psToken -> eType = KEYWORD;
      } else if (OK == eHexStringToUInt(psToken -> uValue.pcString, &psToken -> uValue.uiNumber)) {
         psToken -> eType = NUMBER;
      } else {
         psToken -> eType = NUMBER;
      }
   }
}

void DecodeMsg(char * String) {
   ucTokenNr = ucFindTokensInString(String);
   ReplaceCharacterInString(String, ' ', NULL);
   DecodeTokens();
}
