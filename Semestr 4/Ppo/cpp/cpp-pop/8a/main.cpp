#include "stepper.h"
#include "keyboard.h"
#include "led.h"
#include "ledinv.h"
#include "ledpos.h"

void Delay(int iTimeInMs){
	int iCycle;
	int iNumberOfCycles = 10000 * iTimeInMs;
	
	for (iCycle = 0; iCycle < iNumberOfCycles; iCycle++) {}
}

Stepper MyStep;


int main(void) {
	Keyboard MyKey;
	Led *pLed;

	if(MyKey.eRead() == BUTTON_4) {
		pLed = new Ledinv;
	} else {
		pLed = new Ledpos;
	}
	MyStep.SetLed(pLed);

	while(1){
		Delay(500);
		switch(MyKey.eRead()) {
			case BUTTON_1:
				MyStep.StepRight();
			break;
			case BUTTON_2:
				MyStep.StepLeft();
			break;
			default:
				break;
		}
	}
}
