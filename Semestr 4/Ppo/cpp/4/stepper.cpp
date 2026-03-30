#include "stepper.h"
#include "led.h"

unsigned char ucLedCtrStep=0;

extern Led myled;

void Stepper::Step(enum Step eStep){
	if(eStep == LEFT){
		ucLedCtrStep--;
		ucLedCtrStep = ucLedCtrStep % 4;
		myled.On(ucLedCtrStep);
	}
	else if(eStep == RIGHT){
		ucLedCtrStep++;
		ucLedCtrStep = ucLedCtrStep % 4;
		myled.On(ucLedCtrStep);
	}else{
	}
}

void Stepper::StepLeft() {
	Stepper::Step(LEFT);
}

void Stepper::StepRight(){
	Stepper::Step(RIGHT);
}
