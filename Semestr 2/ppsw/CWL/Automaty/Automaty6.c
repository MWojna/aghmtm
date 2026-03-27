#include <LPC21xx.H>
#include "led.h"
#include "keyboard.h"

void Delay(int iMs) {
	int iLoopCounter;
	for(iLoopCounter=0;iLoopCounter<(1000+100)*iMs;iLoopCounter++) {}
}

enum LedState eLedState = WAIT;

int main() {
LedInit();
KeyboardInit();

while(1) {
	switch(eLedState){
		case LEFT:
			if (eKeyboardRead() == BUTTON_1) {
				eLedState = WAIT;
			}
			else {
				LedStepLeft();
			}
			break;
		case WAIT:
			if (eKeyboardRead() == BUTTON_2) {
				eLedState = RIGHT;
			}
			else if (eKeyboardRead() == BUTTON_0) {
				eLedState = LEFT;
			}
			break;
		case RIGHT:
			if (eKeyboardRead() == BUTTON_1) {
				eLedState = WAIT;
			}
			else {
				LedStepRight();
			}
			break;
	}
	Delay(100);
}
}
