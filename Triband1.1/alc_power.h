/*
 * alc_power.h
 *
 *  Created on: Mar 8, 2019
 *      Author: FCS-RN5
 */

#ifndef ALC_POWER_H_
#define ALC_POWER_H_

#include <stdint.h>
#include <string.h>
#include "ad9361.h"
#include "main.h"
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

int output_power_uplink(adc_count_band* repeter_power_uplink_onboard, band* repeter_power_uplink,  struct ad9361_rf_phy *phy);
int input_power_uplink(adc_count_band* repeter_power_uplink_onboard, band* repeter_power_uplink, struct ad9361_rf_phy *phy) ;

int output_power_downlink( adc_count_band* repeter_power_downlink_onboard ,band* repeter_power_downlink,  struct ad9361_rf_phy *phy);
int input_power_downlink(adc_count_band* repeter_power_downlink_onboard ,band* repeter_power_downlink,  struct ad9361_rf_phy *phy);

uint16_t AUU_UPDATE_UPLINK(uint32_t pui32ADCwhile, adc_count_band* repeter_uplink);
uint16_t AUU_UPDATE_DOWNLINK(uint32_t pui32ADCwhile, adc_count_band* repeter_downlink);

int apply_alc_downlink(adc_count_band* alc_power_downlink_onboard, band* alc_power_downlink,  int bandType, struct ad9361_rf_phy *phy);
int apply_alc_uplink(adc_count_band* alc_power_uplink_onboard, band* alc_power_uplink,   int bandType,struct ad9361_rf_phy *phy);
#endif /* ALC_POWER_H_ */
