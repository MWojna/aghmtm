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
	IO1DIR = IO1DIR | LED0_bm | LED1_bm | LED2_bm | LED3_bm;
	IO1SET = LED0_bm;
}

void KeyboardInit() {
	IO0DIR = IO0DIR & ~(BUT0_bm | BUT1_bm | BUT2_bm | BUT3_bm);
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
	else if ((BUT1_bm & IO0PIN) == 0) { // 0x0 0x1
		return BUTTON_1;
	}
	else if ((BUT2_bm & IO0PIN) == 0) { // 0x0 0x2
		return BUTTON_2;
	}
	else if ((BUT3_bm & IO0PIN) == 0) {
		return BUTTON_3;
	}
	else {
		return RELEASED;
	}
}

enum StepDir {L, R};
void LedStep(enum StepDir LedStep) {
	static unsigned char ucLedCounter;
	switch (LedStep) {
		case L:
			ucLedCounter = ucLedCounter + 1;
			break;
		case R:
			ucLedCounter = ucLedCounter - 1;
			break;
	}
	LedOn(ucLedCounter%4);
}

void LedStepLeft() {
	LedStep(L);
}

void LedStepRight() {
	LedStep(R);
}

int main() {
LedInit();
KeyboardInit();

while(1) {
	switch (eKeyboardRead()) {
		case BUTTON_2:
			LedStepLeft();
			break;
		case BUTTON_1:
			LedStepRight();
			break;
		default:
			break;
	}
	Delay(250);
}
}
