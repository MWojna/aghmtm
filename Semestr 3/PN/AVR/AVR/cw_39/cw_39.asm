//makro do zapisania liczby >255
.macro LOAD_CONST
ldi @0, low(@2)
ldi @1, high(@2)
.endmacro

//makro do skrocenia kodu w main
.macro SET_DIGIT
ldi R19, PORTB_Digits_@0
OUT PORTB, R19
OUT PORTD, Digit_@0
rcall DelayInMs
.endmacro

.equ PORTB_Digits_0 = 0b00000010
.equ PORTB_Digits_1 = 0b00000100
.equ PORTB_Digits_2 = 0b00001000
.equ PORTB_Digits_3 = 0b00010000

//zapisanie kodow na liczby w R2-R5
push R16
ldi R16, 7
rcall DigitTo7segCode
mov R2, R16
ldi R16, 6
rcall DigitTo7segCode
mov R3, R16
ldi R16, 5
rcall DigitTo7segCode
mov R4, R16
ldi R16, 4
rcall DigitTo7segCode
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
//okreslenie ilosci ms delaya
LOAD_CONST R16, R17, 5 

Main:       SET_DIGIT 0
            SET_DIGIT 1
            SET_DIGIT 2
            SET_DIGIT 3            
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

DigitTo7segCode: push R30
                 push R31
                 ldi R30, low(Table<<1)
                 ldi R31, high(Table<<1)
                 add R30, R16
                 ldi R16, 0
                 adc R31, R16
                 lpm R16, Z
                 pop R31
                 pop R30
                 ret

Table: .db 0x3f,0x06,0x5B,0x4F,0x66,0x6d,0x7D,0x07,0xff,0x6f