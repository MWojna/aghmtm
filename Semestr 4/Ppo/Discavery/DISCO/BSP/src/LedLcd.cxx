#include <stm32f429i_discovery_lcd.h>
#include "LedLcd.h"
#include "cstdio"

LedLcd::LedLcd(unsigned char ucKol) {
	ucLedKol = ucKol;
}

void LedLcd::DrawNumbers(uint8_t NrK[2]) {
	BSP_LCD_SetFont(&Font24);
	BSP_LCD_SetTextColor(LCD_COLOR_WHITE);
	BSP_LCD_SetBackColor(LCD_COLOR_RED);
	BSP_LCD_DrawRect(ucLedKol*80, iRama*80, 80, 80);
	BSP_LCD_DisplayStringAt(ucLedKol*80, iRama*80, NrK, LEFT_MODE);
}

void LedLcd::DrawBg() {
	BSP_LCD_SetTextColor(LCD_COLOR_BLUE);
	BSP_LCD_FillRect(ucLedKol*80, 0, 80, 320);
}

void LedLcd::DrawLed(unsigned int Button) {
	BSP_LCD_SetTextColor(LCD_COLOR_GREEN);
	BSP_LCD_FillRect(ucLedKol*80, Button*80, 80, 80);
}

void LedLcd::On(unsigned int Button) {
	DrawBg();
	if(Button != 4) {
		DrawLed(Button);
	}
	for(iRama = 0; iRama < 4; iRama++) {
		uint8_t NrK[2];
		sprintf((char *)NrK, "%d", iRama);
		DrawNumbers(NrK);
	}
}
