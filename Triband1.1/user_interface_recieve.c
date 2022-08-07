/*
 * user_interface_recieve.c
 *
 *  Created on: Mar 13, 2019
 *      Author: FCS-RN5
 */
#include "user_interface_recieve.h"
#include "driverlib/sysctl.h"

char data_new[1800];
int32_t data_new_conter = 0;
extern repeater_board gTriband_board;
/*
 * j : the value of counter from which the function will start countingfurther for parameter
 * a : the character to be searched within the string
 * *str: the real string that has to be parsed for fetching the data within
 *
 * returns pointer to the parsed data in *char format to the first location of it
 */
char* call_parser(int j, char a, char *str)
{
	int counter = 0;
	while(!(str[j+1]>= 'a' && str[j+1]<= 'z'))
	{
		counter++;
		j++;
	}
	char * dest = malloc(counter);
	char * new = strchr(str, a);
	new++;
	strncpy(dest, new, counter);
	free(new);
	return &dest[0];
}

void Send_char_usb(uint8_t *reply_data, int size_n)
{
	int loop =0 ;
	while(size_n >= 0)
	{
		SendCharUSB(&reply_data[loop*64]);
		size_n -=64;
		loop++;
		if(size_n <= 0)
			break;
	}
	free(reply_data);
}



/*
 * parameter_passed: the string that has been recieved from the GUI
 *
 * returns 0 if sucessfull
 * 				else error codes with negative sign
 */
int string_parsing(uint8_t *parameter_passed,struct ad9361_rf_phy *phy)
 {
	memcpy(&HEAD, &parameter_passed[0], sizeof(HEAD));
	switch (COMMANDS) {
	case get_system_detail:
		Send_char_usb(sys_details_get(&gTriband_board.sys_detail), (sizeof(HEAD)+sizeof(gTriband_board.sys_detail)));
		free(parameter_passed);
		break;

	case set_system_detail:
		sys_details_set(&gTriband_board.sys_detail, &parameter_passed[0]);
		free(parameter_passed);
		break;

	case get_band1_calib_detail:

	case set_band1_calib_uplink:
		system_calibration_uplink(&gTriband_board.repeater_band[0].adc_count_var, &gTriband_board.repeater_band[0],  phy);
		free(parameter_passed);
		break;

	case set_band1_calib_downlink:
		system_calibration_downlink(&gTriband_board.repeater_band[0].adc_count_var, &gTriband_board.repeater_band[0], phy);
		free(parameter_passed);
		break;

	case get_band1_detail:
		SendCharUSB(response_repeter(&gTriband_board.repeater_band[0]));
		free(parameter_passed);
		break;

	case set_band1_detail:
		applying_data_board(&gTriband_board.repeater_band[0].adc_count_var, &gTriband_board.repeater_band[0],
				&parameter_passed[0], GSM_BAND1, phy);
		free(parameter_passed);
		break;

	case get_band1_hump1_detail:
		SendCharUSB(sys_hump_get(&gTriband_board.repeater_band[0].repHump[0]));
		free(parameter_passed);
		break;

	case set_band1_hump1_detail:
		sys_hump_set(&gTriband_board.repeater_band[0].repHump[0],&parameter_passed[0]);
		free(parameter_passed);
		break;

	case get_band1_hump2_detail:
		SendCharUSB(sys_hump_get(&gTriband_board.repeater_band[0].repHump[1]));
		free(parameter_passed);
		break;

	case set_band1_hump2_detail:
		sys_hump_set(&gTriband_board.repeater_band[0].repHump[1],&parameter_passed[0]);
		free(parameter_passed);
		break;

	case get_band1_hump3_detail:
		SendCharUSB(sys_hump_get(&gTriband_board.repeater_band[0].repHump[2]));
		free(parameter_passed);
		break;

	case set_band1_hump3_detail:
		sys_hump_set(&gTriband_board.repeater_band[0].repHump[2],&parameter_passed[0]);
		free(parameter_passed);
		break;

	case get_band1_hump4_detail:
		SendCharUSB(sys_hump_get(&gTriband_board.repeater_band[0].repHump[3]));
		free(parameter_passed);
		break;

	case set_band1_hump4_detail:
		sys_hump_set(&gTriband_board.repeater_band[0].repHump[3],&parameter_passed[0]);
		free(parameter_passed);
		break;

	case get_band1_hump5_detail:
		SendCharUSB(sys_hump_get(&gTriband_board.repeater_band[0].repHump[4]));
		free(parameter_passed);
		break;

	case set_band1_hump5_detail:
		sys_hump_set(&gTriband_board.repeater_band[0].repHump[4],&parameter_passed[0]);
		free(parameter_passed);
		break;

/*	case get_band2_detail:
		response_repeter(&COMPLETE_DATA.REPETER_2);
		free(parameter_passed);
		break;

	case set_band2_detail:
		applying_data_board(&repeter2, &COMPLETE_DATA.REPETER_2,
				&parameter_passed[0], gsm_par_1, gsm_par_2);
		free(parameter_passed);
		break;

	case get_band3_detail:
		buffer = malloc(sizeof(HEAD) + sizeof(COMPLETE_DATA.REPETER_3));
		memcpy(&buffer[0], (uint8_t*) &HEAD, sizeof(HEAD));
		memcpy(&buffer[sizeof(HEAD)], (uint8_t*) &COMPLETE_DATA.REPETER_3,
				sizeof(COMPLETE_DATA.REPETER_3));
		free(parameter_passed);
		break;

	case set_band3_detail:
		memcpy(&COMPLETE_DATA.REPETER_3, &parameter_passed[sizeof(HEAD)],
				sizeof(COMPLETE_DATA.REPETER_3));
		free(parameter_passed);
		break;

	case get_band4_detail:
		buffer = malloc(sizeof(HEAD) + sizeof(COMPLETE_DATA.REPETER_4));
		memcpy(&buffer[0], (uint8_t*) &HEAD, sizeof(HEAD));
		memcpy(&buffer[sizeof(HEAD)], (uint8_t*) &COMPLETE_DATA.REPETER_4,
				sizeof(COMPLETE_DATA.REPETER_4));
		free(buffer);
		break;

	case set_band4_detail:
		memcpy(&COMPLETE_DATA.REPETER_4, &parameter_passed[sizeof(HEAD)],
				sizeof(COMPLETE_DATA.REPETER_4));
		free(parameter_passed);
		break;*/
	}
	return 0;
}

uint8_t * calibration_get(band* calibration_get_data)
{
	uint8_t * calib_buffer = malloc(
			sizeof(HEAD) + 2*sizeof(int));
	memcpy(&calib_buffer[0], &HEAD, sizeof(HEAD));
	memcpy(&calib_buffer[sizeof(HEAD)],
			&calibration_get_data->calib_max_downlink,
			sizeof(calibration_get_data->calib_max_downlink));
	memcpy(
			&calib_buffer[sizeof(HEAD)
					+ sizeof(calibration_get_data->calib_max_downlink)],
			&calibration_get_data->calib_max_uplink,
			sizeof(calibration_get_data->calib_max_uplink));
	return &calib_buffer[0];
}

/*
 * repeter_calbration_onboard : this is the on board structure
 * 								 which contains the variables that are
 * 								 required to control the on board operation of the repeter.
 * repeter_calibration: repeter structure to be edited
 * par_1: 	notation of AD in terms of controlling
 * par_2:	notation of AD in terms of controlling
 */
int system_calibration_uplink(adc_count_band* repeter_calbration_onboard, band* repeter_calibration, struct ad9361_rf_phy *phy)
 {
	int32_t calibration_counter = 0, return_counter = 0;

	for (calibration_counter = 0; calibration_counter <= 31;
			calibration_counter++) {
		//return_counter += AD_UPLINK_ATTN(calibration_counter, par_1, par_2);
	    return_counter+=ad9361_set_tx_attenuation(phy, 1,calibration_counter);
		SysCtlDelay(5000);
		ad9361_spi_write(phy->spi, 0x158, 240);
		SysCtlDelay(1 * 16000000);
		repeter_calbration_onboard->adc_up[calibration_counter] =
				ad9361_spi_read(phy->spi, 0x1A9);
		SysCtlDelay(5000);
	}
	if (return_counter > 0) {
		return return_counter;
	} else {
		return -error_5;
	}
}

/*
 * repeter_calbration_onboard : this is the on board structure
 * 								 which contains the variables that are
 * 								 required to control the on board operation of the repeter.
 * repeter_calibration: repeter structure to be edited
 * par_1: 	notation of AD in terms of controlling
 * par_2:	notation of AD in terms of controlling
 */
int system_calibration_downlink(adc_count_band* repeter_calbration_onboard, band* repeter_calibration, struct ad9361_rf_phy *phy)
 {
	int32_t calibration_counter = 0, return_counter = 0;
	for (calibration_counter = 0; calibration_counter <= 31;
			calibration_counter++) {
		//return_counter += AD_DOWNLINK_ATTN(calibration_counter, par_1, par_2);
	    return_counter +=ad9361_set_tx_attenuation(phy, 1,calibration_counter);
		SysCtlDelay(5000);
		ad9361_spi_write(phy->spi, 0x158, 240);
		SysCtlDelay(16000000);
		repeter_calbration_onboard->adc_down[calibration_counter] =
				ad9361_spi_read(phy->spi, 0x1A9);
		SysCtlDelay(5000);
	}
	if (return_counter > 0) {
		return return_counter;
	} else {
		return -error_5;
	}
}

/*
 * this is more likely a response data function whose values are passed form the deciscion making function
 *
 * repeter* repeter_response: the data for the repeter that has to send to the GUI
 * BAND TYPE enum: this is just to fill the blanks for identifier in the GUI data response
 *
 * returns: uint8_t * to the response string
 * 					advised to free the uint8_t* response_data after use
 */

uint8_t *response_repeter(band* repeter_response)
{
	uint8_t *buffer_repeter = malloc(sizeof(HEAD) + sizeof(repeter_response));
	memcpy(&buffer_repeter[0], &HEAD,sizeof(HEAD));
	memcpy(&buffer_repeter[sizeof(HEAD)], &repeter_response, sizeof(repeter_response));
	return(&buffer_repeter[0]);
}


/*
 * repeter_program: repeter structure that has to evolved or changed into
 * *str: the string that was recieved from the GUI
 * j: the conter value from which the data is to be fetched from
 */
int applying_data_board(adc_count_band * repeter_program_onboard, band* repeter_program, uint8_t *buffer_board_apply, int bandType, struct ad9361_rf_phy *phy)
 {
	memcpy(&repeter_program, &buffer_board_apply[sizeof(HEAD)],
			sizeof(repeter_program));
	int32_t reply = 0;

	reply += set_local_oscillator_downlink(
			repeter_program->Central_frequency_downlink, phy);

	reply += set_local_oscillator_downlink(
			repeter_program->Central_frequency_uplink, phy);

	repeter_program_onboard->uplink_final =
			repeter_program->comp_attn_uplink_DCA
					+ repeter_program->comp_attn_uplink_AD
					+ repeter_program->attn_uplink_AD
					+ repeter_program->attn_uplink_DCA
					+ (repeter_program->Gain_set_uplink
							- repeter_program->Gain_uplink);

//	reply += AD_UPLINK_ATTN(repeter_program_onboard->uplink_final, par_1,par_2);
	reply +=ad9361_set_tx_attenuation(phy, 1,repeter_program_onboard->uplink_final);
	repeter_program_onboard->downlink_final =
			repeter_program->comp_attn_downlink_DCA
					+ repeter_program->comp_attn_downlink_AD
					+ repeter_program->attn_downlink_AD
					+ repeter_program->attn_downlink_DCA
					+ (repeter_program->Gain_set_downlink
							- repeter_program->Gain_downlink);

	//reply += AD_DOWNLINK_ATTN(repeter_program_onboard->downlink_final, par_1,
	//		par_2);
	reply +=ad9361_set_tx_attenuation(phy, 1,repeter_program_onboard->downlink_final);//pass another ad adress
	reply += pa_uplink_onoff(repeter_program->PA_uplink, bandType);
	reply += pa_downlink_onoff(repeter_program->PA_downlink, bandType);
	if((repeter_program->Testing_Mode) && (repeter_program_onboard->test_counter != 1))
	{
		ad9361_set_rx_gain_control_mode(ad9361_phy[1], 1, 0);
		SysCtlDelay(2000);
		ad9361_set_rx_rf_gain(ad9361_phy[1], 1, 70); //70//74
		SysCtlDelay(1000);
		ad9361_set_tx_attenuation(ad9361_phy[1], 1, 20);
		SysCtlDelay(2000);
		repeter_program_onboard->test_counter = 1;
	}
	else if((repeter_program_onboard->test_counter == 1)&&(repeter_program->Testing_Mode == false))
	{
		LED_STATE = reset_board;
	}

	return reply;
}


/*
 * hump_program: pass the hump that is to be configured;
 * str : uint8_t string that is used to program the hump
 * 				this is provided by the GUI to the repeter
 */
int sys_hump_set(hump* hump_program, uint8_t* str)
 {
	memcpy(&hump_program, &str[sizeof(HEAD)],sizeof(hump_program));
	return 0;
 }

/*
 * hump_program: the hump that is to be get from system or board data provided to the
 * 				GUI to the board.
 */
uint8_t * sys_hump_get(hump* hump_program)
 {
	uint8_t *buffer = malloc(sizeof(HEAD)+sizeof(hump));
	memcpy(&buffer[0], (uint8_t*)&HEAD, sizeof(HEAD));
	memcpy(&buffer[sizeof(HEAD)], (uint8_t*)&hump_program, sizeof(hump));
	return (&buffer[0]);
}

/*
 * parser_counter:	counter from which the data fetching is to be initiated
 * *str:	the string from which the data is to fetched
 */
int sys_details_set(system_details * system_set, uint8_t *str)
 {
	memcpy(&system_set, &str[sizeof(HEAD)],sizeof(system_set));
	return 0;
 }

uint8_t* sys_details_get(system_details * system_set)
{
	uint8_t *buffer = malloc(sizeof(HEAD)+sizeof(system_set));
	memcpy(&buffer[0], (uint8_t*)&HEAD, sizeof(HEAD));
	memcpy(&buffer[sizeof(HEAD)], (uint8_t*)&system_set, sizeof(system_set));
	return (&buffer[0]);
}

int usb_string_sender(uint8_t * sending_data)
 {
	uint8_t *flowing_data_usb = malloc(64);
	memset(flowing_data_usb, '\0', 64);
	char * breaker;
	int frames = 0, rem = 0, total = 0, i_counter = 0, packet = 0;
	char adder[] = "\r";
	strcat((char*)sending_data, adder);
	total = strlen((char*)sending_data);
	frames = total / 64;
	rem = total % 64;
	if (rem != 0) {
		frames += 1;
	} else {

		for (i_counter = 0; i_counter < frames; i_counter++) {
			breaker = strstr((char*)sending_data, (char*)&sending_data[packet * 64]);
			memmove(flowing_data_usb, breaker, 64);
			SendCharUSB(flowing_data_usb);
			packet += 1;
			SysCtlDelay(200);
		}
		goto done_state;
	}


done_state :	free(breaker);
	return 0;
}
