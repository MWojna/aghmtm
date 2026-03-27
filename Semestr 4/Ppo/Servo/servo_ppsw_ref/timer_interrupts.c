#include <LPC21xx.H>

#include "timer_interrupts.h"

// TIMER
#define mCOUNTER_ENABLE 0x00000001
#define mCOUNTER_RESET 0x00000002

// CompareMatch
#define mINTERRUPT_ON_MR0 0x00000001
#define mRESET_ON_MR0 0x00000002
#define mMR0_INTERRUPT 0x00000001

// VIC (Vector Interrupt Controller) VICIntEnable
#define VIC_TIMER0_CHANNEL_NR 4
#define VIC_TIMER1_CHANNEL_NR 5

// VICVectCntlx Vector Control Registers
#define mIRQ_SLOT_ENABLE 0x00000020

////////// Timer 0 //////////////

void( * ptrTimer0InterruptFunction)(void);

__irq void Timer0IRQHandler() { //(Interrupt Service Routine) of Timer 0 interrupt

   T0IR = mMR0_INTERRUPT; // skasowanie flagi przerwania z Timera 1
   ptrTimer0InterruptFunction(); // cos do roboty
   VICVectAddr = 0x00; // potwierdzenie wykonania procedury obslugi przerwania
}

void Timer0Interrupts_Init(unsigned int uiPeriod, void( * ptrInterruptFunction)(void)) { // microseconds

   ptrTimer0InterruptFunction = ptrInterruptFunction;

   // interrupts

   VICIntEnable |= (0x1 << VIC_TIMER0_CHANNEL_NR); // Enable Timer X interrupt channel 
   VICVectCntl0 = mIRQ_SLOT_ENABLE | VIC_TIMER0_CHANNEL_NR; // Enable Slot X and assign it to Timer X interrupt channel
   VICVectAddr0 = (unsigned long) Timer0IRQHandler; // Set to Slot X Address of Interrupt Service Routine 

   // match module

   T0MR0 = 15 * uiPeriod; // value 
   T0MCR |= (mINTERRUPT_ON_MR0 | mRESET_ON_MR0); // action 

   // timer

   T0TCR |= mCOUNTER_ENABLE; // start 
}

/////////////// Timer 1 ////////////////////////////
void( * ptrTimer1InterruptFunction)(void);

__irq void Timer1IRQHandler() { //(Interrupt Service Routine) of Timer 0 interrupt

   T1IR = mMR0_INTERRUPT; // skasowanie flagi przerwania z Timera 1
   ptrTimer1InterruptFunction(); // cos do roboty
   VICVectAddr = 0x00; // potwierdzenie wykonania procedury obslugi przerwania
}

void Timer1Interrupts_Init(unsigned int uiPeriod, void( * ptrInterruptFunction)(void)) { // microseconds

   ptrTimer1InterruptFunction = ptrInterruptFunction;

   // interrupts

   VICIntEnable |= (0x1 << VIC_TIMER1_CHANNEL_NR); // Enable Timer X interrupt channel 
   VICVectCntl1 = mIRQ_SLOT_ENABLE | VIC_TIMER1_CHANNEL_NR; // Enable Slot X and assign it to Timer X interrupt channel
   VICVectAddr1 = (unsigned long) Timer1IRQHandler; // Set to Slot X Address of Interrupt Service Routine 

   // match module

   T1MR0 = 15 * uiPeriod; // value 
   T1MCR |= (mINTERRUPT_ON_MR0 | mRESET_ON_MR0); // action 

   // timer

   T1TCR |= mCOUNTER_ENABLE; // start 
}
