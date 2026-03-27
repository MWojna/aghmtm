       ldi R22, 2
       ldi R23, 1
       ldi R24, 0
oloop: ldi R21, 10
       ldi R20, 96
iloop: sub R20, R23
       brcc iloop
       sbc R21, R24
       brcc iloop
       dec R22
       brne oloop
       nop