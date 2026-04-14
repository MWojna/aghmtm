#include <stm32f4xx_hal.h>
#include "stm32f429i_discovery_lcd.h"
#include <stm32f429i_discovery.h>

int main() {
BSP_LCD_SetBackColor(LCD_COLOR_BLUE);
uint8_t Alpha[] = "Alpha";
uint8_t Centauri[] = "Centauri";
	while (true) {
		BSP_LCD_Clear(LCD_COLOR_BLACK);
		BSP_LCD_DisplayStringAt(10, 20, Alpha, LEFT_MODE);
		HAL_Delay(1000);
		BSP_LCD_Clear(LCD_COLOR_BLACK);
		BSP_LCD_DisplayStringAt(10, 20, Centauri, LEFT_MODE);
		HAL_Delay(1000);
	}
}
