MainLoop:     rcall DelayNCycles
              rjmp MainLoop
DelayNCycles: nop
              nop
              rcall idk
              nop
              ret
idk:          nop
              nop
              nop
              ret