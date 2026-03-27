oloop:  ldi R20, 166
iloop: dec R20
      brne iloop
      nop
      brne oloop
//Cycles=(R20*5)+1