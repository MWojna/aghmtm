#include "stepper.h"

void Delay(int iTimeInMs){
	int iCycle;
	int iNumberOfCycles = 10000 * iTimeInMs;
	
	for (iCycle = 0; iCycle < iNumberOfCycles; iCycle++) {}
}

Stepper MyStep;

int main(void)
{

	while(1){
		Delay(100);
		MyStep.StepLeft();
	}
}
