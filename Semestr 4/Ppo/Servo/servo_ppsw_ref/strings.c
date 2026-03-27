#include "strings.h"

#define NULL 0

void CopyString(char acSource[], char acDestination[]) {
  unsigned char ucCharCounter;

  for (ucCharCounter = 0; NULL != acSource[ucCharCounter]; ucCharCounter++) {
    acDestination[ucCharCounter] = acSource[ucCharCounter];
  }
  acDestination[ucCharCounter] = NULL;
}

void ReplaceCharacterInString(char acString1[], char cOldChar, char cNewChar) {
  unsigned char ucCharCounter;

  for (ucCharCounter = 0; NULL != acString1[ucCharCounter]; ucCharCounter++) {
    if (cOldChar == acString1[ucCharCounter]) {
      acString1[ucCharCounter] = cNewChar;
    }
  }
}

enum CompResult eCompareString(char acString1[], char acString2[]) {
  unsigned char ucCharCounter;

  for (ucCharCounter = 0; acString1[ucCharCounter] == acString2[ucCharCounter]; ucCharCounter++) {
    if ((NULL == acString1[ucCharCounter]) && (NULL == acString2[ucCharCounter])) {
      return EQUAL;
    }
  }
  return NOTEQUAL;
}

void AppendString(char cSourceStr[], char cDestinationStr[]) {
  unsigned char ucCharCounter;
  for (ucCharCounter = 0; cDestinationStr[ucCharCounter] != '\0'; ucCharCounter++) {}
  CopyString(cSourceStr, cDestinationStr + ucCharCounter);
}

void UIntToHexStr(unsigned int uiValue, char cStr[]) {
  unsigned char ucTetradeNumber;
  unsigned char ucTetrade;

  cStr[0] = '0';
  cStr[1] = 'x';

  for (ucTetradeNumber = 0; ucTetradeNumber < 4; ucTetradeNumber++) {
    ucTetrade = (uiValue >> (4 * ucTetradeNumber)) & 0x000F;
    if (10 > ucTetrade) {
      cStr[5 - ucTetradeNumber] = '0' + ucTetrade;
    } else {
      cStr[5 - ucTetradeNumber] = 'A' + ucTetrade - 10;
    }
  }

  cStr[6] = NULL;

}

void AppendUIntToString(unsigned int uiValue, char cDestinationStr[]) {
  unsigned char ucCharPosition;

  for (ucCharPosition = 0; NULL != cDestinationStr[ucCharPosition]; ucCharPosition++) {}

  UIntToHexStr(uiValue, cDestinationStr + ucCharPosition);
}

enum Result eHexStringToUInt(char cStr[], unsigned int * puiValue) {
  unsigned char ucCharPosition;
  char cCurrentChar;

  if (('0' != cStr[0]) || ('x' != cStr[1]) || ('\0' == cStr[2])) {
    return ERROR;
  }

  * puiValue = 0;

  for (ucCharPosition = 2; 6 > ucCharPosition; ucCharPosition++) {
    cCurrentChar = cStr[ucCharPosition];

    if (ucCharPosition > 6) {
      return ERROR;
    }

    if (NULL == cCurrentChar) {
      return OK;
    }

    * puiValue = ( * puiValue) * 16;

    if (('0' <= cCurrentChar) && ('9' >= cCurrentChar)) {
      * puiValue = ( * puiValue) + (cCurrentChar - '0');
    } else if (('a' <= cCurrentChar) && ('f' >= cCurrentChar)) {
      * puiValue = ( * puiValue) + (cCurrentChar - 'a' + 10);
    } else {
      return ERROR;
    }
  }
  return ERROR;
}
