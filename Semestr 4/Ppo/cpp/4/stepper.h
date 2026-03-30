enum Step{LEFT,RIGHT};

void LedStepRight(void);
void LedStepLeft(void);

class Stepper {
	public:
		void StepLeft();
		void StepRight();
	private:
		unsigned char ucLedCtr;
		void Step(enum Step eStep);
};
