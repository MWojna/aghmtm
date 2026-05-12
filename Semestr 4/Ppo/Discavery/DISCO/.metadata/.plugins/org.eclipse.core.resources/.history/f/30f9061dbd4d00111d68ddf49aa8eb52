#include <stm32f4xx_hal.h>
#include "KeyboardTsLcd.h"

int main() {
	KeyboardTsLcd Keyboard(1);
	while(1) {
		Keyboard.eRead();
		HAL_Delay(100);
	}
}
