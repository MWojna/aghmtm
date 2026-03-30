#ifndef STEPPER_H
#define STEPPER_H
#include <LPC21xx.H>
#include "led.h"

enum Step{LEFT,RIGHT};

class Stepper : protected Led {
	public:
		void StepLeft();
		void StepRight();
		Stepper(unsigned char ucstartpos = 0);
	private:
		unsigned char ucLedCtr;
		void Step(enum Step eStep);
};

#endif
