#include "timer_interrupts.h"

#include "watch.h"

struct Watch sWatch;

void Update() {
   sWatch.ucSeconds++;
   sWatch.fSecondsChanged = 1;
   if (6 == sWatch.ucSeconds) {
      sWatch.ucSeconds = 0;
      sWatch.ucMinutes++;
      sWatch.fMinutesChanged = 1;
   }
}

void Wath_Init() {
   Timer1Interrupts_Init(1000000, & Update);
};
