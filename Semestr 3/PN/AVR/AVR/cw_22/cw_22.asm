              ldi R22, 1
              ldi R23, 1
              ldi R24, 0
MainLoop:     rcall DelayNCycles
              rjmp MainLoop
DelayNCycles: nop
              nop
              rcall DelayInMs
              nop
              ret
DelayInMs:    nop
oloop:        ldi R21, 10
              ldi R20, 96
iloop:        sub R20, R23
              brcc iloop
              sbc R21, R24
              brcc iloop
              dec R22
              brne oloop
              ret