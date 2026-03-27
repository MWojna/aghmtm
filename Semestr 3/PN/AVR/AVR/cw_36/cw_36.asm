Main: ldi R16, 8
      rcall DigitTo7segCode
      rjmp Main

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