#ifndef LED_H
#define LED_H

enum LedState {STEP_LEFT, STEP_RIGHT, LED_STOP};

class Led {
	public:
		Led();
	protected:
		void On(unsigned char ucLedCtr);
};

#endif
