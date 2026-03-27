#include <LPC21xx.H>
#include "led.h"
#include "keyboard.h"

void Delay(int iMs) {
	int iLoopCounter;
	for(iLoopCounter=0;iLoopCounter<5500000/5000*iMs;iLoopCounter++) {}
}

enum LedState eLedState = LED_LEFT;

int main() {
LedInit();
KeyboardInit();

while(1) {
	switch(eLedState){
		case LED_LEFT:
			LedStepLeft();
			eLedState = LED_RIGHT;
			break;
		case LED_RIGHT:
			LedStepRight();
			eLedState = LED_LEFT;
			break;
	}
	Delay(250);
}
}
