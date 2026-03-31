#include "led.h"
#include "stepper.h"
#include "keyboard.h"

void Delay(int iTimeInMs){
	int iCycle;
	int iNumberOfCycles = 10000 * iTimeInMs;
	
	for (iCycle = 0; iCycle < iNumberOfCycles; iCycle++) {}
}

Stepper mystep;

int main(void) {
	Keyboard mykey;
	Led *pled;
	
	if(mykey.eRead() == BUTTON_4) {
		pled = new Ledinv;
	} else {
		pled = new Led;
	}
	
	mystep.Setled(pled);
	
	while(1){
		Delay(500);
		switch(mykey.eRead()) {
		case BUTTON_1:
			mystep.StepRight();
		break;
		case BUTTON_2:
			mystep.StepLeft();
		break;
		default:
			break;
		}
	}
}
