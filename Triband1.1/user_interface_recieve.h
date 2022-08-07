/*
 * user_interface_recieve.h
 *
 *  Created on: Mar 13, 2019
 *      Author: FCS-RN5
 */

#ifndef USER_INTERFACE_RECIEVE_H_
#define USER_INTERFACE_RECIEVE_H_

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
#include "main.h"



/*extern repeter repeter1,repeter2,repeter3, repeter4;
extern system_details system1;*/
extern header HEAD;
//extern complete_data COMPLETE_DATA;
extern void SendCharUSB(uint8_t *send);

int string_parsing(uint8_t *parameter_passed,struct ad9361_rf_phy *phy);
void Send_char_usb(uint8_t *reply_data, int size_n);
char* call_parser(int j, char a, char *str);

int sys_details_set(system_details * system_set, uint8_t *str);
uint8_t* sys_details_get(system_details * system_set);

int applying_data_board(adc_count_band * repeter_program_onboard, band* repeter_program, uint8_t *buffer_board_apply, int band_type, struct ad9361_rf_phy *phy);
uint8_t *response_repeter(band* repeter_response);

int sys_hump_set(hump* hump_program, uint8_t *str);
uint8_t * sys_hump_get(hump* hump_program);

int system_calibration_uplink(adc_count_band* repeter_calbration_onboard, band* repeter_calibration, struct ad9361_rf_phy *phy);
int system_calibration_downlink(adc_count_band* repeter_calbration_onboard, band* repeter_calibration, struct ad9361_rf_phy *phy);
uint8_t * calibration_get(band* calibration_get_data);

int usb_string_sender(uint8_t * sending_data);


//int32_t read_eeprom_system(system_details* reading_system, int32_t address);
#endif /* USER_INTERFACE_RECIEVE_H_ */
