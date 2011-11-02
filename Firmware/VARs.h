//******************************************************************************
//
// Bank 4 GPR Variables in region 0x400 - 0x4FF
//
//******************************************************************************
extern unsigned char BDT[16];
extern unsigned char SetupPkt[8];
extern unsigned char CtrlTrfData[8];
extern unsigned char hid_report_feature[8];

extern unsigned char Byte_tmp_0[2];
extern unsigned char Byte_tmp_1[2];
extern unsigned char param_Len;
extern unsigned char param_buffer[2];
extern unsigned char USTAT_latch;
extern unsigned char usb_device_state;
extern unsigned char usb_active_cfg;
extern unsigned char usb_alt_intf[2];
extern unsigned char usb_stat;
extern unsigned char idle_rate;
extern unsigned char active_protocol;
extern unsigned char hid_rpt_rx_len;
extern unsigned char ctrl_trf_state;
extern unsigned char ctrl_trf_session_owner;
extern unsigned char pSrc[2];
extern unsigned char pDst[2];
extern unsigned char wCount[2];
extern unsigned char byte_to_send[2];
extern unsigned char byte_to_read[2];
extern unsigned char number_of_bytes_read;

extern unsigned char USB_CD_Ptr[4];
extern unsigned char USB_SD_Ptr[8];

extern char FSR0reg[2];
extern char FSR1reg[2];
extern char FSR2reg[2];

extern unsigned int HID_ReadBuff_Ptr;
extern unsigned int HID_WriteBuff_Ptr;

extern unsigned char hid_report_out[64];
extern unsigned char hid_report_in[64];






//******************************************************************************
// Setup packet structures in  EP0 Out  Buffer
//******************************************************************************
extern unsigned char SetupPkt_bmRequestType;
extern unsigned char SetupPkt_bRequest;
extern unsigned int  SetupPkt_wValue;
extern unsigned int  SetupPkt_wIndex;
extern unsigned int  SetupPkt_wLength;

extern unsigned int  SetupPkt_W_Value;
extern unsigned int  SetupPkt_W_Index;
extern unsigned int  SetupPkt_W_Length;

extern unsigned char SetupPkt_Recipient;
extern unsigned char SetupPkt_RequestType;
extern unsigned char SetupPkt_DataDir;
extern unsigned char SetupPkt_bFeature;

extern unsigned char SetupPkt_bDscIndex;
extern unsigned char SetupPkt_bDscType;
extern unsigned int  SetupPkt_wLangID;

extern unsigned char SetupPkt_bDevADR;
extern unsigned char SetupPkt_bDevADRH;

extern unsigned char SetupPkt_bCfgValue;
extern unsigned char SetupPkt_bCfgRSD;

extern unsigned char SetupPkt_bAltID;
extern unsigned char SetupPkt_bAltID_H;
extern unsigned char SetupPkt_bIntfID;
extern unsigned char SetupPkt_bIntfID_H;

extern unsigned char SetupPkt_bEPID;
extern unsigned char SetupPkt_bEPID_H;

extern unsigned char SetupPkt_EPNum;
extern unsigned char SetupPkt_EPDir;
//******************************************************************************
// Buffer Descriptors Table
//******************************************************************************
extern unsigned char BD0STAT;
extern unsigned char BD0CNT;
extern unsigned char BD0ADRL;
extern unsigned char BD0ADRH;
extern unsigned char BD1STAT;
extern unsigned char BD1CNT;
extern unsigned char BD1ADRL;
extern unsigned char BD1ADRH;
extern unsigned char BD2STAT;
extern unsigned char BD2CNT;
extern unsigned char BD2ADRL;
extern unsigned char BD2ADRH;
extern unsigned char BD3STAT;
extern unsigned char BD3CNT;
extern unsigned char BD3ADRL;
extern unsigned char BD3ADRH;
extern unsigned char BD4STAT;
extern unsigned char BD4CNT;
extern unsigned char BD4ADRL;
extern unsigned char BD4ADRH;
extern unsigned char BD5STAT;
extern unsigned char BD5CNT;
extern unsigned char BD5ADRL;
extern unsigned char BD5ADRH;
extern unsigned char BD6STAT;
extern unsigned char BD6CNT;
extern unsigned char BD6ADRL;
extern unsigned char BD6ADRH;
extern unsigned char BD7STAT;
extern unsigned char BD7CNT;
extern unsigned char BD7ADRL;
extern unsigned char BD7ADRH;
//******************************************************************************





//******************************************************************************
// Initialization Function
//******************************************************************************
void InitVARs();
//******************************************************************************
