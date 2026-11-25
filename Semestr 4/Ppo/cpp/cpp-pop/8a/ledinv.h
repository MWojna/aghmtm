#ifndef LEDINV_H
#define LEHINV_H

#include "led.h"

class Ledinv : public Led{
public:
	virtual void On(unsigned char ucLedIndex);
};

#endif
