#line 1 "D:/SigLab/Firmware/siglabfw.c"
#line 19 "D:/SigLab/Firmware/siglabfw.c"
unsigned short read_buffer[64];
unsigned short write_buffer[64];

void interrupt() {
 asm CALL _Hid_InterruptProc
 asm nop
}

void ClearWriteBuffer() {
 unsigned char buffer_pos;
 for(buffer_pos = 1; buffer_pos < 64; buffer_pos++)
 write_buffer[buffer_pos] = 0;
 write_buffer[0] =  42 +1;
}

void SendData() {
 while (!HID_Write(&write_buffer, 4)) ;
}

void main() {
 unsigned char read_size;

 INTCON = 0x0;
 RCON.IPEN = 0x0;
 ADCON0 = 0x0;
 ADCON1 = 0x0F;

 TRISA = 0x0;
 TRISB = 0x0;
 TRISC = 0x0;

 PORTA = 0x0;
 PORTB = 0x0;

 Hid_Enable(&read_buffer, &write_buffer);
 asm nop
 ClearWriteBuffer();
 while(1) {
 read_size = HID_Read();
 if(read_size > 0) {
 if(read_buffer[0] !=  42 )
 continue;
 switch(read_buffer[1]) {
 case 1:
 switch (read_buffer[3]) {
 case 0: PORTA = read_buffer[2]; break;
 case 1: PORTB = read_buffer[2]; break;
 }
 break;
 case 2:
 switch (read_buffer[3]) {
 case 0: TRISA = read_buffer[2]; break;
 case 1: TRISB = read_buffer[2]; break;
 }
 break;
 case 3:
 write_buffer[1] = 3;
 switch (read_buffer[3]) {
 case 0: write_buffer[2] = PORTA; break;
 case 1: write_buffer[2] = PORTB; break;
 }
 SendData();
 break;
 case 4:
 write_buffer[1] = 4;
 switch (read_buffer[3]) {
 case 0: write_buffer[2] = TRISA; break;
 case 1: write_buffer[2] = TRISB; break;
 }
 SendData();
 break;
 }
 }
 }
}
