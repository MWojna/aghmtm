#include <LPC21xx.H>
#include "ledinv.h"

#define LED0_bm (1<<16)
#define LED1_bm (1<<17)
#define LED2_bm (1<<18)
#define LED3_bm (1<<19)

void Ledinv::On(unsigned char ucLedIndex) {
	IO1SET = (LED0_bm | LED1_bm | LED2_bm | LED3_bm);
	
	switch(ucLedIndex){
		case 0:
			IO1CLR = LED0_bm;
		break;
		case 1:
			IO1CLR = LED1_bm; 
		break;
		case 2:
			IO1CLR = LED2_bm; 
		break;
		case 3:
			IO1CLR = LED3_bm; 
		break;
		default:
		break;		
	}
}
