#line 1 "D:/SigLab/Firmware/USBdsc.c"
#line 1 "d:/siglab/firmware/definit.h"
#line 1 "d:/siglab/firmware/vars.h"





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









extern unsigned char SetupPkt_bmRequestType;
extern unsigned char SetupPkt_bRequest;
extern unsigned int SetupPkt_wValue;
extern unsigned int SetupPkt_wIndex;
extern unsigned int SetupPkt_wLength;

extern unsigned int SetupPkt_W_Value;
extern unsigned int SetupPkt_W_Index;
extern unsigned int SetupPkt_W_Length;

extern unsigned char SetupPkt_Recipient;
extern unsigned char SetupPkt_RequestType;
extern unsigned char SetupPkt_DataDir;
extern unsigned char SetupPkt_bFeature;

extern unsigned char SetupPkt_bDscIndex;
extern unsigned char SetupPkt_bDscType;
extern unsigned int SetupPkt_wLangID;

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









void InitVARs();
#line 20 "D:/SigLab/Firmware/USBdsc.c"
unsigned char const HID_INPUT_REPORT_BYTES = 4;
unsigned char const HID_OUTPUT_REPORT_BYTES = 4;

unsigned char const HID_FEATURE_REPORT_BYTES = 2;

unsigned char const NUM_ENDPOINTS = 2;
unsigned char const ConfigDescr_wTotalLength =  0x09  +  0x09  +  0x09  + (NUM_ENDPOINTS *  0x07 );
unsigned char const HID_ReportDesc_len = 47;

unsigned char const Low_HID_ReportDesc_len = HID_ReportDesc_len;
unsigned char const High_HID_ReportDesc_len = HID_ReportDesc_len >> 8;

unsigned char const Low_HID_PACKET_SIZE =  64 ;
unsigned char const High_HID_PACKET_SIZE =  64  >> 8;

unsigned char const DescTables[ 0x6A *2] = {

  0x12 , 0,
  0x01 , 0,
 0x00, 0,
 0x02, 0,
 0x00, 0,
 0x00, 0,
 0x00, 0,
  8 , 0,
 0x20, 0,
 0x84, 0,
 0x02, 0,
 0x00, 0,
 0x01, 0,
 0x00, 0,
 0x01, 0,
 0x02, 0,
 0x00, 0,
 0x01, 0,
  0x09 , 0,
  0x02 , 0,
 ConfigDescr_wTotalLength, 0,
 0x00, 0,
 0x01, 0,
 0x01, 0,
 0x00, 0,
 0xA0, 0,
 50, 0,
  0x09 , 0,
  0x04 , 0,
 0x00, 0,
 0x00, 0,
 NUM_ENDPOINTS, 0,
 0x03, 0,
 0x00, 0,
 0x00, 0,
 0x00, 0,
  0x09 , 0,
  0x21 , 0,
 0x01, 0,
 0x01, 0,
 0x00, 0,
 0x01, 0,
 0x22, 0,
 Low_HID_ReportDesc_len, 0,
 High_HID_ReportDesc_len, 0,
  0x07 , 0,
  0x05 , 0,
 0x81, 0,
  0x03 , 0,
 Low_HID_PACKET_SIZE, 0,
 High_HID_PACKET_SIZE, 0,
 1, 0,
  0x07 , 0,
  0x05 , 0,
 0x01, 0,
  0x03 , 0,
 Low_HID_PACKET_SIZE, 0,
 High_HID_PACKET_SIZE, 0,
 1, 0,
 0x06, 0,
 0xA0, 0,
 0xFF, 0,
 0x09, 0,
 0x01, 0,
 0xA1, 0,
 0x01, 0,
 0x09, 0,
 0x03, 0,
 0x15, 0,
 0x00, 0,
 0x26, 0,
 0x00, 0,
 0xFF, 0,
 0x75, 0,
 0x08, 0,
 0x95, 0,
 HID_INPUT_REPORT_BYTES, 0,
 0x81, 0,
 0x02, 0,
 0x09, 0,
 0x04, 0,
 0x15, 0,
 0x00, 0,
 0x26, 0,
 0x00, 0,
 0xFF, 0,
 0x75, 0,
 0x08, 0,
 0x95, 0,
 HID_OUTPUT_REPORT_BYTES, 0,
 0x91, 0,
 0x02, 0,
 0x09, 0,
 0x05, 0,
 0x15, 0,
 0x00, 0,
 0x26, 0,
 0x00, 0,
 0xFF, 0,
 0x75, 0,
 0x08, 0,
 0x95, 0,
 HID_FEATURE_REPORT_BYTES, 0,
 0xB1, 0,
 0x02, 0,
 0xC0, 0
};

unsigned char const LangIDDescr[8] = {
 0x04, 0,
  0x03 , 0,
 0x09, 0,
 0x04, 0
};

unsigned char const ManufacturerDescr[48] = {
 24, 0,
  0x03 , 0,
 'S', 0, 0, 0,
 'i', 0, 0, 0,
 'g', 0, 0, 0,
 'L', 0, 0, 0,
 'a', 0, 0, 0,
 'b', 0, 0, 0,
 ' ', 0, 0, 0,
 'T', 0, 0, 0,
 'e', 0, 0, 0,
 'a', 0, 0, 0,
 'm', 0, 0, 0
};

unsigned char const ProductDescr[100] = {
 50, 0,
  0x03 , 0,
 'S', 0, 0, 0,
 'i', 0, 0, 0,
 'g', 0, 0, 0,
 'L', 0, 0, 0,
 'a', 0, 0, 0,
 'b', 0, 0, 0,
 ' ', 0, 0, 0,
 'C', 0, 0, 0,
 'o', 0, 0, 0,
 'n', 0, 0, 0,
 't', 0, 0, 0,
 'r', 0, 0, 0,
 'o', 0, 0, 0,
 'l', 0, 0, 0,
 ' ', 0, 0, 0,
 'I', 0, 0, 0,
 'n', 0, 0, 0,
 't', 0, 0, 0,
 'e', 0, 0, 0,
 'r', 0, 0, 0,
 'f', 0, 0, 0,
 'a', 0, 0, 0,
 'c', 0, 0, 0,
 'e', 0, 0, 0
};

unsigned char const StrUnknownDescr[4] = {
 2, 0,
  0x03 , 0
};

void InitUSBdsc()
{
Byte_tmp_0[0] = NUM_ENDPOINTS;
Byte_tmp_0[0] = ConfigDescr_wTotalLength;
Byte_tmp_0[0] = HID_ReportDesc_len;
Byte_tmp_0[0] = Low_HID_ReportDesc_len;
Byte_tmp_0[0] = High_HID_ReportDesc_len;
Byte_tmp_0[0] = Low_HID_PACKET_SIZE;
Byte_tmp_0[0] = High_HID_PACKET_SIZE;

DescTables;

LangIDDescr;
ManufacturerDescr;
ProductDescr;
StrUnknownDescr;

}
