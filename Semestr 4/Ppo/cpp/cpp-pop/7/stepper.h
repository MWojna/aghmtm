#ifndef STEPPER_H
#define STEPPER_H

#include "led.h"

class Stepper {
private:
	unsigned char ucLedCtr;
	void Step(enum Step eStep);
	Led MyLed;
public:
	void StepLeft();
	void StepRight();
	Stepper(unsigned char ucLedPos = 0);
};

#endif

