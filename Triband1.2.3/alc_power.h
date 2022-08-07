/*
 * alc_power.h
 *
 *  Created on: Mar 8, 2019
 *      Author: FCS-RN5
 */

#ifndef TRIBAND1_2_3_ALC_POWER_H_
#define TRIBAND1_2_3_ALC_POWER_H_

#include <stdint.h>
#include <string.h>
#include "ad9361.h"
#include "definitions.h"
/*
#include "stracture_all.h"
#include "peripheral.h"
#include "errors.h"
*/
//#include "get_set_9361.h"
/*
 * par_1: the nomenclature of AD to be affected as first TX then RX
 * 			for GSM: 	7
 * 			for UMTS:	6
 * 			for DCS1:	5
 * 			for DCS2:	3
 * par_2: the nomenclature of AD to be affected	as first RX then TX
 * 			for GSM: 	1
 * 			for UMTS:	8
 * 			for DCS1:	4
 * 			for DCS2:	2
 */
//extern repeter repeter1,repeter2,repeter3, repeter4;

//int output_power_uplink( band_data* repeter_power_uplink,  int bandnum_ind0);
//int input_power_uplink( band_data* repeter_power_uplink, int bandnum_ind0) ;

//int output_power_downlink( band_data* repeter_power_downlink, int bandnum_ind0);
//int input_power_downlink(band_data* repeter_power_downlink, int bandnum_ind0);

int16_t calculate_power(uint32_t pui32ADC0Value, int8_t base,uint16_t *ptrTemp,int *pos);


int apply_alc_downlink( band_data* rband,  int bandnum_ind0,prevPeripheralState *state);
int apply_alc_uplink( band_data* rband,  int bandnum_ind0,prevPeripheralState *state);
int record_coeff(band_data* rband,int bandnum,int ul);
#endif /* TRIBAND1_2_3_ALC_POWER_H_ */
