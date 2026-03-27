enum LedState {STEP_LEFT, STEP_RIGHT, LED_STOP};
enum Step{LEFT,RIGHT};

void LedStepRight(void);
void LedStepLeft(void);
void LedInit(void);

class Led {
	public:
		void Init();
		void StepLeft();
		void StepRight();
	private:
		unsigned char ucLedCtr;
		void Step(enum Step eStep);
		void On();
};
