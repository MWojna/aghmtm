#ifndef STEPPER_H
#define STEPPER_H

class Led;

class Stepper {
private:
	unsigned char ucLedCtr;
	void Step(enum Step eStep);
	Led *pLed;
public:
	void StepLeft();
	void StepRight();
	void SetLed(Led *pLedWrite);
};

#endif

