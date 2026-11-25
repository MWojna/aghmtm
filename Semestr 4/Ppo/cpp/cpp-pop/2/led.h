#ifndef LED_H
#define LEH_H

class Led{
private:
	unsigned char ucLedCtr;
	void Step(enum Step eStep);
	void On(unsigned char ucLedIndex);
public:
	void Init();
	void StepLeft();
	void StepRight();
};

#endif
