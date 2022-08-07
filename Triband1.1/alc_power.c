/*
 * alc_power.c
 *
 *  Created on: Mar 8, 2019
 *      Author: FCS-RN5
 */
#include "alc_power.h"

/*
 * offset_ul: offset present for the band in uplink stage
 * final_unit_uplink: higher level of agc set by the user
 * gainvalue_ul: gain in uplink set by the gui
 * comp_ul: compensation value of the boardin uplink should be zero for TRI band
 * attn_ul: the attenuated power for the board that can be set by the gui *
 *
 * returns the value of input power in int format
 */

int input_power_uplink(adc_count_band* repeter_power_uplink_onboard, band* repeter_power_uplink, struct ad9361_rf_phy *phy) {
	return ((output_power_uplink(repeter_power_uplink_onboard, repeter_power_uplink, phy))
			- (repeter_power_uplink->Gain_set_uplink						//this is set to 70
					+ repeter_power_uplink->attn_uplink_DCA
					+ repeter_power_uplink->attn_uplink_AD));
}

/*
 * offset_ul: offset present for the band in uplink stage
 * final_unit_uplink: higher level of agc set by the user
 *
 * returns the value of output power in int format
 */
int output_power_uplink(adc_count_band* repeter_power_uplink_onboard, band* repeter_power_uplink, struct ad9361_rf_phy *phy) {
	ad9361_spi_write(phy->spi, 0x158, 240);
	return (repeter_power_uplink->calib_max_uplink
			- (repeter_power_uplink->offset_uplink
					+ AUU_UPDATE_UPLINK(ad9361_spi_read(phy->spi, 0x1A9),
							repeter_power_uplink_onboard)));
}

/*
 * offset_dl: offset present for the band in downlink stage
 * final_unit_downlink: higher level of agc set by the user
 * gainvalue_dl: gain in downlink set by the gui
 * comp_dl: compensation value of the boardin downlink should be zero for TRI band
 * attn_dl: the attenuated power for the board that can be set by the gui
 *
 * returns the value of input power in int format
 */
int input_power_downlink(adc_count_band* repeter_power_downlink_onboard ,band* repeter_power_downlink,  struct ad9361_rf_phy *phy) {
	return ((output_power_downlink(repeter_power_downlink_onboard,repeter_power_downlink,  phy))
			- (repeter_power_downlink->Gain_set_downlink					//this is set to 70
					+ repeter_power_downlink->attn_downlink_DCA
					+ repeter_power_downlink->attn_downlink_AD));
}

/*
 * offset_dl: offset present for the band in downlink stage
 * final_unit_downlink: higher level of agc set by the user
 *AUU_UPDATE_2: reads the spi lines of AD to get the ADC count of power input for the particular
 *
 * returns the value of output power in int format
 */
int output_power_downlink(adc_count_band* repeter_power_downlink_onboard ,band* repeter_power_downlink,  struct ad9361_rf_phy *phy) {
	ad9361_spi_write(phy->spi, 0x158, 240);
	return (repeter_power_downlink->calib_max_downlink
			- (repeter_power_downlink->offset_downlink
					+ AUU_UPDATE_DOWNLINK(ad9361_spi_read(phy->spi, 0x1A9),
							repeter_power_downlink_onboard)));
}

/*
 * alc_gsm_downlink_level :downlink level of agc set by gui
 * pa_gsm_downlink		: PA downlink on off in boolean format
 * alc_gsm_downlink_logic	:alc downlink on off in bool format
 * auto_scale	: term of value at which output the PA will automatically turn off
 * attn_downlink	: the value of attn that is set by the user into board
 *
 * returns:
 * if alc is set then the value for the attn is returned
 * if auto level of PA is set and then the difference created in that case will be the return
 */
int apply_alc_downlink(adc_count_band* alc_power_downlink_onboard, band* alc_power_downlink, int bandType, struct ad9361_rf_phy *phy) {

	char * alc_downlink_response = strdup("");
	int total_calculation=0;
	alc_power_downlink->power.downlink_power_output = output_power_downlink(alc_power_downlink_onboard,
			alc_power_downlink, phy);
	alc_power_downlink->power.downlink_power_input = input_power_downlink(alc_power_downlink_onboard,
			alc_power_downlink, phy);

	if (alc_power_downlink->PA_auto_on_off) {
		if (alc_power_downlink->power.downlink_power_output
				> (alc_power_downlink->auto_scale_downlink - 15)) {
			alc_power_downlink->PA_auto_on_off = false;
			pa_downlink_onoff(true, bandType);
		} else {
		    pa_downlink_onoff(false, bandType);
			return -error_3;
		}
	}

	if (alc_power_downlink->PA_downlink) {
		switch (alc_power_downlink->alc_on_off) {
		case true: {
			/*
			 * a case in which alc is ON but PA is turned off
			 * in that case nothing is to be done at all ust return 0;
			 */
			if ((alc_power_downlink->PA_auto_on_off == false)
					&& (alc_power_downlink->power.downlink_power_output
							> alc_power_downlink->auto_scale_downlink)) {
				pa_downlink_onoff(false, bandType);
				return -error_3;
			}

			/*
			 * else if alc is ON and PA is ON then first check if it is greater than the alc set value or not
			 * also keep checking for the point that the level has not reached the desired auto PA operation level
			 * if the alc value is less than the output power the it needs to be attenuated for this
			 * the attenuation value is calculated by
			 * output_power - (alc_level + total attenuation set for the band without including the compensation)
			 */
			else if ((alc_power_downlink->alc_downlink_level
					> alc_power_downlink->power.downlink_power_output)
					&& (alc_power_downlink->power.downlink_power_output
							< alc_power_downlink->auto_scale_downlink)) {

				alc_power_downlink->attn_downlink_DCA =
						alc_power_downlink->power.downlink_power_output
								- alc_power_downlink->alc_downlink_level;
				/*
				 * just a case in which we have the alc attn greater than 31 in that case we are required to switch it too other block
				 * for purpose of GUI and showing
				 */
				if (alc_power_downlink->attn_downlink_DCA > 31) {
					alc_power_downlink->attn_downlink_AD =
							alc_power_downlink->attn_downlink_DCA - 31;
					alc_power_downlink->attn_downlink_DCA = 31;
				} else {
					alc_power_downlink->attn_downlink_AD = 0;
				}
				total_calculation=alc_power_downlink->attn_downlink_DCA+ alc_power_downlink->attn_downlink_AD
                        + alc_power_downlink->comp_attn_downlink_DCA+ alc_power_downlink->comp_attn_downlink_AD
                        +(alc_power_downlink->Gain_set_downlink- alc_power_downlink->Gain_downlink);
				 ad9361_set_tx_attenuation(phy, 1,total_calculation);
				 return 0;
				//return (AD_DOWNLINK_ATTN(par_1, par_2));
				/*return (alc_power_downlink->power.downlink_power_output
				 - (alc_power_downlink->alc_downlink_level
				 + alc_power_downlink->comp_attn_downlink_DCA
				 + alc_power_downlink->comp_attn_downlink_AD));*/
			} else {
				return -error_2;
			}
		}
		default: {
			alc_power_downlink->attn_downlink_DCA = 0;
			alc_power_downlink->attn_downlink_AD = 0;
            total_calculation=alc_power_downlink->attn_downlink_DCA+ alc_power_downlink->attn_downlink_AD
                                  + alc_power_downlink->comp_attn_downlink_DCA+ alc_power_downlink->comp_attn_downlink_AD
                                  +(alc_power_downlink->Gain_set_downlink - alc_power_downlink->Gain_downlink);
			 ad9361_set_tx_attenuation(phy, 1,total_calculation);
			//return (AD_DOWNLINK_ATTN(
			//		(alc_power_downlink->attn_downlink_DCA
			//				+ alc_power_downlink->attn_downlink_AD
			//				+ alc_power_downlink->comp_attn_downlink_DCA
			//				+ alc_power_downlink->comp_attn_downlink_AD
			//				+(alc_power_downlink->Gain_set_downlink - alc_power_downlink->Gain_downlink)), par_1,
			//		par_2));

			/*return (alc_power_downlink->power.downlink_power_output
			 - (alc_power_downlink->alc_downlink_level
			 + alc_power_downlink->comp_attn_downlink_DCA
			 + alc_power_downlink->comp_attn_downlink_AD));*/
		}
		}
	} else {
        total_calculation=alc_power_downlink->attn_downlink_DCA
                              + alc_power_downlink->attn_downlink_AD
                              + alc_power_downlink->comp_attn_downlink_DCA
                              + alc_power_downlink->comp_attn_downlink_AD
                              +(alc_power_downlink->Gain_set_downlink - alc_power_downlink->Gain_downlink);
         ad9361_set_tx_attenuation(phy, 1,total_calculation);

		//return (AD_DOWNLINK_ATTN(
		//		(alc_power_downlink->attn_downlink_DCA
		//				+ alc_power_downlink->attn_downlink_AD
		//				+ alc_power_downlink->comp_attn_downlink_DCA
		//				+ alc_power_downlink->comp_attn_downlink_AD
		//				+(alc_power_downlink->Gain_set_downlink - alc_power_downlink->Gain_downlink)), par_1,
		//		par_2));
	}
}
/*
 * this is same as the downlink file.
 * do need to be modified accordingly.
 *
 * returns 	0 if sucess
 * 			-error_3 if LED is to blin red
 * 			else just the total attenuation value that is required by ALC field (this is temporary please change it accordingly)
 */
int apply_alc_uplink(adc_count_band* alc_power_uplink_onboard, band* alc_power_uplink,   int bandType,struct ad9361_rf_phy *phy) {
  int total_calculation=0;
	alc_power_uplink->power.uplink_power_output = output_power_uplink(alc_power_uplink_onboard,
			alc_power_uplink, phy);
	alc_power_uplink->power.uplink_power_input = input_power_uplink(alc_power_uplink_onboard,
			alc_power_uplink, phy);

	if (alc_power_uplink->PA_auto_on_off) {
		if (alc_power_uplink->power.uplink_power_output
				> (alc_power_uplink->auto_scale_uplink - 15)) {
			alc_power_uplink->PA_auto_on_off = false;
			pa_uplink_onoff(true, bandType);
		} else {
		    pa_uplink_onoff(false, bandType);
			return -error_3;
		}
	}

	if (alc_power_uplink->PA_uplink) {
		switch (alc_power_uplink->alc_on_off) {
		case true: {
			/*
			 * a case in which alc is ON but PA is turned off
			 * in that case nothing is to be done at all ust return 0;
			 */
			if ((alc_power_uplink->PA_auto_on_off == false)
					&& (alc_power_uplink->power.uplink_power_output
							> alc_power_uplink->auto_scale_uplink)) {
			    pa_uplink_onoff(false, bandType);
				return -error_3;
			}

			/*
			 * else if alc is ON and PA is ON then first check if it is greater than the alc set value or not
			 * also keep checking for the point that the level has not reached the desired auto PA operation level
			 * if the alc value is less than the output power the it needs to be attenuated for this
			 * the attenuation value is calculated by
			 * output_power - (alc_level + total attenuation set for the band without including the compensation)
			 */
			else if ((alc_power_uplink->alc_uplink_level
					> alc_power_uplink->power.uplink_power_output)
					&& (alc_power_uplink->power.uplink_power_output
							< alc_power_uplink->auto_scale_uplink)) {

				alc_power_uplink->attn_uplink_DCA =
						alc_power_uplink->power.uplink_power_output
								- alc_power_uplink->alc_uplink_level;
				/*
				 * just a case in which we have the alc attn greater than 31 in that case we are required to switch it too other block
				 * for purpose of GUI and showing
				 */
				if (alc_power_uplink->attn_uplink_DCA > 31) {
					alc_power_uplink->attn_uplink_AD =
							alc_power_uplink->attn_uplink_DCA - 31;
					alc_power_uplink->attn_uplink_DCA = 31;
				} else {
					alc_power_uplink->attn_uplink_AD = 0;
				}
			  total_calculation=alc_power_uplink->attn_uplink_DCA+ alc_power_uplink->attn_uplink_AD
			                              + alc_power_uplink->comp_attn_uplink_DCA+ alc_power_uplink->comp_attn_uplink_AD
			                              + (alc_power_uplink->Gain_set_uplink - alc_power_uplink->Gain_uplink);
			  ad9361_set_tx_attenuation(phy, 1,total_calculation);
			 return 0;
			//	return (AD_UPLINK_ATTN(
			//			(alc_power_uplink->attn_uplink_DCA
			//					+ alc_power_uplink->attn_uplink_AD
			//					+ alc_power_uplink->comp_attn_uplink_DCA
			//					+ alc_power_uplink->comp_attn_uplink_AD
			//					+ (alc_power_uplink->Gain_set_uplink - alc_power_uplink->Gain_uplink)),
			//			par_1, par_2));
				/*return (alc_power_downlink->power.downlink_power_output
				 - (alc_power_downlink->alc_downlink_level
				 + alc_power_downlink->comp_attn_downlink_DCA
				 + alc_power_downlink->comp_attn_downlink_AD));*/
			} else {
				return -error_2;
			}
		}
		default: {
			alc_power_uplink->attn_uplink_DCA = 0;
			alc_power_uplink->attn_uplink_AD = 0;
			//return (AD_UPLINK_ATTN(
			//		(alc_power_uplink->attn_uplink_DCA
			//				+ alc_power_uplink->attn_uplink_AD
			//				+ alc_power_uplink->comp_attn_uplink_DCA
			//				+ alc_power_uplink->comp_attn_uplink_AD
			//				+ (alc_power_uplink->Gain_set_uplink - alc_power_uplink->Gain_uplink)), par_1,
			//		par_2));
            total_calculation=alc_power_uplink->attn_uplink_DCA+ alc_power_uplink->attn_uplink_AD
                    + alc_power_uplink->comp_attn_uplink_DCA+ alc_power_uplink->comp_attn_uplink_AD
                    + (alc_power_uplink->Gain_set_uplink - alc_power_uplink->Gain_uplink);
                    ad9361_set_tx_attenuation(phy, 1,total_calculation);

			return 0;
			/*return (alc_power_downlink->power.downlink_power_output
			 - (alc_power_downlink->alc_downlink_level
			 + alc_power_downlink->comp_attn_downlink_DCA
			 + alc_power_downlink->comp_attn_downlink_AD));*/
		}
		}
	} else {
        total_calculation=alc_power_uplink->attn_uplink_DCA+ alc_power_uplink->attn_uplink_AD
                + alc_power_uplink->comp_attn_uplink_DCA+ alc_power_uplink->comp_attn_uplink_AD
                + (alc_power_uplink->Gain_set_uplink - alc_power_uplink->Gain_uplink);
          ad9361_set_tx_attenuation(phy, 1,total_calculation);
          return 0;
		//return (AD_UPLINK_ATTN(
		//		(alc_power_uplink->attn_uplink_DCA
		//				+ alc_power_uplink->attn_uplink_AD
		//				+ alc_power_uplink->comp_attn_uplink_DCA
		//				+ alc_power_uplink->comp_attn_uplink_AD
		//				+ (alc_power_uplink->Gain_set_uplink - alc_power_uplink->Gain_uplink)), par_1, par_2));
	}
}

/*
 * repeter* update_repeter: the repeter that is being pointed to be returned
 * BAND_TYPE : it is the enum value of selected band, just for identification in GUI
 *
 * returns: char* update_repeter which stores the real time data of the repeter with the header of "$UPD"
 */

char * update_return(band* update_repeter) {
	char * repeter_update = strdup("");
	ltoa('$', repeter_update);
	repeter_update += sizeof(repeter_update);
	ltoa('U', repeter_update);
	repeter_update += sizeof(repeter_update);
	ltoa('P', repeter_update);
	repeter_update += sizeof(repeter_update);
	ltoa('D', repeter_update);
	repeter_update += sizeof(repeter_update);
	ltoa('a', repeter_update);
	repeter_update += sizeof(repeter_update);



	ltoa('b', repeter_update);
	repeter_update += sizeof(repeter_update);
	ltoa(update_repeter->attn_downlink_DCA, repeter_update);
	repeter_update += sizeof(repeter_update);
	ltoa(update_repeter->attn_downlink_AD, repeter_update);
	repeter_update += sizeof(repeter_update);

	ltoa('c', repeter_update);
	repeter_update += sizeof(repeter_update);
	ltoa(update_repeter->attn_uplink_DCA, repeter_update);
	repeter_update += sizeof(repeter_update);
	ltoa(update_repeter->attn_uplink_AD, repeter_update);
	repeter_update += sizeof(repeter_update);

	ltoa('d', repeter_update);
	repeter_update += sizeof(repeter_update);
	ltoa(update_repeter->power.downlink_power_input, repeter_update);
	repeter_update += sizeof(repeter_update);
	ltoa(update_repeter->power.downlink_power_output, repeter_update);
	repeter_update += sizeof(repeter_update);

	ltoa('e', repeter_update);
	repeter_update += sizeof(repeter_update);
	ltoa(update_repeter->power.uplink_power_input, repeter_update);
	repeter_update += sizeof(repeter_update);
	ltoa(update_repeter->power.uplink_power_output, repeter_update);
	repeter_update += sizeof(repeter_update);

	return &repeter_update[0];
}


uint16_t AUU_UPDATE_UPLINK(uint32_t pui32ADCwhile, adc_count_band* repeter_uplink)//GSM_UPLINK
{
	int alc2 = 31, ALC = 0;
	if (pui32ADCwhile >= (repeter_uplink->adc_up[0])
			&& pui32ADCwhile <= repeter_uplink->adc_up[1])
		ALC = 0;
	else if (pui32ADCwhile >= (repeter_uplink->adc_up[1])
			&& pui32ADCwhile <= repeter_uplink->adc_up[2])
		ALC = 1;
	else if (pui32ADCwhile >= (repeter_uplink->adc_up[2])
			&& pui32ADCwhile <= repeter_uplink->adc_up[3])
		ALC = 2;
	else if (pui32ADCwhile >= (repeter_uplink->adc_up[3])
			&& pui32ADCwhile <= repeter_uplink->adc_up[4])
		ALC = 3;
	else if (pui32ADCwhile >= (repeter_uplink->adc_up[4])
			&& pui32ADCwhile <= repeter_uplink->adc_up[5])
		ALC = 4;
	else if (pui32ADCwhile >= (repeter_uplink->adc_up[5])
			&& pui32ADCwhile <= repeter_uplink->adc_up[6])
		ALC = 5;
	else if (pui32ADCwhile >= (repeter_uplink->adc_up[6])
			&& pui32ADCwhile <= repeter_uplink->adc_up[7])
		ALC = 6;
	else if (pui32ADCwhile >= (repeter_uplink->adc_up[7])
			&& pui32ADCwhile <= repeter_uplink->adc_up[8])
		ALC = 7;
	else if (pui32ADCwhile >= (repeter_uplink->adc_up[8])
			&& pui32ADCwhile <= repeter_uplink->adc_up[9])
		ALC = 8;
	else if (pui32ADCwhile >= (repeter_uplink->adc_up[9])
			&& pui32ADCwhile <= repeter_uplink->adc_up[10])
		ALC = 9;
	else if (pui32ADCwhile >= (repeter_uplink->adc_up[10])
			&& pui32ADCwhile <= repeter_uplink->adc_up[11])
		ALC = 10;
	else if (pui32ADCwhile >= (repeter_uplink->adc_up[11])
			&& pui32ADCwhile <= repeter_uplink->adc_up[12])
		ALC = 11;
	else if (pui32ADCwhile >= (repeter_uplink->adc_up[12])
			&& pui32ADCwhile <= repeter_uplink->adc_up[13])
		ALC = 12;
	else if (pui32ADCwhile >= (repeter_uplink->adc_up[13])
			&& pui32ADCwhile <= repeter_uplink->adc_up[14])
		ALC = 13;
	else if (pui32ADCwhile >= (repeter_uplink->adc_up[14])
			&& pui32ADCwhile <= repeter_uplink->adc_up[15])
		ALC = 14;
	else if (pui32ADCwhile >= (repeter_uplink->adc_up[15])
			&& pui32ADCwhile <= repeter_uplink->adc_up[16])
		ALC = 15;
	else if (pui32ADCwhile >= (repeter_uplink->adc_up[16])
			&& pui32ADCwhile <= repeter_uplink->adc_up[17])
		ALC = 16;
	else if (pui32ADCwhile >= (repeter_uplink->adc_up[17])
			&& pui32ADCwhile <= repeter_uplink->adc_up[18])
		ALC = 17;
	else if (pui32ADCwhile >= (repeter_uplink->adc_up[18])
			&& pui32ADCwhile <= repeter_uplink->adc_up[19])
		ALC = 18;
	else if (pui32ADCwhile >= (repeter_uplink->adc_up[19])
			&& pui32ADCwhile <= repeter_uplink->adc_up[20])
		ALC = 19;
	else if (pui32ADCwhile >= (repeter_uplink->adc_up[20])
			&& pui32ADCwhile <= repeter_uplink->adc_up[21])
		ALC = 20;
	else if (pui32ADCwhile >= (repeter_uplink->adc_up[21])
			&& pui32ADCwhile <= repeter_uplink->adc_up[22])
		ALC = 21;
	else if (pui32ADCwhile >= (repeter_uplink->adc_up[22])
			&& pui32ADCwhile <= repeter_uplink->adc_up[23])
		ALC = 22;
	else if (pui32ADCwhile >= (repeter_uplink->adc_up[23])
			&& pui32ADCwhile <= repeter_uplink->adc_up[24])
		ALC = 23;
	else if (pui32ADCwhile >= (repeter_uplink->adc_up[24])
			&& pui32ADCwhile <= repeter_uplink->adc_up[25])
		ALC = 24;
	else if (pui32ADCwhile >= (repeter_uplink->adc_up[25])
			&& pui32ADCwhile <= repeter_uplink->adc_up[26])
		ALC = 25;
	else if (pui32ADCwhile >= (repeter_uplink->adc_up[26])
			&& pui32ADCwhile <= repeter_uplink->adc_up[27])
		ALC = 26;
	else if (pui32ADCwhile >= (repeter_uplink->adc_up[27])
			&& pui32ADCwhile <= repeter_uplink->adc_up[28])
		ALC = 27;
	else if (pui32ADCwhile >= (repeter_uplink->adc_up[28])
			&& pui32ADCwhile <= repeter_uplink->adc_up[29])
		ALC = 28;
	else if (pui32ADCwhile >= (repeter_uplink->adc_up[29])
			&& pui32ADCwhile <= repeter_uplink->adc_up[30])
		ALC = 29;
	else if (pui32ADCwhile > (repeter_uplink->adc_up[30])) {
		ALC = 30;
	} else
		ALC = alc2;
	return ALC;
}

uint16_t AUU_UPDATE_DOWNLINK(uint32_t pui32ADCwhile, adc_count_band* repeter_downlink)//GSM_DOWNLINK
{
	//int alc2[31]={22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0,-1,-2,-3,-4,-5,-6,-7,-31},ALC=0;
	int alc2 = 31, ALC = 0;
	if (pui32ADCwhile >= (repeter_downlink->adc_down[0])
			&& pui32ADCwhile <= repeter_downlink->adc_down[1])
		ALC = 0;
	else if (pui32ADCwhile >= (repeter_downlink->adc_down[1])
			&& pui32ADCwhile <= repeter_downlink->adc_down[2])
		ALC = 1;
	else if (pui32ADCwhile >= (repeter_downlink->adc_down[2])
			&& pui32ADCwhile <= repeter_downlink->adc_down[3])
		ALC = 2;
	else if (pui32ADCwhile >= (repeter_downlink->adc_down[3])
			&& pui32ADCwhile <= repeter_downlink->adc_down[4])
		ALC = 3;
	else if (pui32ADCwhile >= (repeter_downlink->adc_down[4])
			&& pui32ADCwhile <= repeter_downlink->adc_down[5])
		ALC = 4;
	else if (pui32ADCwhile >= (repeter_downlink->adc_down[5])
			&& pui32ADCwhile <= repeter_downlink->adc_down[6])
		ALC = 5;
	else if (pui32ADCwhile >= (repeter_downlink->adc_down[6])
			&& pui32ADCwhile <= repeter_downlink->adc_down[7])
		ALC = 6;
	else if (pui32ADCwhile >= (repeter_downlink->adc_down[7])
			&& pui32ADCwhile <= repeter_downlink->adc_down[8])
		ALC = 7;
	else if (pui32ADCwhile >= (repeter_downlink->adc_down[8])
			&& pui32ADCwhile <= repeter_downlink->adc_down[9])
		ALC = 8;
	else if (pui32ADCwhile >= (repeter_downlink->adc_down[9])
			&& pui32ADCwhile <= repeter_downlink->adc_down[10])
		ALC = 9;
	else if (pui32ADCwhile >= (repeter_downlink->adc_down[10])
			&& pui32ADCwhile <= repeter_downlink->adc_down[11])
		ALC = 10;
	else if (pui32ADCwhile >= (repeter_downlink->adc_down[11])
			&& pui32ADCwhile <= repeter_downlink->adc_down[12])
		ALC = 11;
	else if (pui32ADCwhile >= (repeter_downlink->adc_down[12])
			&& pui32ADCwhile <= repeter_downlink->adc_down[13])
		ALC = 12;
	else if (pui32ADCwhile >= (repeter_downlink->adc_down[13])
			&& pui32ADCwhile <= repeter_downlink->adc_down[14])
		ALC = 13;
	else if (pui32ADCwhile >= (repeter_downlink->adc_down[14])
			&& pui32ADCwhile <= repeter_downlink->adc_down[15])
		ALC = 14;
	else if (pui32ADCwhile >= (repeter_downlink->adc_down[15])
			&& pui32ADCwhile <= repeter_downlink->adc_down[16])
		ALC = 15;
	else if (pui32ADCwhile >= (repeter_downlink->adc_down[16])
			&& pui32ADCwhile <= repeter_downlink->adc_down[17])
		ALC = 16;
	else if (pui32ADCwhile >= (repeter_downlink->adc_down[17])
			&& pui32ADCwhile <= repeter_downlink->adc_down[18])
		ALC = 17;
	else if (pui32ADCwhile >= (repeter_downlink->adc_down[18])
			&& pui32ADCwhile <= repeter_downlink->adc_down[19])
		ALC = 18;
	else if (pui32ADCwhile >= (repeter_downlink->adc_down[19])
			&& pui32ADCwhile <= repeter_downlink->adc_down[20])
		ALC = 19;
	else if (pui32ADCwhile >= (repeter_downlink->adc_down[20])
			&& pui32ADCwhile <= repeter_downlink->adc_down[21])
		ALC = 20;
	else if (pui32ADCwhile >= (repeter_downlink->adc_down[21])
			&& pui32ADCwhile <= repeter_downlink->adc_down[22])
		ALC = 21;
	else if (pui32ADCwhile >= (repeter_downlink->adc_down[22])
			&& pui32ADCwhile <= repeter_downlink->adc_down[23])
		ALC = 22;
	else if (pui32ADCwhile >= (repeter_downlink->adc_down[23])
			&& pui32ADCwhile <= repeter_downlink->adc_down[24])
		ALC = 23;
	else if (pui32ADCwhile >= (repeter_downlink->adc_down[24])
			&& pui32ADCwhile <= repeter_downlink->adc_down[25])
		ALC = 24;
	else if (pui32ADCwhile >= (repeter_downlink->adc_down[25])
			&& pui32ADCwhile <= repeter_downlink->adc_down[26])
		ALC = 25;
	else if (pui32ADCwhile >= (repeter_downlink->adc_down[26])
			&& pui32ADCwhile <= repeter_downlink->adc_down[27])
		ALC = 26;
	else if (pui32ADCwhile >= (repeter_downlink->adc_down[27])
			&& pui32ADCwhile <= repeter_downlink->adc_down[28])
		ALC = 27;
	else if (pui32ADCwhile >= (repeter_downlink->adc_down[28])
			&& pui32ADCwhile <= repeter_downlink->adc_down[29])
		ALC = 28;
	else if (pui32ADCwhile >= (repeter_downlink->adc_down[29])
			&& pui32ADCwhile <= repeter_downlink->adc_down[30])
		ALC = 29;
	else if (pui32ADCwhile > (repeter_downlink->adc_down[30]))
		ALC = 30;
	else
		ALC = alc2;
	return ALC;
}
