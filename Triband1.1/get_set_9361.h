/*
 * set_get_9361.h
 *
 *  Created on: Mar 7, 2019
 *      Author: FCS-RN5
 */

#ifndef GET_SET_9361_H_
#define GET_SET_9361_H_

#include "ad9361_api.h"
#include <stdbool.h>
#include <stdint.h>
#include "inc/hw_memmap.h"
#include "driverlib/gpio.h"
#include "driverlib/sysctl.h"
#include "main.h"
/*#include "errors.h"*/

struct ad9361_rf_phy  *ad9361_phy[8];

#define done 0
int set_local_oscillator_downlink(uint64_t central_downlink_freq, struct ad9361_rf_phy *phy);
int set_local_oscillator_uplink(uint64_t central_uplink_freq, struct ad9361_rf_phy *phy);
//int set_local_oscillator(uint64_t central_downlink_freq,int par_1 , uint64_t central_uplink_freq, int par_2);
int set_lo_umts(uint64_t central_downlink_freq, uint64_t central_uplink_freq);
int set_lo_dcs1(uint64_t central_downlink_freq, uint64_t central_uplink_freq);
int set_lo_dcs2(uint64_t central_downlink_freq, uint64_t central_uplink_freq);

#endif /* GET_SET_9361_H_ */
