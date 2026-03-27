#include "keyboard.h"
#include "servo.h"


int main() {
	unsigned int iMainLoopCtr;
	DetectorInit();
	KeyboardInit();
	ServoInit(100);

	while(1) {
		iMainLoopCtr++;
	}
}
