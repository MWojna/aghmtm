#include "led.h"

void Delay(int iTimeInMs){
	int iCycle;
	int iNumberOfCycles = 10000 * iTimeInMs;
	
	for (iCycle = 0; iCycle < iNumberOfCycles; iCycle++) {}
}

int main(void)
{
	Led MyLed;
	MyLed.Init();

	while(1){
		Delay(100);
		MyLed.StepLeft();
	}
}
