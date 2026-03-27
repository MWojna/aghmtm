#include <LPC21xx.H>
#include "timer.h"

#define TIMERon_bm (1<<0)
#define TIMERreset_bm (1<<1)
#define MR0interrupt_bm (1<<0)
#define MR0reset_bm (1<<1)

void InitTimer0(void) {
	T0TCR = TIMERon_bm;
}

void WaitOnTimer0(unsigned int uiTime) {
	T0TCR |= TIMERreset_bm;
	T0TCR &= ~TIMERreset_bm;
	while(T0TC<(uiTime*15)) {}
}

void InitTimer0Match0(unsigned int uiDelayTime) {
	T0MR0 = uiDelayTime*15;
	T0MCR |= MR0interrupt_bm | MR0reset_bm;
	T0TCR |= TIMERreset_bm;
	T0TCR &= ~TIMERreset_bm;
	T0TCR = TIMERon_bm;
}

void WaitOnTimer0Match0() {
	while((T0IR & MR0interrupt_bm)==0) {}
	T0IR = MR0interrupt_bm;
}
