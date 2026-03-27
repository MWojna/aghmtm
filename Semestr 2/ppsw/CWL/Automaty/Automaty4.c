#include <LPC21xx.H>
#include "led.h"
#include "keyboard.h"

void Delay(int iMs) {
	int iLoopCounter;
	for(iLoopCounter=0;iLoopCounter<(1000+100)*iMs;iLoopCounter++) {}
}

enum LedState eLedState = WAIT;
int CaseCounter = 0;

int main() {
LedInit();
KeyboardInit();

while(1) {
	switch(eLedState){
		case WAIT:
			if (eKeyboardRead() == BUTTON_0) {
				eLedState = RIGHT;
			}
			break;
		case RIGHT:
			if (CaseCounter < 3) {
				LedStepRight();
				CaseCounter++;
			}
			else {
				CaseCounter = 0;
				eLedState = WAIT;
			}
			break;
	}
	Delay(1000);
}
}
