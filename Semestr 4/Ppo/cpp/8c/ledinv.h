#ifndef LEDINV_H
#define LEDINV_H

#include "led.h"


class Ledinv : public Led {
	public:
		void On(unsigned char ucLedCtr);
};

#endif
