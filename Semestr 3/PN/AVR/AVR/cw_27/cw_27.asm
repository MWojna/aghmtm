.macro LOAD_CONST
ldi @0, low(@2)
ldi @1, high(@2)
.endmacro

Main:       LOAD_CONST R16, R17, 2
            rcall DelayInMs
            rjmp Main
DelayInMs:  push R24
			push R25
            mov R24, R16
            mov R25, R17
L2:			rcall DelayOneMs
            sbiw R24,1 
			brne L2
			pop R25
			pop R24
			ret
DelayOneMs:	push R24
			push R25 
			LOAD_CONST R24, R25, 2000                    
L1:			sbiw R24,1 
			brne L1
			pop R25
			pop R24
			ret