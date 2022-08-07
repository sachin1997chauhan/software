/*
 * peripheral.h
 *
 *  Created on: Mar 6, 2019
 *      Author: FCS-RN5
 */

#ifndef PERIPHERAL_H_
#define PERIPHERAL_H_

#include <stdbool.h>
#include <stdint.h>
#include "inc/hw_memmap.h"
#include "driverlib/gpio.h"
//struct ad9361_rf_phy  *ad9361_phy;
#include "ad9361_api.h"
#include "driverlib/sysctl.h"

#include "main.h"
/*
#include "parsing_enumration.h"
#include "stracture_all.h"
#include "user_interface_recieve.h"
*/

#define PA_GSM 1
#define PA_UMTS 1
#define PA_DCS1 1
#define PA_DCS2 1

int pa_uplink_onoff(bool onoff, int par_1);
int pa_downlink_onoff(bool onoff, int par_1);

//int ad9361_uplink_attn(int attn_value, int32_t channel, struct ad9361_rf_phy  *ad9361_phy);
//int ad9361_dpwnlink_attn(int attn_value, int32_t channel, struct ad9361_rf_phy  *ad9361_phy);


int umts_pa_uLdL_onoff(bool uponn, bool dlonn);
int dcs_pa_uLdL_onoff(bool uponn, bool dlonn);
int dcs2_pa_uLdL_onoff(bool uponn, bool dlonn);
/*
int UMTS_AD_UPLINK_ATTN(int attn_value);
int UMTS_AD_DOWNLINK_ATTN(int attn_value);
int DCS1_AD_UPLINK_ATTN(int attn_value);
int DCS1_AD_DOWNLINK_ATTN(int attn_value);
int DCS2_AD_UPLINK_ATTN(int attn_value);
int DCS2_AD_DOWNLINK_ATTN(int attn_value);
*/
void fpga_reset(void);

#endif /* PERIPHERAL_H_ */
