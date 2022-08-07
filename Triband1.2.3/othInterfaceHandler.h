/*
 * othInterfaceHandler.h
 *
 *  Created on: Dec 1, 2020
 *      Author: frogcell
 */

#ifndef TRIBAND1_2_3_OTHINTERFACEHANDLER_H_
#define TRIBAND1_2_3_OTHINTERFACEHANDLER_H_
#include "definitions.h"

void fpga_reset(void);
void   LedBlink();

void init_hardware();
void init_var();
void init_usb();
void read_eeprom_data(void);
void SendString(char *pcStr);
int sendToFpga(band_data *repeater_band,int band_num,int hump_num);
void write_at_shift_reg_ul(int bandNum,  short d);
void write_at_shift_reg_dl(int bandNum,  short d);
void bReset_board();
void enableTimer();
int testFPGA(int band_num);
void logdata(char data);
void logString(char *data,int len);
#endif /* TRIBAND1_2_3_OTHINTERFACEHANDLER_H_ */
