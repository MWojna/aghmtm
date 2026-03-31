#ifndef STEPPER_H
#define STEPPER_H

class Led;

class Stepper {
	public:
		void StepLeft();
		void StepRight();
		void Setled(Led *pledwrite);
	private:
		unsigned char ucLedCtr;
		void Step(enum Step eStep);
		Led *pled;
		unsigned char ucInversion;
};

#endif
