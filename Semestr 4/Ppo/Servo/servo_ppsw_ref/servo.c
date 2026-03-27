#include <LPC21xx.H>
#include "led.h"
#include "timer_interrupts.h"
#include "servo.h"

#define mDETEKTOR (1 << 10)

enum ServoState {
   CALLIB,
   IDDLE,
   IN_PROGRESS
};

struct Servo {
   enum ServoState eState;
   unsigned int uiCurrentPosition;
   unsigned int uiDesiredPosition;
}
sServo;

void DetectorInit(void) {
   IO0DIR = IO0DIR & (~mDETEKTOR);
}

enum DetectorState {
   ACTIVE,
   INACTIVE
};
enum DetectorState eReadDetector(void) {
   if (0 == (IO0PIN & mDETEKTOR)) {
      return ACTIVE;
   } else {
      return INACTIVE;
   }
}

void ServoAutomate() {

   switch (sServo.eState) {
   case CALLIB:
      if (eReadDetector() == ACTIVE) {
         sServo.eState = IDDLE;
      } else {
         Led_Step(LEFT);
         sServo.eState = CALLIB;
      }
      break;

   case IDDLE:
      if (sServo.uiCurrentPosition == sServo.uiDesiredPosition) {
         sServo.eState = IDDLE;
      } else {
         sServo.eState = IN_PROGRESS;
      }
      break;

   case IN_PROGRESS:
      if (sServo.uiCurrentPosition < sServo.uiDesiredPosition) {
         Led_Step(RIGHT);
         sServo.eState = IN_PROGRESS;
         sServo.uiCurrentPosition++;
      } else if (sServo.uiCurrentPosition > sServo.uiDesiredPosition) {
         Led_Step(LEFT);
         sServo.eState = IN_PROGRESS;
         sServo.uiCurrentPosition--;
      } else {
         sServo.eState = IDDLE;
      }
      break;
   }
}

void Servo_Callib(void) {
   sServo.uiCurrentPosition = 0;
   sServo.uiDesiredPosition = 0;
   sServo.eState = CALLIB;
};

void Servo_GoTo(unsigned int uiPosition) {
   sServo.uiDesiredPosition = uiPosition;
};

void Servo_Init(unsigned int uiServoFrequency) {
   sServo.eState = CALLIB;
   DetectorInit();
   Led_Init();
   Timer0Interrupts_Init(1000000 / uiServoFrequency, & ServoAutomate);
}
