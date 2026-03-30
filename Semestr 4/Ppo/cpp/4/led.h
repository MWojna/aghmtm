enum LedState {STEP_LEFT, STEP_RIGHT, LED_STOP};

void LedInit(void);

class Led {
	public:
		Led();
		void On(unsigned char ucLedCtr);
};
