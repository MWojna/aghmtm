#ifndef LEDINV_H
#define LEDINV_H

#include "led.h"


class Ledinv : public Led {
	public:
		virtual void On(unsigned char ucLedCtr);
};

#endif
