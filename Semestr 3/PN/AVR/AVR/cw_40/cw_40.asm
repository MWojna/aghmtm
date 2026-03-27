//makro do zapisania liczby >255
.macro LOAD_CONST
ldi @0, low(@2)
ldi @1, high(@2)
.endmacro

//makro do skrocenia kodu w main
.macro SET_DIGIT
push R16
ldi R16, (1<<(@0+1))
OUT PORTB, R16
ldi R16, Dig_@0
add R16, Digit_@0
mov R16, Digit_@0
rcall DigitTo7segCode
OUT PORTD, R16
rcall DelayInMs
pop R16
.endmacro

.equ Dig_0 = 7
.equ Dig_1 = 6
.equ Dig_2 = 5
.equ Dig_3 = 4
.def Digit_0 = R2
.def Digit_1 = R3
.def Digit_2 = R4
.def Digit_3 = R5

push R16
ldi R16, Dig_0
mov R2, R16
ldi R16, Dig_1
mov R3, R16
ldi R16, Dig_2
mov R4, R16
ldi R16, Dig_3
mov R5, R16
pop R16

//ustawianie wszystkich bitow wyswietlacza nawyjscie
ldi R18, 0b1111111
OUT DDRD, R18
//wlaczanie tranzystora bipol
ldi R19, 0b0000010
OUT DDRB, R19
//okreslenie ilosci ms delaya
LOAD_CONST R16, R17, 10

Main:       SET_DIGIT 0
            SET_DIGIT 1
            SET_DIGIT 2
            SET_DIGIT 3
            ldi R20, 10
            inc R5
            cp R5, R20
            brne Main
            clr R5
            inc R4
            cp R4, R20
            brne Main
            clr R4
            inc R3
            cp R3, R20
            brne Main
            clr R3
            inc R2
            cp R2, R20
            brne Main
            clr R2
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

; inputs
.def XL=R16 ; divident
.def XH=R17
.def YL=R18 ; divisor
.def YH=R19
; outputs
.def RL=R16 ; remainder
.def RH=R17
.def QL=R18 ; quotient
.def QH=R19
; internal
.def QCtrL=R24
.def QCtrH=R25

Divide: push R24
        push R25
        LOAD_CONST QCtrL, QCtrH, 0
L:      sub XL, YL
        sbc XH, YH
        adiw QCtrL, 1
        cp XL, YL
        cpc XH, YH
        brsh L
        mov RL, XL
        mov RH, XH
        mov QL, QCtrL
        mov QH, QCtrH
        pop R25
        pop R24
        ret

.def Dig0=R22 ; Digits temps
.def Dig1=R23
.def Dig2=R24
.def Dig3=R25

NumberToDigits: push Dig0
                push Dig1
                push Dig2
                push Dig3
                LOAD_CONST YL, YH, 1000
                rcall Divide
                mov Dig0, QL
                mov XL, Rl
                mov XH, RH
                LOAD_CONST YL, YH, 100
                rcall Divide
                mov Dig1, QL
                mov XL, Rl
                LOAD_CONST YL, YH, 10
                rcall Divide
                mov Dig2, QL
                mov Dig3, RL
                pop Dig3
                pop Dig2
                pop Dig1
                pop Dig0
                ret

.def PulseEdgeCtrL=R0
.def PulseEdgeCtrH=R1

NumberToDigitsBin: LOAD_CONST YL, YH, 255
                   rcall Divide
                   mov PulseEdgeCtrH, QL
                   sub RL, QL
                   mov PulseEdgeCtrL, RL
                   ret