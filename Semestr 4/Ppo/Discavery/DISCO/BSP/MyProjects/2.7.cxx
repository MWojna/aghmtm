#include <stm32f4xx_hal.h>
#include "stm32f429i_discovery_lcd.h"
#include "stm32f429i_discovery_ts.h"
#include <stm32f429i_discovery.h>
#include "cstdio"

int main() {
BSP_TS_Init(240, 320);
BSP_LCD_SetFont(&Font20);
BSP_LCD_SetBackColor(LCD_COLOR_BLUE);
BSP_LCD_SetTextColor(LCD_COLOR_WHITE);
TS_StateTypeDef ts_state;
uint8_t Pressed[] = "Pressed";
uint8_t Not[] = "*******";
	while (true) {
		BSP_TS_GetState(&ts_state);
		if(ts_state.TouchDetected > 0) {
			BSP_LCD_DisplayStringAt(10, 20, Pressed, LEFT_MODE);
		} else {
			BSP_LCD_DisplayStringAt(10, 20, Not, LEFT_MODE);
		}
		HAL_Delay(100);
	}
}
