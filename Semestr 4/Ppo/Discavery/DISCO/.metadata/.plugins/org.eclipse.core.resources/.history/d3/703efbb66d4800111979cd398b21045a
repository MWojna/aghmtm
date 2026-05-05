#include <stm32f4xx_hal.h>
#include "stm32f429i_discovery_lcd.h"
#include "stm32f429i_discovery_ts.h"
#include <stm32f429i_discovery.h>
#include "cstdio"

int main() {
BSP_TS_Init(240, 320);
BSP_LCD_SetFont(&Font16);
BSP_LCD_SetBackColor(LCD_COLOR_BLUE);
BSP_LCD_SetTextColor(LCD_COLOR_WHITE);
TS_StateTypeDef ts_state;
uint8_t tDispStr[40];
const char *pPrintState;
while (true) {
        BSP_TS_GetState(&ts_state);
        float fX = ts_state.X / 2.4;
        float fY = ts_state.Y / 3.2;
        if(ts_state.TouchDetected > 0) {
            pPrintState = "X=%5.2f Y=%5.2f";
        } else {
            pPrintState = "***************";
        }
        sprintf((char *)tDispStr, pPrintState, fX, fY);
        BSP_LCD_DisplayStringAt(10, 20, tDispStr, LEFT_MODE);
        HAL_Delay(100);
    }
}
