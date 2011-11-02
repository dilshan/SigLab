
_InitUSBdsc:
;USBdsc.c,202 :: 		void InitUSBdsc()
;USBdsc.c,204 :: 		Byte_tmp_0[0] = NUM_ENDPOINTS;
	MOVLW       2
	MOVWF       _Byte_tmp_0+0 
;USBdsc.c,205 :: 		Byte_tmp_0[0] = ConfigDescr_wTotalLength;
	MOVLW       41
	MOVWF       _Byte_tmp_0+0 
;USBdsc.c,206 :: 		Byte_tmp_0[0] = HID_ReportDesc_len;
	MOVLW       47
	MOVWF       _Byte_tmp_0+0 
;USBdsc.c,207 :: 		Byte_tmp_0[0] = Low_HID_ReportDesc_len;
	MOVLW       47
	MOVWF       _Byte_tmp_0+0 
;USBdsc.c,208 :: 		Byte_tmp_0[0] = High_HID_ReportDesc_len;
	CLRF        _Byte_tmp_0+0 
;USBdsc.c,209 :: 		Byte_tmp_0[0] = Low_HID_PACKET_SIZE;
	MOVLW       64
	MOVWF       _Byte_tmp_0+0 
;USBdsc.c,210 :: 		Byte_tmp_0[0] = High_HID_PACKET_SIZE;
	CLRF        _Byte_tmp_0+0 
;USBdsc.c,219 :: 		}
	RETURN      0
; end of _InitUSBdsc
