#include "stepper.h"
#include "led.h"

enum Step{LEFT,RIGHT};

extern Led MyLed;

void Stepper::Step(enum Step eStep){
	if(eStep == LEFT){
		ucLedCtr--;
	}
	else if(eStep == RIGHT){
		ucLedCtr++;
	}else{
	}
	ucLedCtr = ucLedCtr % 4;
	MyLed.On(ucLedCtr);
}

void Stepper::StepLeft(void){
	Step(LEFT);
}

void Stepper::StepRight(void){
	Step(RIGHT);
}
