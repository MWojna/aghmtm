.MACRO LOAD_CONST  
 ldi @0, low(@2)
 ldi @1, high(@2)
.ENDMACRO 

Main: LOAD_CONST XL, XH, 1000
      LOAD_CONST YL, YH, 400
      rcall Divide
      rjmp Main





Divide:push R24 ;save internal variables on stack
        push R25

        Loop:
           cp XL, YL
           cpc XH, YH
           brne L1
           sub XL, YL
           sbc XH, YH
           adiw QCtrL, 1
           brsh Loop
    L1:    mov QH, QCtrH
           mov QL, QCtrL
           mov RL, XL
           mov RH, XH

        pop R25 ; pop internal variables from stack
        pop R24

        ret

.def XL=R16 ; divident
.def XH=R17

.def YL=R18 ; divider
.def YH=R19

; outputs

.def RL=R16 ; reminder
.def RH=R17

.def QL=R18 ; quotient
.def QH=R19

; internal
.def QCtrL=R24
.def QCtrH=R25