/*
 * stracture_function.h
 *
 *  Created on: Dec 25, 2017
 *      Author: RND11
 */

#ifndef PSEUDO_ICS_4AD_GUI_V2_TEST_RELESED_11_STRACTURE_ALL_H_
#define PSEUDO_ICS_4AD_GUI_V2_TEST_RELESED_11_STRACTURE_ALL_H_

#define adc_clb 31
#include <stdbool.h>
#include "parsing_enumration.h"


typedef enum _ebandType{
    GSM_BAND1,
    GSM_BAND2,
    GSM_BAND3,
    UMTS_BAND1,
    UMTS_BAND2,
    UMTS_BAND3,
    DCS1_BAND1,
    DCS1_BAND2,
    DCS1_BAND3,
    DCS2_BAND1,
    DCS2_BAND2,
    DCS2_BAND3,

}ebandType;


typedef struct {
	char * main_header;
	enum command_list COMMANDS;
	char protocol_version[5];
	char serial_number[15];
}header;

typedef struct _hump{
	bool hump_on_off;
	int hump_id;
	int32_t center_freq_downlink;
	int32_t center_freq_uplink;
	int32_t downlink_comp,downlink_attn,uplink_comp, uplink_attn;
	int32_t start_channel;
	int32_t stop_channel;
	int32_t saw_bandwidth;
}hump;

typedef struct _modem{
	char  LAC[10];
	char  CELL[10];
	char  IP[16];
	char  APN[10];
	char  PORT[10];
	char  IMEI[16];
}modem;

typedef struct _system_details{
	char system_name[20];
	char region_name[20];
	char part_number[20];
	char site_name[20];
	char site_address[20];
	char latitude[10];
	char longitude[10];
	char caretaker_number[10];
	//modem modem_details;
}system_details;


typedef struct _repeter_power{
//	char band_name;
	int32_t uplink_power_input;
	int32_t uplink_power_output;
	int32_t downlink_power_input;
	int32_t downlink_power_output;
}repeter_power;
typedef struct{
    /*
     * adc_up:  The ADC value list noted for the uplink path of the repeter
     * adc_down: The ADC value list noted for the downlink path of the repeter
     */
    int32_t adc_up[32], adc_down[32];
    /*
     * uplink_final: final attenuation that has to be applied to the uplink path
     * downlink_final: final attenuation that has to be applied to the downlink path
     */
    int32_t uplink_final, downlink_final;
    /*
     * test_counter: just a counter to see if test mode is turned off after being used
     */
    int test_counter;

}adc_count_band;
typedef struct {

	ebandType bandType;

	bool lo_enable_disable;
	bool alc_on_off;
	bool PA_auto_on_off;
	bool PA_downlink, PA_uplink;
	bool Testing_Mode;

	int total_hump;
	int calib_max_uplink, calib_max_downlink;

	int32_t alc_downlink_level, alc_uplink_level;

	int32_t auto_scale_downlink, auto_scale_uplink;

	int32_t offset_downlink, offset_uplink;

	int32_t comp_attn_downlink_DCA, comp_attn_downlink_AD;
	int32_t attn_downlink_DCA, attn_downlink_AD;

	int32_t comp_attn_uplink_DCA, comp_attn_uplink_AD;
	int32_t attn_uplink_DCA, attn_uplink_AD;

	int32_t Gain_downlink, Gain_uplink;

	int32_t Gain_set_downlink, Gain_set_uplink;

	uint64_t Central_frequency_downlink, Central_frequency_uplink;
	uint64_t start_frequency, stop_frequency;
	/*
	 * data of hump within repeater structure
	 */
	hump repHump[5];
	/*
	 * this structure stores the data of all repeter in form of
	 * uplink input/ output
	 * and
	 * downlink input/ output
	 */
	repeter_power power;
	//system_details sys_detail;
	//modem *modem_detail;
	adc_count_band adc_count_var;
}band;


/*
typedef struct {
	repeter REPETER_1, REPETER_2, REPETER_3, REPETER_4;
	system_details SYSTEM1;
}complete_data;
*/
typedef struct {
    band repeater_band[4];//max band on triband dcs1 and dcs2 are separate

    system_details sys_detail;
}repeater_board;
#endif /* PSEUDO_ICS_4AD_GUI_V2_TEST_RELESED_11_STRACTURE_ALL_H_ */
