        ldi R22, 1
ooloop: ldi R21, 80
oloop:  ldi R20, 32
iloop:  dec R20
        brne iloop
        dec R21
        mov R20, R20
        brne oloop
        dec R22
        brne ooloop
        nop
//((R20*3+1)+3)*R21