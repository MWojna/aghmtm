#include <LPC21xx.H>
#include "led.h"

#define mLED0 (1 << 16)
#define mLED1 (1 << 17)
#define mLED2 (1 << 18)
#define mLED3 (1 << 19)

void Led_Init(void) {
   IO1DIR = IO1DIR | (mLED0 | mLED1 | mLED2 | mLED3);
   IO1CLR = mLED0 | mLED1 | mLED2 | mLED3;
   IO1SET = mLED0;
}

//-----------------------------------------------
void Led_On(unsigned char ucNumerDiody) {
   IO1CLR = mLED0 | mLED1 | mLED2 | mLED3;

   switch (ucNumerDiody) {
      case 0:
         IO1SET = mLED0;
         break;
      case 1:
         IO1SET = mLED1;
         break;
      case 2:
         IO1SET = mLED2;
         break;
      case 3:
         IO1SET = mLED3;
         break;
      default:
         break;
      }
}
//-------------------------------------------------
void Led_Step(enum Direction eDirection) {
   static unsigned int uiStepCtr;
   
   switch (eDirection) {
      case LEFT:
         uiStepCtr = uiStepCtr - 1;
         break;
      case RIGHT:
         uiStepCtr = uiStepCtr + 1;
         break;
      default: 
         break;
   }
   Led_On(uiStepCtr % 4);
}
