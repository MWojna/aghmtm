.macro LOAD_CONST
ldi @0, low(@2)
ldi @1, high(@2)
.endmacro

.equ PORTB_Digits_0 = 0b00000010
.equ PORTB_Digits_1 = 0b00000100
.equ PORTB_Digits_2 = 0b00001000
.equ PORTB_Digits_3 = 0b00010000

//zapisanie kodow na liczby w R2-R5
push R16
ldi R16, 0b0111111
mov R2, R16
ldi R16, 0b0000110
mov R3, R16
ldi R16, 0b1011011
mov R4, R16
ldi R16, 0b1001111
mov R5, R16
pop R16

.def Digit_0 = R2
.def Digit_1 = R3
.def Digit_2 = R4
.def Digit_3 = R5

//ustawianie wszystkich bitow wyswietlacza nawyjscie
ldi R18, 0b1111111
OUT DDRD, R18
//wlaczanie tranzystora bipol
ldi R19, 0b0000010
OUT DDRB, R19

Main:       LOAD_CONST R16, R17, 5            
            ldi R19, PORTB_Digits_0
            OUT PORTB, R19
            OUT PORTD, Digit_0
            rcall DelayInMs

            ldi R19, PORTB_Digits_1
            OUT PORTB, R19
            OUT PORTD, Digit_1
            rcall DelayInMs

            ldi R19, PORTB_Digits_2
            OUT PORTB, R19
            OUT PORTD, Digit_2
            rcall DelayInMs

            ldi R19, PORTB_Digits_3
            OUT PORTB, R19
            OUT PORTD, Digit_3
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
