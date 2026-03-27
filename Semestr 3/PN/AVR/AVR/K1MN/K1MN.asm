;### MACROS & defs (.equ)###
; Macro LOAD_CONST loads given registers with immediate value
.MACRO LOAD_CONST
ldi @0, low(@2)
ldi @1, high(@2)
.ENDMACRO
/*** Display ***/
.equ DigitsPort = PORTB
.equ SegmentsPort = PORTD
.equ DisplayRefreshPeriod = 5
; SET_DIGIT diplay digit of a number given in macro argument
.MACRO SET_DIGIT
push R16
ldi R16, (1<<(@0+1))
OUT DigitsPort, R16
mov R16, Dig_@0
rcall DigitTo7segCode
OUT SegmentsPort, R16
rcall DealyInMs
pop R16
.ENDMACRO
; ### GLOBAL VARIABLES ###
.def PulseEdgeCtrL=R0
.def PulseEdgeCtrH=R1
.def Dig_0=R2
.def Dig_1=R3
.def Dig_2=R4
.def Dig_3=R5
; ### INTERRUPT VECTORS ###
.cseg
.org    0      rjmp  _main
.org OC1Aaddr  rjmp  _Timer_ISR
.org PCIBaddr  rjmp  _ExtInt_ISR
; ### INTERRUPT SEERVICE ROUTINES ###
_ExtInt_ISR:
push R24
IN R24, SREG
inc PulseEdgeCtrL
brne NoOverflow
inc PulseEdgeCtrH
NoOverflow:
OUT SREG, R24
pop R24
reti
_Timer_ISR:
push R16
push R17
push R18
push R19
push R20
IN R20, SREG
movw R16:R17, PulseEdgeCtrL:PulseEdgeCtrH
clr PulseEdgeCtrL
clr PulseEdgeCtrH
lsr R17
ror R16
rcall _NumberToDigits
movw Dig_0:Dig_1, R16:R17
movw Dig_2:Dig_3, R18:R19
OUT SREG, R20
pop R20
pop R19
pop R18
pop R17
pop R16
reti
; ### MAIN PROGAM ###
_main:
;--- Ext. ints --- PB0
cli
ldi R16, (1<<PCIE0)
OUT GIMSK, R16
ldi R16, (1<<PCINT0)
OUT PCMSK0, R16
sei
;--- Timer1 --- CTC with 256 prescaller
ldi R16, (1<<WGM12) | (1<<CS12)
OUT TCCR1B, R16
LOAD_CONST R16, R17, 31250
OUT OCR1AH, R17
OUT OCR1AL, R16
ldi R16, (1<<OCIE1A)
OUT TIMSK, R16
;---  Display  ---
clr Dig_0
clr Dig_1
clr Dig_2
clr Dig_3
ldi R18, 0b1111111
OUT DDRD, R18
ldi R18, 0b0011110
OUT DDRB, R18
; --- enable gloabl interrupts
sei
MainLoop: ; presents Digit0-3 variables on a Display
          SET_DIGIT 0
          SET_DIGIT 1
          SET_DIGIT 2
          SET_DIGIT 3
RJMP MainLoop
;*** NumberToDigits ***
.def Dig0=R22 ; Digits temps
.def Dig1=R23 ;
.def Dig2=R24 ;
.def Dig3=R25 ;
_NumberToDigits:
push Dig0
push Dig1
push Dig2
push Dig3
; thousands
LOAD_CONST YYL, YYH, 1000
rcall _Divide
mov Dig0, QL
; hundreads
LOAD_CONST YYL, YYH, 100
rcall _Divide
mov Dig1, QL
; tens
LOAD_CONST YYL, YYH, 10
rcall _Divide
mov Dig2, QL
; ones
mov Dig3, RL
; otput result
mov R16, Dig0
mov R17, Dig1
mov R18, Dig2
mov R19, Dig3
pop Dig3
pop Dig2
pop Dig1
pop Dig0
ret
;*** Divide ***
; inputs
.def XXL=R16 ; divident
.def XXH=R17
.def YYL=R18 ; divider
.def YYH=R19
; outputs
.def RL=R16 ; reminder
.def RH=R17
.def QL=R18 ; quotient
.def QH=R19
; internal
.def QCtrL=R24
.def QCtrH=R25
_Divide:
push R24 ;save internal variables on stack
push R25
LOAD_CONST QCtrL, QCtrH, 0
Div: cp XXL, YYL
cpc XXH, YYH
brcs skip_div
sub XXL, YYL
sbc XXH, YYH
adiw QCtrL, 1
rjmp Div
skip_div: movw RL:RH, XXL:XXH
movw QL:QH, QCtrL:QCtrH
pop R25 ; pop internal variables from stack
pop R24
ret
; *** DigitTo7segCode ***
; In/Out - R16
Table: .db 0x3f,0x06,0x5B,0x4F,0x66,0x6d,0x7D,0x07,0xff,0x6f
DigitTo7segCode:
push R30
push R31
ldi R30, low(Table<<1)
ldi R31, high(Table<<1)
add R30, R16
lpm R16, Z
pop R31
pop R30
ret
; *** DelayInMs ***
; In: R16,R17
DealyInMs:
push R24
push R25
LOAD_CONST R24, R25, DisplayRefreshPeriod
DealyLoop: rcall OneMsLoop
subi R24, 1
brne DealyLoop
pop R25
pop R24
ret
; *** OneMsLoop ***
OneMsLoop:
push R24
push R25
LOAD_CONST R24, R25, 2000
L: SBIW R24, 1
BRNE L
pop R25
pop R24
ret