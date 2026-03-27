#include <LPC21xx.H>
#include "led.h"

#define LED0_bm (1<<16)
#define LED1_bm (1<<17)
#define LED2_bm (1<<18)
#define LED3_bm (1<<19)

unsigned char ucLedCtrStep=0;

void LedOn(unsigned char ucLedCtr)
{
	IO1CLR = (LED0_bm | LED1_bm | LED2_bm | LED3_bm);
	
	switch(ucLedCtr){
		case 0:
			IO1SET = LED0_bm;
		break;
		case 1:
			IO1SET = LED1_bm; 
		break;
		case 2:
			IO1SET = LED2_bm; 
		break;
		case 3:
			IO1SET = LED3_bm; 
		break;
		default:
		break;
	}
}	

//_______________________________________________________

void Led::Init() {
	IO1DIR = IO1DIR | LED0_bm | LED1_bm | LED2_bm | LED3_bm;
	IO1SET = LED0_bm;
}

void Led::Step(enum Step eStep){
	if(eStep == LEFT){
		ucLedCtrStep--;
		ucLedCtrStep = ucLedCtrStep % 4;
		LedOn(ucLedCtrStep);
	}
	else if(eStep == RIGHT){
		ucLedCtrStep++;
		ucLedCtrStep = ucLedCtrStep % 4;
		LedOn(ucLedCtrStep);
	}else{
	}
}

void Led::StepLeft() {
	Led::Step(LEFT);
}

void Led::StepRight(){
	Led::Step(RIGHT);
}
