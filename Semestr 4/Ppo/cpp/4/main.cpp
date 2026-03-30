#include "led.h"
#include "stepper.h"

void Delay(int iTimeInMs){
	int iCycle;
	int iNumberOfCycles = 10000 * iTimeInMs;
	
	for (iCycle = 0; iCycle < iNumberOfCycles; iCycle++) {}
}

Led myled;
Stepper mystep;

int main(void) {
	while(1){
		Delay(100);
		mystep.StepLeft();
	}
}
