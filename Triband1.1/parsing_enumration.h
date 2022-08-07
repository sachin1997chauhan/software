/*
 * parsing_enumration.h
 *
 *  Created on: Mar 14, 2019
 *      Author: FCS-RN5
 */

#ifndef PARSING_ENUMRATION_H_
#define PARSING_ENUMRATION_H_

enum LED
{
	red_green,
	red_steady,
	red_blink,
	green_steady,
	green_blink,
	reset_board,
}LED_STATE;

/*enum data_type
{
	MBD 	= 0,		//0
	SYS 	= 1,
	CALIB	= 2,
	HUMP	= 3,
	RESP	= 4,
	UPDATE	= 5,
}REQUEST_1;

enum response_type
{
	MAIN_BOARD,
	SYSTEM_DEATILS,
}RESPONSE_GUI;

enum get_or_set
{
	APPLY,
	RESPOND,
}DATA_TYPE;*/


/*enum band_decider
{
	BAND1 = 0,
	BAND2 = 1,
	BAND3 =	2,
	BAND4 =	3,
}BAND_TYPE;*/

/*enum hump_number
{
	HUMP1 = 0,
	HUMP2 = 1,
	HUMP3 = 2,
	HUMP4 = 3,
	HUMP5 = 4,
}HUMP_COUNT;*/

enum command_list
{
	/*							all band 1 criteria									*/
	get_system_detail,
	set_system_detail,

	get_band1_detail,
	set_band1_detail,

	get_band1_calib_detail,
	set_band1_calib_uplink,
	set_band1_calib_downlink,

	get_band1_hump1_detail,
	set_band1_hump1_detail,

	get_band1_hump2_detail,
	set_band1_hump2_detail,

	get_band1_hump3_detail,
	set_band1_hump3_detail,

	get_band1_hump4_detail,
	set_band1_hump4_detail,

	get_band1_hump5_detail,
	set_band1_hump5_detail,

	/*							all band 2 criteria									*/
	get_band2_detail,
	set_band2_detail,

	get_band3_detail,
	set_band3_detail,

	get_band4_detail,
	set_band4_detail,

	get_band2_hump1_detail,
	set_band2_hump1_detail,

	get_band2_hump2_detail,
	set_band2_hump2_detail,

	get_band2_hump3_detail,
	set_band2_hump3_detail,

	get_band2_hump4_detail,
	set_band2_hump4_detail,

	get_band2_hump5_detail,
	set_band2_hump5_detail,

	get_band3_hump1_detail,
	set_band3_hump1_detail,

	get_band3_hump2_detail,
	set_band3_hump2_detail,

	get_band3_hump3_detail,
	set_band3_hump3_detail,

	get_band3_hump4_detail,
	set_band3_hump4_detail,

	get_band3_hump5_detail,
	set_band3_hump5_detail,

	get_band4_hump1_detail,
	set_band4_hump1_detail,

	get_band4_hump2_detail,
	set_band4_hump2_detail,

	get_band4_hump3_detail,
	set_band4_hump3_detail,

	get_band4_hump4_detail,
	set_band4_hump4_detail,

	get_band4_hump5_detail,
	set_band4_hump5_detail,

	get_modem_detail,
	set_modem_detail,

	get_maintenance,
	set_maintenance,

	get_alarm_detail,
	set_alarm_detail,
}COMMANDS;

#endif /* PARSING_ENUMRATION_H_ */
