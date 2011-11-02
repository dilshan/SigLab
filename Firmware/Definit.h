#define	EP0_PACKET_SIZE		8		// EP0 In & Out transfer size
#define	HID_PACKET_SIZE		64		// EP1 In & Out transfer size


//**************************************************************************************************
//
// Definitions
//
//**************************************************************************************************
#define	USB_BUS_ATTACHED	1
#define	USB_BUS_DETACHED	0

#define	USB_DEVICE_DESCRIPTOR_LEN			0x12
#define	USB_CONFIG_DESCRIPTOR_LEN			0x09
#define	USB_INTERF_DESCRIPTOR_LEN			0x09
#define	USB_ENDP_DESCRIPTOR_LEN				0x07
#define	USB_HID_DESCRIPTOR_LEN				0x09


#define	USB_DEVICE_DESCRIPTOR_TYPE		0x01
#define	USB_CONFIG_DESCRIPTOR_TYPE		0x02
#define	USB_STRING_DESCRIPTOR_TYPE		0x03
#define	USB_INTERFACE_DESCRIPTOR_TYPE	0x04
#define	USB_ENDPOINT_DESCRIPTOR_TYPE	0x05
#define	USB_POWER_DESCRIPTOR_TYPE			0x06
#define	USB_HID_DESCRIPTOR_TYPE				0x21

#define	USB_ENDPOINT_TYPE_CONTROL			0x00
#define	USB_ENDPOINT_TYPE_ISOCHRONOUS	0x01
#define	USB_ENDPOINT_TYPE_BULK				0x02
#define	USB_ENDPOINT_TYPE_INTERRUPT		0x03

#define	DSC_DEV				0x01
#define	DSC_CFG				0x02
#define	DSC_STR				0x03
#define	DSC_INTF			0x04
#define	DSC_EP				0x05



//**************************************************************************************************
//
// Definitions (added 19.06.2007)
//
//**************************************************************************************************
#define ConfigDescr_OFFS								0x24 // 0x12
#define HID_Descriptor_OFFS							0x48 // 0x24
#define HID_ReportDesc_OFFS							0x76 // 0x3B

#define USB_DEVICE_DESCRIPTOR_ALL_LEN 	0x6A



//**************************************************************************************************
//
// USBdrv.h
//
//**************************************************************************************************
//	* UCFG Initialization Parameters
#define _PPBM0		0x00			// Pingpong Buffer Mode 0
#define _PPBM1		0x01			// Pingpong Buffer Mode 1
#define _PPBM2		0x02			// Pingpong Buffer Mode 2
#define _LS				0x00			// Use Low-Speed USB Mode
#define _FS				0x04			// Use Full-Speed USB Mode
#define _TRINT		0x00			// Use internal transceiver
#define _TREXT		0x08			// Use external transceiver
#define _PUEN			0x10			// Use internal pull-up resistor
#define _OEMON		0x40			// Use SIE output indicator
#define _UTEYE		0x80			// Use Eye-Pattern test

//	* UEPn Initialization Parameters
#define	EP_CTRL		0x06			// Cfg Control pipe for this ep
#define	EP_OUT		0x0C			// Cfg OUT only pipe for this ep
#define	EP_IN			0x0A			// Cfg IN only pipe for this ep
#define	EP_OUT_IN	0x0E			// Cfg both OUT & IN pipes for this ep
#define	HSHK_EN		0x10			// Enable handshake packet

#define	OUT		0
#define	IN		1

#define	PIC_EP_NUM_MASK	0x78
#define	PIC_EP_DIR_MASK	0x04

#define	EP00_OUT	0x00	// (0x00<<3) | (OUT<<2)
#define	EP00_IN		0x04	// (0x00<<3) | ( IN<<2)
#define	EP01_OUT	0x08	// (0x01<<3) | (OUT<<2)
#define	EP01_IN		0x0C	// (0x01<<3) | ( IN<<2)
#define	EP02_OUT	0x10	// (0x02<<3) | (OUT<<2)
#define	EP02_IN		0x14	// (0x02<<3) | ( IN<<2)
#define	EP03_OUT	0x18	// (0x03<<3) | (OUT<<2)
#define	EP03_IN		0x1C	// (0x03<<3) | ( IN<<2)
#define	EP04_OUT	0x20	// (0x04<<3) | (OUT<<2)
#define	EP04_IN		0x24	// (0x04<<3) | ( IN<<2)
#define	EP05_OUT	0x28	// (0x05<<3) | (OUT<<2)
#define	EP05_IN		0x2C	// (0x05<<3) | ( IN<<2)
#define	EP06_OUT	0x30	// (0x06<<3) | (OUT<<2)
#define	EP06_IN		0x34	// (0x06<<3) | ( IN<<2)
#define	EP07_OUT	0x38	// (0x07<<3) | (OUT<<2)
#define	EP07_IN		0x3C	// (0x07<<3) | ( IN<<2)
#define	EP08_OUT	0x40	// (0x08<<3) | (OUT<<2)
#define	EP08_IN		0x44	// (0x08<<3) | ( IN<<2)
#define	EP09_OUT	0x48	// (0x09<<3) | (OUT<<2)
#define	EP09_IN		0x4C	// (0x09<<3) | ( IN<<2)
#define	EP10_OUT	0x50	// (0x0A<<3) | (OUT<<2)
#define	EP10_IN		0x54	// (0x0A<<3) | ( IN<<2)
#define	EP11_OUT	0x58	// (0x0B<<3) | (OUT<<2)
#define	EP11_IN		0x5C	// (0x0B<<3) | ( IN<<2)
#define	EP12_OUT	0x60	// (0x0C<<3) | (OUT<<2)
#define	EP12_IN		0x64	// (0x0C<<3) | ( IN<<2)
#define	EP13_OUT	0x68	// (0x0D<<3) | (OUT<<2)
#define	EP13_IN		0x6C	// (0x0D<<3) | ( IN<<2)
#define	EP14_OUT	0x70	// (0x0E<<3) | (OUT<<2)
#define	EP14_IN		0x74	// (0x0E<<3) | ( IN<<2)
#define	EP15_OUT	0x78	// (0x0F<<3) | (OUT<<2)
#define	EP15_IN		0x7C	// (0x0F<<3) | ( IN<<2)
//**************************************************************************************************
//
// USBmmap.h
//
//**************************************************************************************************
//	* Buffer Descriptor Status Register Initialization Parameters
#define	_BC89			0x03			// Byte count bits 8 and 9
#define	_BSTALL		0x04			// Buffer Stall enable
#define	_DTSEN		0x08			// Data Toggle Synch enable
#define	_INCDIS		0x10			// Address increment disable
#define	_KEN			0x20			// SIE keeps buff descriptors enable
#define	_DAT0			0x00			// DATA0 packet expected next
#define	_DAT1			0x40			// DATA1 packet expected next
#define	_DTSMASK	0x40			// DTS Mask
#define	_USIE			0x80			// SIE owns buffer
#define	_UCPU			0x00			// CPU owns buffer
//	* USB Device States - To be used with [byte usb_device_state]
#define	DETACHED_STATE		0
#define	ATTACHED_STATE		1
#define	POWERED_STATE			2
#define	DEFAULT_STATE			3
#define	ADR_PENDING_STATE	4
#define	ADDRESS_STATE			5
#define	CONFIGURED_STATE	6
//	* Memory Types for Control Transfer - used in USB_DEVICE_STATUS
#define	_RAM	0
#define	_ROM	1

#define	RemoteWakeup	0
#define	ctrl_trf_mem	1
//**************************************************************************************************
//
// USBctrlTrf.h
//
//**************************************************************************************************
//	* Control Transfer States
#define WAIT_SETUP			0
#define CTRL_TRF_TX			1
#define CTRL_TRF_RX			2
//	* USB PID: Token Types - See chapter 8 in the USB specification
#define SETUP_TOKEN		0x0D
#define OUT_TOKEN			0x01
#define IN_TOKEN			0x09
//	* bmRequestType Definitions
#define HOST_TO_DEV			0
#define DEV_TO_HOST			1

#define STANDARD			0x00
#define CLASS					0x01
#define VENDOR				0x02

#define RCPT_DEV			0
#define RCPT_INTF			1
#define RCPT_EP				2
#define RCPT_OTH			3
//**************************************************************************************************
//
// USBcfg.h
//
//**************************************************************************************************
//	* MUID = Microchip USB Class ID
//	* Used to identify which of the USB classes owns the current session of control transfer over EP0
#define	MUID_NULL			0
#define	MUID_USB9			1
#define	MUID_HID			2
//**************************************************************************************************
//
// USB9.h
//
//**************************************************************************************************
//	* Standard Request Codes, USB 2.0 Spec Ref Table 9-4
#define	GET_STATUS		0
#define	CLR_FEATURE		1
#define	SET_FEATURE		3
#define	SET_ADR				5
#define	GET_DSC				6
#define	SET_DSC				7
#define	GET_CFG				8
#define	SET_CFG				9
#define	GET_INTF			10
#define	SET_INTF			11
#define	SYNCH_FRAME		12
//	* Standard Feature Selectors
#define DEVICE_REMOTE_WAKEUP	0x01
#define ENDPOINT_HALT					0x00
//**************************************************************************************************
//
// HID.h
//
//**************************************************************************************************
#define	HID_INTF_ID		0x00
//	* Class-Specific Requests
#define	GET_REPORT		0x01
#define	GET_IDLE			0x02
#define	GET_PROTOCOL	0x03
#define	SET_REPORT		0x09
#define	SET_IDLE			0x0A
#define	SET_PROTOCOL	0x0B
//	* Class Descriptor Types
#define	DSC_HID				0x21
#define	DSC_RPT				0x22
#define	DSC_PHY				0x23
//**************************************************************************************************

