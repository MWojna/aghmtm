#include <LPC21xx.H>
#include "led.h"
#include "keyboard.h"

void Delay(int iMs) {
	int iLoopCounter;
	for(iLoopCounter=0;iLoopCounter<(1000+100)*iMs;iLoopCounter++) {}
}

enum LedState eLedState = RIGHT;

int main() {
LedInit();
KeyboardInit();

while(1) {
	switch(eLedState){
		case WAIT:
			if (eKeyboardRead() == BUTTON_1) {
				eLedState = RIGHT;
			}
			break;
		case RIGHT:
			if (eKeyboardRead() == BUTTON_0) {
				eLedState = WAIT;
			}
			else {
				LedStepRight();
			}
			break;
	}
	Delay(1000);
}
}
