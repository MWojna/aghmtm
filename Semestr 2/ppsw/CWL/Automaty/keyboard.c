#include <LPC21xx.H>
#include "keyboard.h"

#define BUT0_bm (1 << 4)
#define BUT1_bm (1 << 6)
#define BUT2_bm (1 << 5)
#define BUT3_bm (1 << 7)

void KeyboardInit() {
	IO0DIR = IO0DIR & ~(BUT0_bm | BUT1_bm | BUT2_bm | BUT3_bm);
}

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
