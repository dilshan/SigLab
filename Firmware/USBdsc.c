//  SigLab Controller Firmware.
//  Copyright © 2011 Dilshan R Jayakody.
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.

#include "Definit.h"
#include "VARs.h"

unsigned char const HID_INPUT_REPORT_BYTES      = 4;
unsigned char const HID_OUTPUT_REPORT_BYTES     = 4;

unsigned char const HID_FEATURE_REPORT_BYTES    = 2;

unsigned char const NUM_ENDPOINTS               = 2;
unsigned char const ConfigDescr_wTotalLength    = USB_CONFIG_DESCRIPTOR_LEN + USB_INTERF_DESCRIPTOR_LEN + USB_HID_DESCRIPTOR_LEN + (NUM_ENDPOINTS * USB_ENDP_DESCRIPTOR_LEN);
unsigned char const HID_ReportDesc_len          = 47;

unsigned char const Low_HID_ReportDesc_len      = HID_ReportDesc_len;
unsigned char const High_HID_ReportDesc_len     = HID_ReportDesc_len >> 8;

unsigned char const Low_HID_PACKET_SIZE         = HID_PACKET_SIZE;
unsigned char const High_HID_PACKET_SIZE        = HID_PACKET_SIZE >> 8;

unsigned char const DescTables[USB_DEVICE_DESCRIPTOR_ALL_LEN*2] = {

    USB_DEVICE_DESCRIPTOR_LEN, 0,
    USB_DEVICE_DESCRIPTOR_TYPE, 0,
    0x00, 0,
    0x02, 0,
    0x00, 0,
    0x00, 0,
    0x00, 0,
    EP0_PACKET_SIZE, 0,
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
    USB_CONFIG_DESCRIPTOR_LEN, 0,
    USB_CONFIG_DESCRIPTOR_TYPE, 0,
    ConfigDescr_wTotalLength, 0,
    0x00, 0,
    0x01, 0,
    0x01, 0,
    0x00, 0,
    0xA0, 0,
    50, 0,
    USB_INTERF_DESCRIPTOR_LEN, 0,
    USB_INTERFACE_DESCRIPTOR_TYPE, 0,
    0x00, 0,
    0x00, 0,
    NUM_ENDPOINTS, 0,
    0x03, 0,
    0x00, 0,
    0x00, 0,
    0x00, 0,
    USB_HID_DESCRIPTOR_LEN, 0,
    USB_HID_DESCRIPTOR_TYPE, 0,
    0x01, 0,
    0x01, 0,
    0x00, 0,
    0x01, 0,
    0x22, 0,
    Low_HID_ReportDesc_len, 0,
    High_HID_ReportDesc_len, 0,
    USB_ENDP_DESCRIPTOR_LEN, 0,
    USB_ENDPOINT_DESCRIPTOR_TYPE, 0,
    0x81, 0,
    USB_ENDPOINT_TYPE_INTERRUPT, 0,
    Low_HID_PACKET_SIZE, 0,
    High_HID_PACKET_SIZE, 0,
    1, 0,
    USB_ENDP_DESCRIPTOR_LEN, 0,
    USB_ENDPOINT_DESCRIPTOR_TYPE, 0,
    0x01, 0,
    USB_ENDPOINT_TYPE_INTERRUPT, 0,
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
    USB_STRING_DESCRIPTOR_TYPE, 0,
    0x09, 0,
    0x04, 0
};

unsigned char const ManufacturerDescr[48] = {
    24, 0,
    USB_STRING_DESCRIPTOR_TYPE, 0,
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
    USB_STRING_DESCRIPTOR_TYPE, 0,
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
    USB_STRING_DESCRIPTOR_TYPE, 0
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
