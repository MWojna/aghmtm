#include "KeyboardTs.h"
#include <stm32f429i_discovery_ts.h>
#include <stm32f429i_discovery_lcd.h>


unsigned char ucKbKol = 0;

KeyboardTs::KeyboardTs(unsigned char ucKol) {
	BSP_TS_Init(BSP_LCD_GetXSize(), BSP_LCD_GetYSize());
	ucKbKol = ucKol;
}

KEYBOARD KeyboardTs::eRead() {
	TS_StateTypeDef ts_state;
	BSP_TS_GetState(&ts_state);
	if (ts_state.TouchDetected > 0) {
		int Start = ucKbKol * 80;
		int End = (ucKbKol + 1) * 80;
		if (ts_state.X >= Start && ts_state.X <= End) {
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
