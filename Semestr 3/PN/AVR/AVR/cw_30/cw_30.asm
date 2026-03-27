.macro LOAD_CONST
ldi @0, low(@2)
ldi @1, high(@2)
.endmacro

.equ PORTB_Digits_0 = 0b00000010
.equ PORTB_Digits_1 = 0b00000100
.equ PORTB_Digits_2 = 0b00001000
.equ PORTB_Digits_3 = 0b00010000

.equ PORTD_Segments_A_B_C_D_E_F = 0b0111111
//012345    0
.equ PORTD_Segments_B_C = 0b0000110
//12        1
.equ PORTD_Segments_A_B_D_E_G = 0b1011011
//01346     2
.equ PORTD_Segments_A_B_C_D_G = 0b1001111
//01236     3
.equ PORTD_Segments_B_C_F_G = 0b1100110
//1256      4

ldi R18, 0b1111111
OUT DDRD, R18

ldi R19, 0b0000010
OUT DDRB, R19

Main:       LOAD_CONST R16, R17, 5            
            ldi R19, PORTB_Digits_0
            OUT PORTB, R19
            ldi R18, PORTD_Segments_A_B_C_D_E_F
            OUT PORTD, R18
            rcall DelayInMs

            ldi R19, PORTB_Digits_1
            OUT PORTB, R19
            ldi R18, PORTD_Segments_B_C
            OUT PORTD, R18
            rcall DelayInMs

            ldi R19, PORTB_Digits_2
            OUT PORTB, R19
            ldi R18, PORTD_Segments_A_B_D_E_G
            OUT PORTD, R18
            rcall DelayInMs

            ldi R19, PORTB_Digits_3
            OUT PORTB, R19
            ldi R18, PORTD_Segments_A_B_C_D_G
            OUT PORTD, R18
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
L1:			sbiw R24, 1
			brne L1
			pop R25
			pop R24
			ret
