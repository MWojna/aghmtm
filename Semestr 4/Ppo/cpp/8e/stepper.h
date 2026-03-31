#ifndef STEPPER_H
#define STEPPER_H
#include <LPC21xx.H>
#include "ledinv.h"

class Stepper {
	public:
		void StepLeft();
		void StepRight();
		void Setled(Led *pledwrite);
	private:
		unsigned char ucLedCtr;
		Led *pled;
		void Step(enum Step eStep);
};

#endif
