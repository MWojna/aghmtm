#include <stm32f4xx_hal.h>
#include "KeyboardTs.h"
#include "LedLcd.h"
#include "KeyboardTsLcd.h"

int main() {
	KeyboardTsLcd Keyboard(0);
	while(1) {
		Keyboard.eRead();
		HAL_Delay(100);
	}
}
