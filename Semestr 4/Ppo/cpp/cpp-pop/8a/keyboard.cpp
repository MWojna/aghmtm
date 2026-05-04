#include <LPC21xx.H>
#include "Keyboard.h"

#define BUTTON1_bm (1<<4)
#define BUTTON2_bm (1<<5)
#define BUTTON3_bm (1<<6)
#define BUTTON4_bm (1<<7)

Keyboard::Keyboard(void){
	IO0DIR = IO0DIR & BUTTON1_bm & BUTTON2_bm & BUTTON3_bm & BUTTON4_bm;
}

enum KeyboardState Keyboard::eRead(void){
	if(!(IO0PIN & BUTTON1_bm)){
		return BUTTON_1;
	}
	else if(!(IO0PIN & BUTTON2_bm)){
		return BUTTON_2;
	}
	else if(!(IO0PIN & BUTTON3_bm)){
		return BUTTON_3;
	}
	else if(!(IO0PIN & BUTTON4_bm)){
		return BUTTON_4;
	}
	else{
		return RELASED;
	}
}
