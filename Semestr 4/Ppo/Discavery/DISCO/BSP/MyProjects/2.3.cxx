#include <stm32f4xx_hal.h>
#include "stm32f429i_discovery_lcd.h"
#include <stm32f429i_discovery.h>

int main() {
BSP_LCD_SetBackColor(LCD_COLOR_BLUE);
	while (true) {
		BSP_LCD_DisplayChar(10, 20, 65);
		HAL_Delay(1000);
		BSP_LCD_DisplayChar(10, 20, 66);
		HAL_Delay(1000);
	}
}
