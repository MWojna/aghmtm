/*
 * KeyboardTsLcd.h
 *
 *  Created on: 12 May 2026
 *      Author: micha
 */

#ifndef KEYBOARDTSLCD_H_
#define KEYBOARDTSLCD_H_

#include "KeyboardTs.h"
#include "LedLcd.h"

class KeyboardTsLcd {
private:
	KeyboardTs *pKeyboard;
	LedLcd *pLed;
public:
	KEYBOARD eRead();
	KeyboardTsLcd(unsigned char _ucColumn = 0);
};

#endif /* KEYBOARDTSLCD_H_ */
