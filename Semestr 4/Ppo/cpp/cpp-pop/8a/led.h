#ifndef LED_H
#define LED_H

class Led {
public:
	Led();
	virtual void On(unsigned char ucLedIndex = 0);
};

#endif
