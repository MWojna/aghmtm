#include "KeyboardTs.h"
#include <stm32f429i_discovery_ts.h>
#include <stm32f429i_discovery_lcd.h>
#include "cstdio"

unsigned char ucKbKol = 0;

KeyboardTs::KeyboardTs(unsigned char ucKol) {
	BSP_TS_Init(BSP_LCD_GetXSize(), BSP_LCD_GetYSize());
	ucKbKol = ucKol;
}

KEYBOARD KeyboardTs::eRead() {
	int Start = ucKbKol * 80;
	int End = (ucKbKol + 1) * 80;
	TS_StateTypeDef ts_state;
	BSP_TS_GetState(&ts_state);
	KEYBOARD my_map[] = {
	    {BUTTON_0},
	    {BUTTON_1},
	    {BUTTON_2},
		{BUTTON_3},
	};
	if (ts_state.TouchDetected == 0) {
		return UNPRESSED;
	}
	if (ts_state.X <= Start || ts_state.X >= End) {
		return UNPRESSED;
	}
	int Nr = ts_state.Y / 80;
	return my_map[Nr];
}
