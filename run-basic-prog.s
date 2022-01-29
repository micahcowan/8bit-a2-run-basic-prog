.macpack apple2

;#resource "run-basic-prog.cfg"
;#define CFGFILE run-basic-prog.cfg

PrPtr	= $6
COUT	= $FDED
COUT1	= $FDF0
KEYIN	= $FD1B
CSWL	= $36
KSWL	= $38
APPLESOFT = $E000
HOME	= $FC58

	.org $803
	jmp Start

	.res $4000-*
	.org $4000
Start:
	;jsr PrintStuff
        
        ; Set up INPUT and OUTPUT to read in
        ; the BASIC program.
        lda #<InputASoftProg
        sta KSWL
        lda #>InputASoftProg
        sta KSWL+1
        ; Set to 0 if the program doesn't
        ; seem to be working (may be
        ; hidden syntax errors?)
.define HIDE_ASOFT_INPUT 0
.if HIDE_ASOFT_INPUT
        lda #<MyRTS
        sta CSWL
        lda #>MyRTS
        sta CSWL+1
.endif
        jmp APPLESOFT
Loop:
	jmp Loop

.include "basic-prog.inc"

InputASoftProg:
ProgMarker = InputASoftProg + 1
	lda ASoftProg	; load next prog char
        pha		; and push it
        lda ProgMarker	; are we at the end?
        cmp #<(ASoftEnd-1); low byte eq?
        bne @incr1	; no, then go to incr
        lda ProgMarker+1
        cmp #>(ASoftEnd-1); hi byte eq?
        bne @incr	; no, then go to incr
        lda #<KEYIN	; YES - restore normal
        sta KSWL	;  I/O before returning
        lda #>KEYIN	;  final character
        sta KSWL+1
        lda #<COUT1
        sta CSWL
        lda #>COUT1
        sta CSWL+1
        jmp @done
@incr:	lda ProgMarker
@incr1:	clc		; increment string ptr
        adc #1
        sta ProgMarker
        lda ProgMarker+1
        adc #0
        sta ProgMarker+1
@done:	pla
MyRTS:	rts
        
        
PrintStuff:
	jsr HOME
	lda #<ASoftProg
        sta PrPtr
        lda #>ASoftProg
        sta PrPtr+1
        ldy #0
@next:	lda (PrPtr),y	; print next char
        jsr COUT	;  of string
        lda PrPtr	; are we at the end?
        cmp #<(ASoftEnd-1); low byte eq?
        bne @incr1	; no, then go to incr
        lda PrPtr+1
        cmp #>(ASoftEnd-1); hi byte eq?
        bne @incr	; no, then go to incr
        rts		; else RETURN.
@incr:	lda PrPtr
@incr1:	clc		; increment string ptr
        adc #1
        sta PrPtr
        lda PrPtr+1
        adc #0
        sta PrPtr+1
        jmp @next	; loop back

Msg:
    scrcode "HELLO"
MsgEnd:
    .byte 0