#include <stm32f4xx_hal.h>
#include "stm32f429i_discovery_lcd.h"
#include <stm32f429i_discovery.h>
#include "cstdio"

int main() {
BSP_LCD_SetFont(&Font20);
BSP_LCD_SetBackColor(LCD_COLOR_BLUE);
BSP_LCD_SetTextColor(LCD_COLOR_WHITE);
uint8_t tDispStr[11];
int iX = BSP_LCD_GetXSize();
int iY = BSP_LCD_GetYSize();
sprintf((char *)tDispStr, "X=%d; Y=%d", iX, iY);
BSP_LCD_DisplayStringAt(10, 20, tDispStr, LEFT_MODE);
	while (true) {

	}
}
