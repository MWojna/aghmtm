       ldi R22, 1
       ldi R23, 1
       ldi R24, 0
oloop: ldi R21, $F5
       ldi R20, 159
iloop: add R20, R23
       brcc iloop
       adc R21, R24
       brcc iloop
       dec R22
       brne oloop
       nop