/*
 * user_interface_recieve.h
 *
 *  Created on: Mar 13, 2019
 *      Author: FCS-RN5
 */

#ifndef TRIBAND1_2_3_USER_INTERFACE_RECIEVE_H_
#define TRIBAND1_2_3_USER_INTERFACE_RECIEVE_H_

#include <string.h>
#include <stdlib.h>
#include <stdint.h>
/*
#include "parsing_enumration.h"
#include "get_set_9361.h"
#include "stracture_all.h"
#include "peripheral.h"
#include "errors.h"
#include "driverlib/sysctl.h"
#include "driverlib/eeprom.h"
#include "storing_reading_data.h"
#include "define_files.h"
*/
#include "definitions.h"
#include "ad9361.h"


/*extern repeter repeter1,repeter2,repeter3, repeter4;
extern system_details system1;*/
extern header HEAD;
//extern complete_data COMPLETE_DATA;
extern void SendCharUSB(uint8_t *send);

int parse_string();
void Send_char_usb(uint8_t *reply_data, int size_n);
char* call_parser(int j, char a, char *str);


int applying_data_board(final_attn_band * repeter_program_onboard, band_data* repeter_program,  int band_num);
uint8_t *response_repeter(band_data* repeter_response);


int system_calibration_uplink( band_data* repeter_calibration, int bandnum);
int system_calibration_downlink( band_data* repeter_calibration, int bandnum);


int usb_string_sender(uint8_t * sending_data,int len);


//int32_t read_eeprom_system(system_details* reading_system, int32_t address);
#endif /* TRIBAND1_2_3_USER_INTERFACE_RECIEVE_H_ */
