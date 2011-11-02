
_interrupt:
;siglabfw.c,22 :: 		void interrupt() {
;siglabfw.c,23 :: 		asm CALL _Hid_InterruptProc
	CALL        _HID_InterruptProc+0, 0
;siglabfw.c,24 :: 		asm nop
	NOP
;siglabfw.c,25 :: 		}
L__interrupt31:
	RETFIE      1
; end of _interrupt

_ClearWriteBuffer:
;siglabfw.c,27 :: 		void ClearWriteBuffer() {
;siglabfw.c,29 :: 		for(buffer_pos = 1; buffer_pos < 64; buffer_pos++)
	MOVLW       1
	MOVWF       R1 
L_ClearWriteBuffer0:
	MOVLW       64
	SUBWF       R1, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_ClearWriteBuffer1
;siglabfw.c,30 :: 		write_buffer[buffer_pos] = 0;
	MOVLW       _write_buffer+0
	MOVWF       FSR1L 
	MOVLW       hi_addr(_write_buffer+0
	MOVWF       FSR1H 
	MOVF        R1, 0 
	ADDWF       FSR1L, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	CLRF        POSTINC1+0 
;siglabfw.c,29 :: 		for(buffer_pos = 1; buffer_pos < 64; buffer_pos++)
	INCF        R1, 1 
;siglabfw.c,30 :: 		write_buffer[buffer_pos] = 0;
	GOTO        L_ClearWriteBuffer0
L_ClearWriteBuffer1:
;siglabfw.c,31 :: 		write_buffer[0] = SIGNATURE+1;
	MOVLW       43
	MOVWF       _write_buffer+0 
;siglabfw.c,32 :: 		}
	RETURN      0
; end of _ClearWriteBuffer

_SendData:
;siglabfw.c,34 :: 		void SendData() {
;siglabfw.c,35 :: 		while (!HID_Write(&write_buffer, 4)) ;
L_SendData3:
	MOVLW       _write_buffer+0
	MOVWF       FARG_HID_Write_Buffer+0 
	MOVLW       hi_addr(_write_buffer+0
	MOVWF       FARG_HID_Write_Buffer+1 
	MOVLW       4
	MOVWF       FARG_HID_Write_Len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_SendData4
	GOTO        L_SendData3
L_SendData4:
;siglabfw.c,36 :: 		}
	RETURN      0
; end of _SendData

_main:
;siglabfw.c,38 :: 		void main() {
;siglabfw.c,41 :: 		INTCON = 0x0;
	CLRF        INTCON+0 
;siglabfw.c,42 :: 		RCON.IPEN = 0x0;
	BCF         RCON+0, 7 
;siglabfw.c,43 :: 		ADCON0 = 0x0;
	CLRF        ADCON0+0 
;siglabfw.c,44 :: 		ADCON1 = 0x0F;
	MOVLW       15
	MOVWF       ADCON1+0 
;siglabfw.c,46 :: 		TRISA = 0x0;
	CLRF        TRISA+0 
;siglabfw.c,47 :: 		TRISB = 0x0;
	CLRF        TRISB+0 
;siglabfw.c,48 :: 		TRISC = 0x0;
	CLRF        TRISC+0 
;siglabfw.c,50 :: 		PORTA = 0x0;
	CLRF        PORTA+0 
;siglabfw.c,51 :: 		PORTB = 0x0;
	CLRF        PORTB+0 
;siglabfw.c,53 :: 		Hid_Enable(&read_buffer, &write_buffer);
	MOVLW       _read_buffer+0
	MOVWF       FARG_HID_Enable_ReadBuff+0 
	MOVLW       hi_addr(_read_buffer+0
	MOVWF       FARG_HID_Enable_ReadBuff+1 
	MOVLW       _write_buffer+0
	MOVWF       FARG_HID_Enable_WriteBuff+0 
	MOVLW       hi_addr(_write_buffer+0
	MOVWF       FARG_HID_Enable_WriteBuff+1 
	CALL        _HID_Enable+0, 0
;siglabfw.c,54 :: 		asm nop
	NOP
;siglabfw.c,55 :: 		ClearWriteBuffer();
	CALL        _ClearWriteBuffer+0, 0
;siglabfw.c,56 :: 		while(1) {
L_main5:
;siglabfw.c,57 :: 		read_size = HID_Read();
	CALL        _HID_Read+0, 0
;siglabfw.c,58 :: 		if(read_size > 0) {
	MOVF        R0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_main7
;siglabfw.c,59 :: 		if(read_buffer[0] != SIGNATURE)
	MOVF        _read_buffer+0, 0 
	XORLW       42
	BTFSC       STATUS+0, 2 
	GOTO        L_main8
;siglabfw.c,60 :: 		continue;
	GOTO        L_main5
L_main8:
;siglabfw.c,61 :: 		switch(read_buffer[1]) {
	GOTO        L_main9
;siglabfw.c,62 :: 		case 1:
L_main11:
;siglabfw.c,63 :: 		switch (read_buffer[3]) {
	GOTO        L_main12
;siglabfw.c,64 :: 		case 0: PORTA = read_buffer[2]; break;
L_main14:
	MOVF        _read_buffer+2, 0 
	MOVWF       PORTA+0 
	GOTO        L_main13
;siglabfw.c,65 :: 		case 1: PORTB = read_buffer[2]; break;
L_main15:
	MOVF        _read_buffer+2, 0 
	MOVWF       PORTB+0 
	GOTO        L_main13
;siglabfw.c,66 :: 		}
L_main12:
	MOVF        _read_buffer+3, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_main14
	MOVF        _read_buffer+3, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_main15
L_main13:
;siglabfw.c,67 :: 		break;
	GOTO        L_main10
;siglabfw.c,68 :: 		case 2:
L_main16:
;siglabfw.c,69 :: 		switch (read_buffer[3]) {
	GOTO        L_main17
;siglabfw.c,70 :: 		case 0: TRISA = read_buffer[2]; break;
L_main19:
	MOVF        _read_buffer+2, 0 
	MOVWF       TRISA+0 
	GOTO        L_main18
;siglabfw.c,71 :: 		case 1: TRISB = read_buffer[2]; break;
L_main20:
	MOVF        _read_buffer+2, 0 
	MOVWF       TRISB+0 
	GOTO        L_main18
;siglabfw.c,72 :: 		}
L_main17:
	MOVF        _read_buffer+3, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_main19
	MOVF        _read_buffer+3, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_main20
L_main18:
;siglabfw.c,73 :: 		break;
	GOTO        L_main10
;siglabfw.c,74 :: 		case 3:
L_main21:
;siglabfw.c,75 :: 		write_buffer[1] = 3;
	MOVLW       3
	MOVWF       _write_buffer+1 
;siglabfw.c,76 :: 		switch (read_buffer[3]) {
	GOTO        L_main22
;siglabfw.c,77 :: 		case 0: write_buffer[2] = PORTA; break;
L_main24:
	MOVF        PORTA+0, 0 
	MOVWF       _write_buffer+2 
	GOTO        L_main23
;siglabfw.c,78 :: 		case 1: write_buffer[2] = PORTB; break;
L_main25:
	MOVF        PORTB+0, 0 
	MOVWF       _write_buffer+2 
	GOTO        L_main23
;siglabfw.c,79 :: 		}
L_main22:
	MOVF        _read_buffer+3, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_main24
	MOVF        _read_buffer+3, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_main25
L_main23:
;siglabfw.c,80 :: 		SendData();
	CALL        _SendData+0, 0
;siglabfw.c,81 :: 		break;
	GOTO        L_main10
;siglabfw.c,82 :: 		case 4:
L_main26:
;siglabfw.c,83 :: 		write_buffer[1] = 4;
	MOVLW       4
	MOVWF       _write_buffer+1 
;siglabfw.c,84 :: 		switch (read_buffer[3]) {
	GOTO        L_main27
;siglabfw.c,85 :: 		case 0: write_buffer[2] = TRISA; break;
L_main29:
	MOVF        TRISA+0, 0 
	MOVWF       _write_buffer+2 
	GOTO        L_main28
;siglabfw.c,86 :: 		case 1: write_buffer[2] = TRISB; break;
L_main30:
	MOVF        TRISB+0, 0 
	MOVWF       _write_buffer+2 
	GOTO        L_main28
;siglabfw.c,87 :: 		}
L_main27:
	MOVF        _read_buffer+3, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_main29
	MOVF        _read_buffer+3, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_main30
L_main28:
;siglabfw.c,88 :: 		SendData();
	CALL        _SendData+0, 0
;siglabfw.c,89 :: 		break;
	GOTO        L_main10
;siglabfw.c,90 :: 		}
L_main9:
	MOVF        _read_buffer+1, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_main11
	MOVF        _read_buffer+1, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_main16
	MOVF        _read_buffer+1, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_main21
	MOVF        _read_buffer+1, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_main26
L_main10:
;siglabfw.c,91 :: 		}
L_main7:
;siglabfw.c,92 :: 		}
	GOTO        L_main5
;siglabfw.c,93 :: 		}
	GOTO        $+0
; end of _main
