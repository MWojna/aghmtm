#ifndef LEDLCD_H
#define LEDLCD_H

#include <stm32f429i_discovery_lcd.h>

class LedLcd {
public:
	void On(unsigned int Button);
	LedLcd(unsigned char ucKol);
private:
	unsigned char ucLedKol = 0;
	int iRama = 0;
	void DrawNumbers(uint8_t NrK[2]);
	void DrawBg();
	void DrawLed(unsigned int Button);
};

#endif
