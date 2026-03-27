#include <LPC21xx.H>
#include "keyboard.h"

#define mBUTTON1    (1 << 4)
#define mBUTTON2    (1 << 6)
#define mBUTTON3    (1 << 5)
#define mBUTTON4    (1 << 7)

//------------------------------------------------
void Keyboard_Init(void)
{
 	IO0DIR = IO0DIR & (~(mBUTTON1| mBUTTON2 |mBUTTON3 |mBUTTON4));
}
//------------------------------------------------
enum KeyboardState eKeyboard_Read(void)
{

	if(0 == (IO0PIN & mBUTTON1))
		{
			return BUTTON_1;
		}
	if(0 == (IO0PIN & mBUTTON2))
		{
			return BUTTON_2;
		}
	if(0 == (IO0PIN & mBUTTON3))
		{
			return BUTTON_3;
		}
	if(0 == (IO0PIN & mBUTTON4))
		{
			return BUTTON_4;
		}
	return RELASED;	        
}


