	AREA	MAIN_CODE, CODE, READONLY
	GET		LPC213x.s
	ENTRY
__main
__use_two_region_memory
	EXPORT	__main
	EXPORT	__use_two_region_memory
CURRENT_DIGIT RN R12
DIGIT_0 RN R8
DIGIT_1 RN R9
DIGIT_2 RN R10
DIGIT_3 RN R11
	mov CURRENT_DIGIT, #0
;dig reset
	mov DIGIT_0, #0
	mov DIGIT_1, #0
	mov DIGIT_2, #0
	mov DIGIT_3, #0
;ustawienie tranzystorow IO0 i segmentow IO1 na wyjsciowe
	ldr R4, =IO0DIR
	ldr R5, =0xF0000
	str R5, [R4]
	ldr R4, =IO1DIR
	ldr R5, =0xFF0000
	str R5, [R4]
main_loop	;disp clr
	ldr R4, =IO0CLR
	ldr R5, =0xF0000
	str R5, [R4]
	ldr R4, =IO1CLR
	ldr R5, =0xFF0000
	str R5, [R4]
	;number inc
	cmp CURRENT_DIGIT, #1
	bne skip
	add DIGIT_0, #1
	cmp DIGIT_0, #10
	eoreq DIGIT_0, DIGIT_0, DIGIT_0
	addeq DIGIT_1, #1
	cmp DIGIT_1, #10
	eoreq DIGIT_1, DIGIT_1, DIGIT_1
	addeq DIGIT_2, #1
	cmp DIGIT_2, #10
	eoreq DIGIT_2, DIGIT_2, DIGIT_2
	addeq DIGIT_3, #1
	cmp DIGIT_3, #10
	eoreq DIGIT_3, DIGIT_3, DIGIT_3
skip
	;dig to r6
	cmp CURRENT_DIGIT, #0
	moveq R6, DIGIT_0
	cmp CURRENT_DIGIT, #1
	moveq R6, DIGIT_1
	cmp CURRENT_DIGIT, #2
	moveq R6, DIGIT_2
	cmp CURRENT_DIGIT, #3
	moveq R6, DIGIT_3
	;dec to 7seg
	adr R4, Table
	add R4, R6
	ldrb R5, [R4]
	mov R6, R5, LSL #16
	ldr R4, =IO1SET
	str R6, [R4]
	;shift disp pos
	mov R5, #0x80000
	mov R5, R5, LSR CURRENT_DIGIT
	add CURRENT_DIGIT, CURRENT_DIGIT, #1
	cmp CURRENT_DIGIT, #4
	eoreq CURRENT_DIGIT, CURRENT_DIGIT, CURRENT_DIGIT
	ldr R4, =IO0SET
	str R5, [R4]
	bl Delay_In_Ms
	b main_loop
Delay_In_Ms
	ldr R0, =10
	ldr R1, =15000
	mul R0, R1, R0
LD
	subs R0, R0, #1
	bne	LD
	bx lr
Table 
	DCB 0x3f,0x06,0x5B,0x4F,0x66,0x6d,0x7D,0x07,0x7f,0x6f
	align
	END