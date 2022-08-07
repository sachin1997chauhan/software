/*
 * paHandler.h
 *
 *  Created on: Nov 19, 2020
 *      Author: frogcell
 */

#ifndef TRIBAND1_2_3_PAHANDLER_H_
#define TRIBAND1_2_3_PAHANDLER_H_


#include <stdint.h>
#include "definitions.h"
#define PA_GSM 1
#define PA_UMTS 1
#define PA_DCS1 1
#define PA_DCS2 1

int pa_uplink_onoff(bool onoff, int par_1);
int pa_downlink_onoff(bool onoff, int par_1);

//int ad9361_uplink_attn(int attn_value, int32_t channel, struct ad9361_rf_phy  *ad9361_phy);
//int ad9361_dpwnlink_attn(int attn_value, int32_t channel, struct ad9361_rf_phy  *ad9361_phy);
int configure_pa(band_data* band);
int check_pa_uplink_alarm(band_data* band);
int check_pa_downlink_alarm(band_data* band);
int check_pa_uplink_pwr(band_data* band);
int check_pa_downlink_pwr(band_data* band);
int umts_pa_uLdL_onoff(bool uponn, bool dlonn);
int dcs_pa_uLdL_onoff(bool uponn, bool dlonn);
int dcs2_pa_uLdL_onoff(bool uponn, bool dlonn);




#endif /* TRIBAND1_2_3_PAHANDLER_H_ */
