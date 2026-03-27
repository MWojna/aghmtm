#include <LPC21xx.H>
#include "led.h"
#include "keyboard.h"

void Delay(int iMs) {
	int iLoopCounter;
	for(iLoopCounter=0;iLoopCounter<5500000/1000*iMs;iLoopCounter++) {}
}

int main() {
LedInit();
KeyboardInit();

while(1) {
	switch (eKeyboardRead()) {
		case BUTTON_2:
			LedStepLeft();
			break;
		case BUTTON_1:
			LedStepRight();
			break;
		default:
			break;
	}
	Delay(250);
}
}
