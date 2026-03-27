#include "led.h"
#include "timer_interrupts.h"
#include "keyboard.h"

enum LedState eLedState = WAIT;

void Automat() {
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
}

int main (){
	unsigned int iMainLoopCtr;
	LedInit();
	KeyboardInit();
	Timer0Interrupts_Init(100000, &Automat);

	while(1){
		iMainLoopCtr++;
	}
}
