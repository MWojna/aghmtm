#ifndef LEDLCD_H
#define LEDLCD_H

#include "KeyboardTs.h"

class LedLcd {
public:
	void On(unsigned int Button);
	LedLcd(unsigned char ucKol);
};

#endif
