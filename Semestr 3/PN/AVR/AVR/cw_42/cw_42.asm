.macro LOAD_CONST
ldi @0, low(@2)
ldi @1, high(@2)
.endmacro

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

Main: LOAD_CONST XL, XH, 1000
      LOAD_CONST YL, YH, 400
      rcall Divide
      rjmp Main

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