/*
 * adHandler.h
 *
 *  Created on: Nov 19, 2020
 *      Author: frogcell
 */

#ifndef TRIBAND1_2_3_ADHANDLER_H_
#define TRIBAND1_2_3_ADHANDLER_H_


#include "ad9361_api.h"
#include <stdbool.h>
#include <stdint.h>


#define UPLINK_DCS1         1747500000UL     /*repeter3.    */
#define DOWNLINK_DCS1       1842500000UL    /*  */

#define UPLINK_DCS2         1747500000UL    /*  */
#define DOWNLINK_DCS2       1842500000UL    /*  */

//#define DOWNLINK_GSM       947500000        /*  */
//#define UPLINK_GSM         902500000        /*  */
#define DOWNLINK_GSM    942500000
#define UPLINK_GSM      897500000  //if not manual then set this other wise ul or dl 4321 then vco fail

#define UPLINK_WCDMA         1950000000     /*  */
#define DOWNLINK_WCDMA       2140000000     /*  */


int set_local_oscillator_downlink(uint64_t central_downlink_freq,  int bandnumind0);
int set_local_oscillator_uplink(uint64_t central_uplink_freq,  int bandnumind0);
//int set_local_oscillator(uint64_t central_downlink_freq,int par_1 , uint64_t central_uplink_freq, int par_2);
int32_t init_all_AD();
int read_ad_power_ul(int32_t *powerval,  int bandnumind0);
int read_ad_power_dl(int32_t *powerval,  int bandnumind0);
int set_ad_att_ul(int32_t attainval,  int bandnumind0);
int set_ad_att_dl(int32_t attainval,  int bandnumind0);
int ad_ctrl_mode_ul(int bandnumind0,int Mode);
int ad_ctrl_mode_dl(int bandnumind0,int Mode) ;
int set_rx_gain_uplink(int bandnumind0,int32_t gainval );
int set_rx_gain_downlink(int bandnumind0,int32_t gainval );
int set_lo_freq(struct ad9361_rf_phy *phy, uint64_t central_uplink_freq,int tx);
#endif /* TRIBAND1_2_3_ADHANDLER_H_ */
