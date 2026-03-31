#include "stepper.h"
#include "led.h"

enum Step{LEFT,RIGHT};

void Stepper::Step(enum Step eStep) {
	if(eStep == LEFT){
		ucLedCtr--;
	}
	else if(eStep == RIGHT) {
		ucLedCtr++;
	} else {
	}
	ucLedCtr = ucLedCtr % 4;
	pled->On(ucLedCtr);
}

void Stepper::StepLeft() {
	Stepper::Step(LEFT);
}

void Stepper::StepRight(){
	Stepper::Step(RIGHT);
}


void Stepper::Setled(Led *pledwrite) {
	pled = pledwrite;
}
