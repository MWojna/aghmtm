#include <LPC21xx.H>
#include "ledpos.h"

#define LED0_bm (1<<16)
#define LED1_bm (1<<17)
#define LED2_bm (1<<18)
#define LED3_bm (1<<19)

void Ledpos::On(unsigned char ucLedIndex) {
	IO1CLR = (LED0_bm | LED1_bm | LED2_bm | LED3_bm);
	
	switch(ucLedIndex){
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
