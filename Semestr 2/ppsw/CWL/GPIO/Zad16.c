#include <LPC21xx.H>

#define LED0_bm (0x00010000)
#define LED1_bm (0x00020000)
#define LED2_bm (0x00040000)
#define LED3_bm (0x00080000)

void Delay(int iMs) {
	int iLoopCounter;
	for(iLoopCounter=0;iLoopCounter<5500000/1000*iMs;iLoopCounter++) {}
}

void LedInit() {
	int before = IO1DIR;
	IO1DIR = (before | LED0_bm | LED1_bm | LED2_bm | LED3_bm);
	IO1SET = LED0_bm;
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

unsigned char ReadButton1() {
	if ((IO0PIN & 0x00000010) == 0) {
		return 1;
	}
	else {
		return 0;
	}
}

int main() {
IO1DIR = 0x02B00000;
LedInit();
while (1) {
	if (ReadButton1()) {
		LedOn(1);
		IO1CLR = LED0_bm;
	}
	else {
		IO1CLR = LED1_bm;
		LedOn(0);
		}
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
