#ifndef STEPPER_H
#define STEPPER_H
#include <LPC21xx.H>
#include "ledinv.h"

class Stepper {
	public:
		void StepLeft();
		void StepRight();
		void Setmode(unsigned char ucMode);
	private:
		unsigned char ucLedCtr;
		unsigned char ucInversion;
		Led myled;
		Ledinv myinv;
		void Step(enum Step eStep);
};

#endif
