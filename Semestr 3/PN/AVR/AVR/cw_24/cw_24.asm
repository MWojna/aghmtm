MainLoop:     ldi R22, 1
              sts $60, R22
              rcall DelayInMs
              rjmp MainLoop
DelayInMs:    lds R22, $60
              sts $60, R22
              rcall DelayOneMs
              ret
DelayOneMs:   lds R22, $60
oloop:        ldi R25, 23
              ldi R24, 114
iloop:        subi R24, 1
              brcc iloop
              ldi R24, 114
              subi R25, 1
              brne iloop
              dec R22
              brne oloop
              ret