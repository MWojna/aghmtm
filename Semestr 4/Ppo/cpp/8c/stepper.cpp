#include "stepper.h"

enum Step{LEFT,RIGHT};

extern unsigned char ucInversion;

void Stepper::Step(enum Step eStep) {
	if(eStep == LEFT){
		ucLedCtr--;
	}
	else if(eStep == RIGHT) {
		ucLedCtr++;
	} else {
	}
	ucLedCtr = ucLedCtr % 4;
	if(ucInversion == 1) {
		myinv.On(ucLedCtr);
	} else {
		myled.On(ucLedCtr);
	}
}

void Stepper::StepLeft() {
	Stepper::Step(LEFT);
}

void Stepper::StepRight(){
	Stepper::Step(RIGHT);
}
