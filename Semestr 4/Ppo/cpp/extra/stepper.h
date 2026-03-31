#ifndef STEPPER_H
#define STEPPER_H

#include "led.h"

class Stepper {
	public:
		void StepLeft();
		void StepRight();
	private:
		unsigned char ucLedCtr;
		void Step(enum Step eStep);
		Led myled;
};

#endif
