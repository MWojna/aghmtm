#include "KeyboardTs.h"

#include <stm32f429i_discovery_ts.h>
#include <stm32f429i_discovery_lcd.h>


unsigned char ucKbKol = 0;

KeyboardTs::KeyboardTs(unsigned char ucKol) {
	int iX = BSP_LCD_GetXSize();
	int iY = BSP_LCD_GetYSize();
	BSP_TS_Init(iX, iY);
	ucKbKol = ucKol;
}

KEYBOARD KeyboardTs::eRead() {
	TS_StateTypeDef ts_state;
	BSP_TS_GetState(&ts_state);
	if (ts_state.TouchDetected > 0) {
		uint16_t xStart = ucKbKol * 80;
		uint16_t xEnd = (ucKbKol + 1) * 80;
		if (ts_state.X >= xStart && ts_state.X <= xEnd) {
				switch (ts_state.Y) {
					case 0 ... 80:
						return BUTTON_0;
						break;
					case 81 ... 160:
						return BUTTON_1;
						break;
					case 161 ... 240:
						return BUTTON_2;
						break;
					case 241 ... 320:
						return BUTTON_3;
						break;
					default:
						return UNPRESSED;;
						break;
				}
		}
	}
	return UNPRESSED;
}
