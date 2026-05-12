/*
 * KeyboardTsLcd.cxx
 *
 *  Created on: 12 May 2026
 *      Author: micha
 */

#include "KeyboardTsLcd.h"

KeyboardTsLcd::KeyboardTsLcd(unsigned char _ucColumn) {
	pKeyboard	= new KeyboardTs(_ucColumn);
	pLed			= new LedLcd(_ucColumn);
}

KEYBOARD KeyboardTsLcd::eRead() {
	switch(pKeyboard->eRead()) {
		case BUTTON_0:
			pLed->On(0);
			return BUTTON_0;
			break;
		case BUTTON_1:
			pLed->On(1);
			return BUTTON_1;
			break;
		case BUTTON_2:
			pLed->On(2);
			return BUTTON_2;
			break;
		case BUTTON_3:
			pLed->On(3);
			return BUTTON_3;
			break;
		default :
			pLed->On(4);
			return UNPRESSED;
			break;
	}
}

