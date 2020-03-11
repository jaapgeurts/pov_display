;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (Linux)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"ticker.c"
	list	p=16f676
	radix dec
	include "p16f676.inc"
;--------------------------------------------------------
; config word(s)
;--------------------------------------------------------
	__config 0x3fb4
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_STATUSbits
	extern	_PORTAbits
	extern	_PORTCbits
	extern	_INTCONbits
	extern	_PIR1bits
	extern	_T1CONbits
	extern	_CMCONbits
	extern	_ADCON0bits
	extern	_OPTION_REGbits
	extern	_TRISAbits
	extern	_TRISCbits
	extern	_PIE1bits
	extern	_PCONbits
	extern	_OSCCALbits
	extern	_ANSELbits
	extern	_WPUbits
	extern	_WPUAbits
	extern	_IOCbits
	extern	_IOCAbits
	extern	_VRCONbits
	extern	_EECON1bits
	extern	_ADCON1bits
	extern	_INDF
	extern	_TMR0
	extern	_PCL
	extern	_STATUS
	extern	_FSR
	extern	_PORTA
	extern	_PORTC
	extern	_PCLATH
	extern	_INTCON
	extern	_PIR1
	extern	_TMR1
	extern	_TMR1L
	extern	_TMR1H
	extern	_T1CON
	extern	_CMCON
	extern	_ADRESH
	extern	_ADCON0
	extern	_OPTION_REG
	extern	_TRISA
	extern	_TRISC
	extern	_PIE1
	extern	_PCON
	extern	_OSCCAL
	extern	_ANSEL
	extern	_WPU
	extern	_WPUA
	extern	_IOC
	extern	_IOCA
	extern	_VRCON
	extern	_EEDAT
	extern	_EEDATA
	extern	_EEADR
	extern	_EECON1
	extern	_EECON2
	extern	_ADRESL
	extern	_ADCON1
	extern	__mulchar
	extern	__gptrget1
	extern	___sdcc_saved_fsr
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_main
	global	_TIMER_START
	global	_scancol
	global	_pos
	global	_index
	global	_subindex
	global	_message
	global	_letters

	global PSAVE
	global SSAVE
	global WSAVE
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0020
PSAVE	res 1
SSAVE	res 1
WSAVE	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_ticker_0	udata
r0x1006	res	1
r0x1007	res	1
r0x1008	res	1
r0x1009	res	1
r0x100A	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

ID_ticker_0	idata
_TIMER_START
	db	0x4b


ID_ticker_1	idata
_scancol
	db	0x00


ID_ticker_2	idata
_pos
	db	0x89


ID_ticker_3	idata
_index
	db	0x00


ID_ticker_4	idata
_subindex
	db	0x00


ID_ticker_5	code
_message
	retlw 0x05
	retlw 0x0e
	retlw 0x0d
	retlw 0x13
	retlw 0x0e
	retlw 0x12
	retlw 0x24
	retlw 0x08
	retlw 0x02
	retlw 0x13


ID_ticker_6	code
_letters
	retlw 0x7c
	retlw 0x12
	retlw 0x11
	retlw 0x12
	retlw 0x7c
	retlw 0x00
	retlw 0x36
	retlw 0x49
	retlw 0x49
	retlw 0x7f
	retlw 0x41
	retlw 0x00
	retlw 0x22
	retlw 0x41
	retlw 0x41
	retlw 0x22
	retlw 0x1c
	retlw 0x00
	retlw 0x1c
	retlw 0x22
	retlw 0x41
	retlw 0x7f
	retlw 0x41
	retlw 0x00
	retlw 0x7f
	retlw 0x49
	retlw 0x49
	retlw 0x49
	retlw 0x41
	retlw 0x00
	retlw 0x01
	retlw 0x09
	retlw 0x09
	retlw 0x09
	retlw 0x7f
	retlw 0x00
	retlw 0x3a
	retlw 0x49
	retlw 0x49
	retlw 0x41
	retlw 0x3e
	retlw 0x00
	retlw 0x7f
	retlw 0x08
	retlw 0x08
	retlw 0x08
	retlw 0x7f
	retlw 0x00
	retlw 0x00
	retlw 0x41
	retlw 0x7f
	retlw 0x41
	retlw 0x00
	retlw 0x00
	retlw 0x01
	retlw 0x3f
	retlw 0x41
	retlw 0x40
	retlw 0x30
	retlw 0x00
	retlw 0x41
	retlw 0x22
	retlw 0x14
	retlw 0x08
	retlw 0x7f
	retlw 0x00
	retlw 0x40
	retlw 0x40
	retlw 0x40
	retlw 0x40
	retlw 0x7f
	retlw 0x00
	retlw 0x7f
	retlw 0x02
	retlw 0x0c
	retlw 0x02
	retlw 0x7f
	retlw 0x00
	retlw 0x7f
	retlw 0x06
	retlw 0x08
	retlw 0x30
	retlw 0x7f
	retlw 0x00
	retlw 0x3e
	retlw 0x41
	retlw 0x41
	retlw 0x41
	retlw 0x3e
	retlw 0x00
	retlw 0x06
	retlw 0x09
	retlw 0x09
	retlw 0x09
	retlw 0x7f
	retlw 0x00
	retlw 0x5e
	retlw 0x21
	retlw 0x51
	retlw 0x41
	retlw 0x3e
	retlw 0x00
	retlw 0x46
	retlw 0x29
	retlw 0x19
	retlw 0x09
	retlw 0x7f
	retlw 0x00
	retlw 0x32
	retlw 0x49
	retlw 0x49
	retlw 0x49
	retlw 0x26
	retlw 0x00
	retlw 0x01
	retlw 0x01
	retlw 0x7f
	retlw 0x01
	retlw 0x01
	retlw 0x00
	retlw 0x3f
	retlw 0x40
	retlw 0x40
	retlw 0x40
	retlw 0x3f
	retlw 0x00
	retlw 0x0f
	retlw 0x30
	retlw 0x40
	retlw 0x30
	retlw 0x0f
	retlw 0x00
	retlw 0x7f
	retlw 0x20
	retlw 0x18
	retlw 0x20
	retlw 0x7f
	retlw 0x00
	retlw 0x63
	retlw 0x14
	retlw 0x08
	retlw 0x14
	retlw 0x63
	retlw 0x00
	retlw 0x07
	retlw 0x08
	retlw 0x78
	retlw 0x08
	retlw 0x07
	retlw 0x00
	retlw 0x43
	retlw 0x45
	retlw 0x49
	retlw 0x51
	retlw 0x61
	retlw 0x00
	retlw 0x3e
	retlw 0x51
	retlw 0x49
	retlw 0x45
	retlw 0x3e
	retlw 0x00
	retlw 0x44
	retlw 0x42
	retlw 0x7f
	retlw 0x40
	retlw 0x40
	retlw 0x00
	retlw 0x62
	retlw 0x51
	retlw 0x49
	retlw 0x49
	retlw 0x46
	retlw 0x00
	retlw 0x22
	retlw 0x41
	retlw 0x49
	retlw 0x49
	retlw 0x36
	retlw 0x00
	retlw 0x18
	retlw 0x14
	retlw 0x12
	retlw 0x7f
	retlw 0x10
	retlw 0x00
	retlw 0x47
	retlw 0x45
	retlw 0x45
	retlw 0x29
	retlw 0x11
	retlw 0x00
	retlw 0x3c
	retlw 0x4a
	retlw 0x49
	retlw 0x49
	retlw 0x30
	retlw 0x00
	retlw 0x03
	retlw 0x01
	retlw 0x79
	retlw 0x05
	retlw 0x03
	retlw 0x00
	retlw 0x36
	retlw 0x49
	retlw 0x49
	retlw 0x49
	retlw 0x36
	retlw 0x00
	retlw 0x06
	retlw 0x49
	retlw 0x49
	retlw 0x29
	retlw 0x1e
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x0c
	retlw 0x1e
	retlw 0x3c
	retlw 0x1e
	retlw 0x0c
	retlw 0x00

;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	nop
	pagesel __sdcc_gsinit_startup
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; interrupt and initialization code
;--------------------------------------------------------
c_interrupt	code	0x0004
__sdcc_interrupt:
;***
;  pBlock Stats: dbName = I
;***
;functions called:
;   _showled
;   _showled
;; Starting pCode block
_isr_int:
; 0 exit points
;	.line	233; "ticker.c"	static  void isr_int(void) __interrupt(0) {
	MOVWF	WSAVE
	SWAPF	STATUS,W
	CLRF	STATUS
	MOVWF	SSAVE
	MOVF	PCLATH,W
	CLRF	PCLATH
	MOVWF	PSAVE
	MOVF	FSR,W
	MOVWF	___sdcc_saved_fsr
;	.line	235; "ticker.c"	TMR0 = TIMER_START; // writing to TMR0 clears the prescaler counter
	MOVF	_TIMER_START,W
	BANKSEL	_TMR0
	MOVWF	_TMR0
;	.line	238; "ticker.c"	if (INTE && INTF) // External Interrupt
	BTFSS	_INTCONbits,4
	GOTO	_00140_DS_
	BTFSS	_INTCONbits,1
	GOTO	_00140_DS_
;;unsigned compare: left < lit(0x8A=138), size=1
;	.line	242; "ticker.c"	if (scancol < XWIDTH && TIMER_START < 255)
	MOVLW	0x8a
	SUBWF	_scancol,W
	BTFSC	STATUS,0
	GOTO	_00125_DS_
;;genSkipc:3257: created from rifx:0x7ffccb4dad00
;;unsigned compare: left < lit(0xFF=255), size=1
	MOVLW	0xff
	SUBWF	_TIMER_START,W
	BTFSC	STATUS,0
	GOTO	_00125_DS_
;;genSkipc:3257: created from rifx:0x7ffccb4dad00
;	.line	243; "ticker.c"	TIMER_START++;
	INCF	_TIMER_START,F
	GOTO	_00126_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x8B=139), size=1
_00125_DS_:
;	.line	244; "ticker.c"	else if (scancol > XWIDTH && TIMER_START > 0)
	MOVLW	0x8b
	SUBWF	_scancol,W
	BTFSS	STATUS,0
	GOTO	_00126_DS_
;;genSkipc:3257: created from rifx:0x7ffccb4dad00
	MOVLW	0x00
;	.line	245; "ticker.c"	TIMER_START--;
	IORWF	_TIMER_START,W
;	.line	254; "ticker.c"	if (pos == 0) {
	BTFSS	STATUS,2
	DECF	_TIMER_START,F
_00126_DS_:
	MOVLW	0x00
	IORWF	_pos,W
	BTFSS	STATUS,2
	GOTO	_00129_DS_
;	.line	255; "ticker.c"	pos = XWIDTH;
	MOVLW	0x8a
	MOVWF	_pos
_00129_DS_:
;	.line	258; "ticker.c"	pos--;
	DECF	_pos,F
;	.line	260; "ticker.c"	scancol = 0;
	CLRF	_scancol
;	.line	262; "ticker.c"	INTF = 0; // clear interrupt flag
	BANKSEL	_INTCONbits
	BCF	_INTCONbits,1
;	.line	263; "ticker.c"	T0IF = 0; // also clear timer flag in case it occurred
	BCF	_INTCONbits,2
	GOTO	_00143_DS_
_00140_DS_:
;	.line	264; "ticker.c"	} else if (T0IE && T0IF) // Timer Overflow
	BANKSEL	_INTCONbits
	BTFSS	_INTCONbits,5
	GOTO	_00143_DS_
	BTFSS	_INTCONbits,2
	GOTO	_00143_DS_
;;unsigned compare: left < lit(0xFF=255), size=1
;	.line	267; "ticker.c"	if (scancol < 255) {
	MOVLW	0xff
	SUBWF	_scancol,W
	BTFSC	STATUS,0
	GOTO	_00131_DS_
;;genSkipc:3257: created from rifx:0x7ffccb4dad00
;	.line	269; "ticker.c"	showled();
	PAGESEL	_showled
	CALL	_showled
	PAGESEL	$
;	.line	271; "ticker.c"	scancol++;
	INCF	_scancol,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x8B=139), size=1
_00131_DS_:
;	.line	274; "ticker.c"	if (scancol > XWIDTH) {
	MOVLW	0x8b
	SUBWF	_scancol,W
	BTFSS	STATUS,0
	GOTO	_00133_DS_
;;genSkipc:3257: created from rifx:0x7ffccb4dad00
;	.line	275; "ticker.c"	PORTC = 0x3f;
	MOVLW	0x3f
	BANKSEL	_PORTC
	MOVWF	_PORTC
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x8B=139), size=1
_00133_DS_:
;	.line	277; "ticker.c"	if (pos > XWIDTH) {
	MOVLW	0x8b
;	.line	278; "ticker.c"	RA5 = 1;
	SUBWF	_pos,W
;	.line	284; "ticker.c"	T0IF = 0;
	BTFSS	STATUS,0
	GOTO	_00003_DS_
	BANKSEL	_PORTAbits
	BSF	_PORTAbits,5
_00003_DS_:
	BANKSEL	_INTCONbits
	BCF	_INTCONbits,2
_00143_DS_:
;	.line	286; "ticker.c"	}
	MOVF	___sdcc_saved_fsr,W
	MOVWF	FSR
	MOVF	PSAVE,W
	MOVWF	PCLATH
	CLRF	STATUS
	SWAPF	SSAVE,W
	MOVWF	STATUS
	SWAPF	WSAVE,F
	SWAPF	WSAVE,W
END_OF_INTERRUPT:
	RETFIE	

;--------------------------------------------------------
; code
;--------------------------------------------------------
code_ticker	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;; Starting pCode block
S_ticker__main	code
_main:
; 2 exit points
;	.line	292; "ticker.c"	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRF	_PORTA
;	.line	293; "ticker.c"	PORTC = 0x00;
	CLRF	_PORTC
;	.line	296; "ticker.c"	ANSEL = 0;
	BANKSEL	_ANSEL
	CLRF	_ANSEL
;	.line	299; "ticker.c"	TRISA = 0x00; // portA as output
	CLRF	_TRISA
;	.line	300; "ticker.c"	TRISA2 = 1; // except RA2
	BSF	_TRISAbits,2
;	.line	301; "ticker.c"	TRISC = 0x00; // portC as output
	CLRF	_TRISC
;	.line	303; "ticker.c"	GIE = 0; // disable global interrupts
	BANKSEL	_INTCONbits
	BCF	_INTCONbits,7
;	.line	306; "ticker.c"	TMR0 = TIMER_START;
	MOVF	_TIMER_START,W
	MOVWF	_TMR0
;	.line	307; "ticker.c"	T0CS = 0; // timer clock source to internal clock,
	BANKSEL	_OPTION_REGbits
	BCF	_OPTION_REGbits,5
;	.line	309; "ticker.c"	PSA = 0; // assign prescaler to timer0
	BCF	_OPTION_REGbits,3
;	.line	310; "ticker.c"	PS0 = 1;
	BSF	_OPTION_REGbits,0
;	.line	311; "ticker.c"	PS1 = 0;
	BCF	_OPTION_REGbits,1
;	.line	312; "ticker.c"	PS2 = 0; // prescaler to 4 = 1,000,000 / 4 = 250,000 Hz
	BCF	_OPTION_REGbits,2
;	.line	314; "ticker.c"	T0IF = 0; // clear timer0 overflow flag
	BANKSEL	_INTCONbits
	BCF	_INTCONbits,2
;	.line	315; "ticker.c"	T0IE = 1; // enable timer0 overflow interrupt
	BSF	_INTCONbits,5
;	.line	317; "ticker.c"	INTF = 0; // clear INT flag
	BCF	_INTCONbits,1
;	.line	318; "ticker.c"	INTEDG = 0; //  trigger on rising edge
	BANKSEL	_OPTION_REGbits
	BCF	_OPTION_REGbits,6
;	.line	319; "ticker.c"	INTE = 1; // enable external interrupt on RA2
	BANKSEL	_INTCONbits
	BSF	_INTCONbits,4
;	.line	320; "ticker.c"	GIE = 1; // enable global interrupts
	BSF	_INTCONbits,7
_00149_DS_:
;	.line	322; "ticker.c"	forever{
	GOTO	_00149_DS_
;	.line	326; "ticker.c"	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __mulchar
;   __gptrget1
;   __mulchar
;   __gptrget1
;   __gptrget1
;   __mulchar
;   __gptrget1
;   __mulchar
;   __gptrget1
;   __gptrget1
;7 compiler assigned registers:
;   r0x1006
;   STK00
;   r0x1007
;   r0x1008
;   STK01
;   r0x1009
;   r0x100A
;; Starting pCode block
S_ticker__showled	code
_showled:
; 2 exit points
;	.line	205; "ticker.c"	if (scancol == pos) {
	MOVF	_pos,W
	XORWF	_scancol,W
	BTFSS	STATUS,2
	GOTO	_00106_DS_
;	.line	206; "ticker.c"	index = subindex = 0;
	CLRF	_subindex
	CLRF	_index
_00106_DS_:
;	.line	208; "ticker.c"	uint8_t pos2 = pos + index * 6 + subindex;
	MOVF	_index,W
	MOVWF	r0x1006
	MOVLW	0x06
	MOVWF	STK00
	MOVF	r0x1006,W
	PAGESEL	__mulchar
	CALL	__mulchar
	PAGESEL	$
	MOVWF	r0x1007
	MOVF	_pos,W
	MOVWF	r0x1006
	MOVF	r0x1007,W
	ADDWF	r0x1006,W
	MOVWF	r0x1007
	MOVF	_subindex,W
	MOVWF	r0x1006
	ADDWF	r0x1007,W
	MOVWF	r0x1006
;;unsigned compare: left < lit(0x8A=138), size=1
;	.line	209; "ticker.c"	if (pos2 >= XWIDTH) {
	MOVLW	0x8a
	SUBWF	r0x1006,W
	BTFSS	STATUS,0
	GOTO	_00108_DS_
;;genSkipc:3257: created from rifx:0x7ffccb4dad00
;	.line	210; "ticker.c"	pos2 -= XWIDTH;
	MOVF	r0x1006,W
	MOVWF	r0x1007
	MOVLW	0x76
	ADDWF	r0x1007,F
;	.line	211; "ticker.c"	pos2-=3;
	MOVF	r0x1007,W
	MOVWF	r0x1008
	MOVLW	0xfd
	ADDWF	r0x1008,W
	MOVWF	r0x1006
_00108_DS_:
;	.line	214; "ticker.c"	if (scancol == pos2) {
	MOVF	r0x1006,W
	XORWF	_scancol,W
	BTFSS	STATUS,2
	GOTO	_00114_DS_
;	.line	216; "ticker.c"	uint8_t map = message[index];
	MOVF	_index,W
	ADDLW	(_message + 0)
	MOVWF	r0x1006
	MOVLW	high (_message + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1007
	MOVF	r0x1006,W
	MOVWF	STK01
	MOVF	r0x1007,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	MOVWF	r0x1008
;	.line	217; "ticker.c"	PORTC = letters[map][subindex] & 0b00111111;
	MOVLW	0x06
	MOVWF	STK00
	MOVF	r0x1008,W
	PAGESEL	__mulchar
	CALL	__mulchar
	PAGESEL	$
	MOVWF	r0x1006
	CLRF	r0x1007
	MOVF	r0x1006,W
	ADDLW	(_letters + 0)
	MOVWF	r0x1008
	MOVLW	high (_letters + 0)
	MOVWF	r0x1009
	MOVLW	0x00
	BTFSC	STATUS,0
	INCFSZ	r0x1007,W
	ADDWF	r0x1009,F
	MOVF	_subindex,W
	ADDWF	r0x1008,W
	MOVWF	r0x1006
	MOVF	r0x1009,W
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1007
	MOVF	r0x1006,W
	MOVWF	STK01
	MOVF	r0x1007,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	MOVWF	r0x100A
	MOVLW	0x3f
	ANDWF	r0x100A,W
	BANKSEL	_PORTC
	MOVWF	_PORTC
;	.line	218; "ticker.c"	RA5 = (letters[map][subindex] >> 6) & 1;
	MOVF	_subindex,W
	ADDWF	r0x1008,F
	MOVF	r0x1009,W
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1009
	MOVF	r0x1008,W
	MOVWF	STK01
	MOVF	r0x1009,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	MOVWF	r0x1006
	ANDLW	0x40
	BTFSS	STATUS,2
	MOVLW	0x01
	MOVWF	r0x1008
	RRF	r0x1008,W
	BTFSC	STATUS,0
	GOTO	_00001_DS_
	BANKSEL	_PORTAbits
	BCF	_PORTAbits,5
_00001_DS_:
	BTFSS	STATUS,0
	GOTO	_00002_DS_
	BANKSEL	_PORTAbits
	BSF	_PORTAbits,5
_00002_DS_:
;	.line	219; "ticker.c"	subindex++;
	INCF	_subindex,F
;	.line	220; "ticker.c"	if (subindex == 6) {
	MOVF	_subindex,W
	XORLW	0x06
	BTFSS	STATUS,2
	GOTO	_00116_DS_
;	.line	221; "ticker.c"	subindex = 0;
	CLRF	_subindex
;	.line	222; "ticker.c"	index++;
	INCF	_index,F
;	.line	223; "ticker.c"	if (index == MAX_MESSAGE)
	MOVF	_index,W
	XORLW	0x0a
	BTFSS	STATUS,2
	GOTO	_00116_DS_
;	.line	224; "ticker.c"	index = 0;
	CLRF	_index
	GOTO	_00116_DS_
_00114_DS_:
;	.line	228; "ticker.c"	PORTC = 0x00;
	BANKSEL	_PORTC
	CLRF	_PORTC
;	.line	229; "ticker.c"	RA5 = 0;
	BCF	_PORTAbits,5
_00116_DS_:
;	.line	231; "ticker.c"	}
	RETURN	
; exit point of _showled


;	code size estimation:
;	  223+   29 =   252 instructions (  562 byte)

	end
