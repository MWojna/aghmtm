#include <LPC21xx.H>

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
	int before = 1-IO1PIN;
	IO1DIR = (before | LED0_bm | LED1_bm | LED2_bm | LED3_bm);
	IO1SET = LED0_bm;
}

void KeyboardInit() {
	int before0 = IO0DIR;
	IO0DIR = (before0 | 0xF0) & ~0xF0;
}

void LedOn(unsigned char ucLedIndeks) {
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

void StepRight() {
	unsigned char ucLedIndeks = (ucLedIndeks + 3)%4;
	LedOn(ucLedIndeks);
}

int main() {
IO1DIR = 0x2B000000;
LedInit();
while(1) {
	IO1CLR = 0xF0000;
	StepRight();
	Delay(250);
}
/*while(1){
	LedOn(0);
	Delay(250);
	IO1CLR = LED0_bm;
	LedOn(1);
	Delay(250);
	IO1CLR = LED1_bm;
	LedOn(2);
	Delay(250);
	IO1CLR = LED2_bm;
	LedOn(3);
	Delay(250);
	IO1CLR = LED3_bm;
	}*/
}
