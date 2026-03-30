#include "stepper.h"

void Stepper::Step(enum Step eStep){
	if(eStep == LEFT){
		ucLedCtr--;
		ucLedCtr = ucLedCtr % 4;
		On(ucLedCtr);
	}
	else if(eStep == RIGHT){
		ucLedCtr++;
		ucLedCtr = ucLedCtr % 4;
		On(ucLedCtr);
	}else{
	}
}

void Stepper::StepLeft() {
	Stepper::Step(LEFT);
}

void Stepper::StepRight(){
	Stepper::Step(RIGHT);
}

Stepper::Stepper(unsigned char ucstartpos) {
	ucLedCtr = ucstartpos;
}
