#include <LPC21xx.H>
#define NULL 0
#define HEX_bm 0x000F

void IntToHexStr (unsigned int uiValue, char pcStr[]){
unsigned int uiNibbleCounter;
unsigned int uiCurrentNibble;
pcStr[0] = '0';
pcStr[1] = 'x';
for(uiNibbleCounter=0; uiNibbleCounter < 4; uiNibbleCounter++){
		uiCurrentNibble =(( uiValue >> uiNibbleCounter * 4) & HEX_bm);
		if(uiCurrentNibble < 10){
			pcStr[5 - uiNibbleCounter] = '0' + uiCurrentNibble;
		}
		else{
			pcStr[5 - uiNibbleCounter] = 'A' + (uiCurrentNibble - 10);
		}
	}
pcStr[6] = NULL;
}

//__________________________________________________________________

enum Result { OK, ERROR } eHexStringToUInt(char pcStr[],unsigned int *puiValue){
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

//__________________________________________________________________

void AppendUIntToString (unsigned int uiValue, char pcDestinationStr[]){
	unsigned char ucCharacterCounter;
	for(ucCharacterCounter=0; pcDestinationStr[ucCharacterCounter]!= NULL; ucCharacterCounter++){}
	IntToHexStr(uiValue, &pcDestinationStr[ucCharacterCounter]);
}

enum Result ReturnResult;
unsigned int AfterConversion;

int main() {
	ReturnResult = eHexStringToUInt("0xFFFA", &AfterConversion);
}
