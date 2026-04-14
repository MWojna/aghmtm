#include <stm32f4xx_hal.h>
#include "stm32f429i_discovery_lcd.h"
#include <stm32f429i_discovery.h>

int main() {
	while (true) {
		BSP_LCD_SetTextColor(LCD_COLOR_GREEN);
		BSP_LCD_DrawRect(10, 20, 40, 30);
		HAL_Delay(100);
		BSP_LCD_SetTextColor(LCD_COLOR_BLACK);
		BSP_LCD_DrawRect(10, 20, 40, 30);
		HAL_Delay(100);
	}
}
