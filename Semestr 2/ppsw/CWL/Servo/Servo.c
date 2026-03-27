#include <LPC21xx.H>
#include "led.h"
#include "timer_interrupts.h"
#include "keyboard.h"

#define mDETECTOR (1<<10)
#define NULL 0

//______________________________________________________________

void DetectorInit() {
	IO0DIR &= ~mDETECTOR;
}

enum DetectorState {ACTIVE, INACTIVE};
enum DetectorState eReadDetector() {
	if ((mDETECTOR & IO0PIN) == 0) {
		return ACTIVE;
	}
	else {
		return INACTIVE;
	}
}

enum ServoState {CALLIB, IDLE, IN_PROGRESS};
struct Servo {
	enum ServoState eState; 
	unsigned int uiCurrentPosition; 
	unsigned int uiDesiredPosition;
}; 
struct Servo sServo;

void ServoGoTo(unsigned int uiPosition) {
	sServo.uiDesiredPosition = uiPosition;
}

enum ServoState eServoState;

void ServoCallib() {
	eServoState = CALLIB;
}

//______________________________________________________________

void Automat() {
switch(eServoState) {
	case CALLIB:
		if (eReadDetector() == ACTIVE) {
			sServo.uiCurrentPosition = 0;
			sServo.uiDesiredPosition = 0;
			eServoState = IDLE;
		}
		else {
			LedStepLeft();
		}
		break; 
	case IDLE:
		if (eKeyboardRead() == BUTTON_0) {
			ServoCallib();
		}
		else if (eKeyboardRead() == BUTTON_1) {
			ServoGoTo(12);
		}
		else if (eKeyboardRead() == BUTTON_2) {
			ServoGoTo(24);
		}
		else if (eKeyboardRead() == BUTTON_3) {
			ServoGoTo(36);
		}
		else if (sServo.uiCurrentPosition != sServo.uiDesiredPosition) {
			eServoState = IN_PROGRESS;
		}
		break;
	case IN_PROGRESS:
		if (sServo.uiCurrentPosition == sServo.uiDesiredPosition) {
			eServoState = IDLE;
		}
		else if (sServo.uiDesiredPosition > sServo.uiCurrentPosition) {
			LedStepRight();
			sServo.uiCurrentPosition++;
		}
		else if (sServo.uiDesiredPosition < sServo.uiCurrentPosition) {
			LedStepLeft();
			sServo.uiCurrentPosition--;
		}
		break;
}
}

//______________________________________________________________

void ServoInit(unsigned int uiServoFrequency) {
	eServoState = CALLIB;
	LedInit();
	Timer0Interrupts_Init(1000000/uiServoFrequency, &Automat);
}
