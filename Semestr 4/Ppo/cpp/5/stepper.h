#ifndef STEPPER_H
#define STEPPER_H
#include <LPC21xx.H>
#include "led.h"

enum Step{LEFT,RIGHT};

void LedStepRight(void);
void LedStepLeft(void);

class Stepper : protected Led {
	public:
		void StepLeft();
		void StepRight();
	private:
		unsigned char ucLedCtr;
		void Step(enum Step eStep);
};

#endif
