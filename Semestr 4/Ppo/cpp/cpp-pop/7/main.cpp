#include "stepper.h"

void Delay(int iTimeInMs){
	int iCycle;
	int iNumberOfCycles = 10000 * iTimeInMs;
	
	for (iCycle = 0; iCycle < iNumberOfCycles; iCycle++) {}
}

Stepper MyStep(2);

int main(void)
{

	while(1){
		Delay(500);
		MyStep.StepLeft();
	}
}
