#include "jakiestampotrzebnefunkcje.h"

#define NULL 0

enum CompResult eCompareString(const char cStr1[], const char cStr2[]) {
		unsigned char cLoopCounter;
    for (cLoopCounter = 0; ; cLoopCounter++) {
        if (cStr1[cLoopCounter] != cStr2[cLoopCounter] || cStr1[cLoopCounter] == NULL) {
            return (cStr1[cLoopCounter] == cStr2[cLoopCounter]) ? EQUAL : DIFFERENT;
        }
    }
}

enum Result eHexStringToUInt(char pcStr[],unsigned int *puiValue){
	unsigned int uiCharacterCounter;
	unsigned int uiCurrentCharacter;
	if((pcStr[0]!= '0')||(pcStr[1]!='x')||(pcStr[2] == NULL)){
		return ERROR;
	}
	for(uiCharacterCounter = 2 ; pcStr[uiCharacterCounter] != NULL ; uiCharacterCounter++){
		uiCurrentCharacter = pcStr[uiCharacterCounter];
		if (uiCharacterCounter == 6){
			return ERROR;
		}
		*puiValue = *puiValue << 4;
		if(uiCurrentCharacter >= '0' && uiCurrentCharacter <= '9'){
			uiCurrentCharacter = uiCurrentCharacter-'0';
		}
		else if(uiCurrentCharacter >= 'A' && uiCurrentCharacter <= 'F'){
			uiCurrentCharacter = uiCurrentCharacter - 'A' + 10;
		}
		else{
			return ERROR;
		}
		*puiValue |= uiCurrentCharacter;
	}
	return OK;
}

void ReplaceCharactersInString(char cStr[], char cOldChar, char cNewChar) {
		unsigned char cLoopCounter;
		for (cLoopCounter = 0; cStr[cLoopCounter] != NULL; cLoopCounter++) {
			if (cStr[cLoopCounter] == cOldChar) {
				cStr[cLoopCounter] = cNewChar;
			}
		}
}
