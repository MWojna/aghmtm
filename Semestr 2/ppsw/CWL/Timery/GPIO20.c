#include <LPC21xx.H>
#include "timer.h"

#define LED0_bm (0x00010000)
#define LED1_bm (0x00020000)
#define LED2_bm (0x00040000)
#define LED3_bm (0x00080000)

#define BUT0_bm (0x00000010)
#define BUT1_bm (0x00000040)
#define BUT2_bm (0x00000020)
#define BUT3_bm (0x00000080)

void Delay(int iMs) {
	int iLoopCounter;
	for(iLoopCounter=0;iLoopCounter<5500000/1000*iMs;iLoopCounter++) {}
}

void LedInit() {
	int before1 = IO1DIR;
	IO1DIR = (before1 | LED0_bm | LED1_bm | LED2_bm | LED3_bm);
	IO1SET = LED0_bm;
}

void KeyboardInit() {
	int before0 = IO0DIR;
	IO0DIR = (before0 | 0xF0) & ~0xF0;
}

void LedOn(unsigned char ucLedIndeks) {
	IO1CLR = LED0_bm | LED1_bm | LED2_bm | LED3_bm;
	switch (ucLedIndeks) {
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
	}
}

enum KeyboardState {RELEASED, BUTTON_0, BUTTON_1, BUTTON_2, BUTTON_3};
enum KeyboardState eKeyboardRead() {
	if ((BUT0_bm & IO0PIN) == 0) {
		return BUTTON_0;
	}
	else if ((BUT1_bm & IO0PIN) == 0) {
		return BUTTON_1;
	}
	else if ((BUT2_bm & IO0PIN) == 0) {
		return BUTTON_2;
	}
	else if ((BUT3_bm & IO0PIN) == 0) {
		return BUTTON_3;
	}
	else {
		return RELEASED;
	}
}

void StepLeft() {
	unsigned char ucLedIndeks = (ucLedIndeks + 1)%4;
	LedOn(ucLedIndeks);
}

int main() {
	IO1DIR = 0x2B000000;
	LedInit();
	InitTimer0Match0(250000);
	while(1) {
		WaitOnTimer0Match0();
		LedOn(4);
		StepLeft();
	}
}
