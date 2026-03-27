Inf:  nop
      ldi R20, 10
Loop: dec R20
      nop
      nop
      brne Loop
      nop
      nop
      nop
      nop
      rjmp Inf
//Cycles=(R20*5)+5