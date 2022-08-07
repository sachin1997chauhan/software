/*
 * systemFunctions.h
 *
 *  Created on: Nov 16, 2020
 *      Author: frogcell
 */

#ifndef TRIBAND1_2_3_SYSTEMFUNCTIONS_H_
#define TRIBAND1_2_3_SYSTEMFUNCTIONS_H_

#include "definitions.h"
int set_band_info(int bandNum,band_data *bd);
int get_band_info(int bandNum,band_data *bd);
int set_hump_info(int bandNum);
int get_hump_info(int bandNum,int humpNum,hump_data **hd);

int set_system_info(system_details *sysdet);
int get_system_info(system_details *sysdet);
int set_modem_info(modem *modInfo);
int get_modem_info(modem *modInfo);
int set_fpga_param(band_data *repeater_band,int band_num,int hump_num);
int get_fpga_param(int fpgaNumber);
int get_calibration_uplink(int bandnum,uint16_t* calibration_get_data);
int get_calibration_downlink(int bandnum,uint16_t* calibration_get_data);
int stringToStruct(int dataType, char *str,void *Outstruct);
int convertToString(int dataType,void *data,char *part_num,char *dataar,int *len);
int set_calib_info(int bandNum,band_data *bd);
#endif /* TRIBAND1_2_3_SYSTEMFUNCTIONS_H_ */
