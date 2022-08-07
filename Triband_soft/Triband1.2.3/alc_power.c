/*
 * alc_power.c
 *
 *  Created on: Mar 8, 2019
 *      Author: FCS-RN5
 */
#include "alc_power.h"
#include "errors.h"
#include "othInterfaceHandler.h"
#include "adHandler.h"
/*
(UL_900)u500-u3---ul--1
(DL_900)u921-u8---dl--2


(UL3_2100)u922-u13--3
(DL3_2100)u920-u18--4

(1800DL2)u923-u28,u39--5
(1800UL2)u924-u23,u33--6
*/
/*
 * offset_ul: offset present for the band in uplink stage
 * final_unit_uplink: higher level of agc set by the user
 * gainvalue_ul: gain in uplink set by the gui
 * comp_ul: compensation value of the boardin uplink should be zero for TRI band
 * attn_ul: the attenuated power for the board that can be set by the gui *
 *
 * returns the value of input power in int format
 */
#include <math.h>
repeter_runtime_power runtime_power[4];
void initPowerAttn(){
    int i=0;
    for (i=0;i<4;i++){
        memset((char *)&runtime_power[i],0,sizeof(repeter_runtime_power));
        runtime_power[i].band_num=i+1;
    }
}
/*
int input_power_uplink(band_data* repeter_power_uplink,int bandnumind0) {
	return ((output_power_uplink(repeter_power_uplink,bandnumind0))
			- (repeter_power_uplink->Gain_uplink						//this is set to 70
					+ repeter_power_uplink->attn_uplink
					));
}
*/
/*
 * offset_ul: offset present for the band in uplink stage
 * final_unit_uplink: higher level of agc set by the user
 *
 * returns the value of output power in int format
 */
/*
 * offset_dl: offset present for the band in downlink stage
 * final_unit_downlink: higher level of agc set by the user
 * gainvalue_dl: gain in downlink set by the gui
 * comp_dl: compensation value of the boardin downlink should be zero for TRI band
 * attn_dl: the attenuated power for the board that can be set by the gui
 *
 * returns the value of input power in int format
 */
/*
int input_power_downlink(band_data* repeter_power_downlink,  int bandnumind0) {
	return ((output_power_downlink(repeter_power_downlink,  bandnumind0))
			- (repeter_power_downlink->Gain_downlink					//this is set to 70
					+ repeter_power_downlink->attn_downlink
					));
}
*/
/*
 * offset_dl: offset present for the band in downlink stage
 * final_unit_downlink: higher level of agc set by the user
 *AUU_UPDATE_2: reads the spi lines of AD to get the ADC count of power input for the particular
 *
 * returns the value of output power in int format
 */
/*
*/
int apply_alc_downlink( band_data* rband,  int bandnum,prevPeripheralState *state){
    int adpower=0;int offset; int totalOutPower; int attnDCA;int attnAD;
    int ad_power_in_db=0;
    int bandIndex=bandnum-1;
    volatile int inptpp;
   // getRxRssiUl(bandnum_ind0);
    read_ad_power_dl(&adpower,bandnum);
   // *ad_power=adpower;
    int pos=0;

  //  ad_power_in_db=adpower*5;//ad power least count is .5 we will multiply by 10 to remove floating point at -40 input it will read 400
    inptpp=((rband->ad_dl_calib_coefficient.coeff*adpower)-(rband->ad_dl_calib_coefficient.coeff*rband->ad_dl_calib_coefficient.avgY))+rband->ad_dl_calib_coefficient.avgX;
    ad_power_in_db=0-inptpp;
    //calculate_power(adpower,rband->calib_max_uplink,rband->calib_data_ar_ul,&pos);
   // return;
    offset=rband->offset_downlink;
    attnDCA=rband->comp_attn_downlink;
    attnAD=rband->attn_downlink;
    totalOutPower=rband->Gain_downlink+(ad_power_in_db);
    state->DLInPower[bandIndex]=ad_power_in_db;
    if(rband->PA_downlink==0){
        write_at_shift_reg_dl(bandnum,31);//full attan in dca

         set_ad_att_dl(69, bandnum);
     }
     else{
         if(rband->alc_on_off==0){//if alc is off then simply attan signal
        // read_ad_power_dl(&adpower,bandnumind0);//read the power from ad
             state->DLOutPower[bandIndex]=rband->Gain_downlink+(0-ad_power_in_db)+(0-attnDCA);
             if(state->DLOutPower[bandIndex] !=state->prevDLOutPower[bandIndex]){
                 write_at_shift_reg_dl(bandnum,attnDCA);
                 set_ad_att_dl(attnAD, bandnum);
               }

         }
         else{//alc is on put the logic
             int alclvl=0;
             int total_attn=0;
             int adjust=0;
             int system_out_pwr=0;
             total_attn=attnDCA+attnAD;
            // calib_pwr= rband->Gain_uplink+rband->calib_max_uplink;
             system_out_pwr=rband->Gain_downlink+(ad_power_in_db)+(0-attnAD); //system can give 70 db gain ad also add gain but attn in ad tx path can not be calculated
             state->DLOutPower[bandIndex]=system_out_pwr;
             alclvl=rband->alc_uplink_level+offset;
             state->DLOutPower[bandIndex]=system_out_pwr;
             //cal max in minimum input at which calibration happened Gain_uplink is total actual gain and ad power is present ad power
             //now if max gain is 70 and calmax is -40 then 70-40=30 db is the out put Now if we want to achieve 22 db then (30-(40+adpower)-alclevel if alc level is +ive
                       //outputlow alarm
             if(system_out_pwr !=alclvl){

                 totalOutPower=system_out_pwr;

                 adjust= totalOutPower-alclvl;
                 if(adjust <0)
                     adjust=0-adjust;
                 if(adjust > 29){
                    write_at_shift_reg_dl(bandnum,attnDCA+29);
                    set_ad_att_dl((attnAD+adjust-29), bandnum);
                    rband->comp_attn_downlink=attnDCA+29;
                    rband->attn_downlink=(attnAD+adjust-29);
                }else{
                    write_at_shift_reg_dl(bandnum,attnDCA+adjust);
                    rband->comp_attn_downlink=attnDCA+adjust;
                }
              }


         }

     }
    return 0;
}


float gPrevad_power_in_db=0;
int gx[70], gy[70];


int record_coeff(band_data* rband,int bandnum,int ul){
    int grecCount=0;
           int xy[60], xsquare[60], ysquare[60];
           int i, xsum, ysum, xysum, xsqr_sum, ysqr_sum;
           float  num, deno;
           float ad_power_in_db=0;
           int adpower=0;
           int avgX,avgY;
           int inptpp;
           int cal_max_cnt=0;
           int gmaxC;
           xsum = ysum = xysum = xsqr_sum = ysqr_sum = 0;
            if(ul==1){
            cal_max_cnt=rband->calib_max_uplink;
            }
            else{
            cal_max_cnt=rband->calib_max_downlink;
            }
           // if(grecCount>cal_max_cnt)
          //      return 1;
           /* get the number of entries from the user */

           /* get the values for x and y  from the user */
           /*
          if(recCount>=31){
              read_ad_power_ul(&adpower,1);
              ad_power_in_db=adpower*0.5;
             inptpp=((coeff*ad_power_in_db)-(coeff*avgY))+avgX;
            return;
          }
          */
          i=0;
          gmaxC=40;
          grecCount=0;
          cal_max_cnt=31;
          for(i=0;i<=31;i++){
             if(ul==1){
                 write_at_shift_reg_ul(bandnum,i);//starting from full attan
                 SysCtlDelay(1 * 16000000);
                 read_ad_power_ul(&adpower,bandnum);

              }
               else{
                   write_at_shift_reg_dl(bandnum,i);//starting from full attan
                   SysCtlDelay(1 * 16000000);
                  read_ad_power_dl(&adpower,bandnum);
               }
             // ad_power_in_db=adpower*0.5;
              gx[grecCount]=gmaxC;
              gy[grecCount]=adpower;
              grecCount++;
              gmaxC++;


           }
          grecCount=31;
          cal_max_cnt=31;
         // gPrevad_power_in_db=ad_power_in_db;
           if(grecCount==cal_max_cnt){
               /* find the needed data to manipulate correlation coeff */
               for (i = 0; i < cal_max_cnt; i++) {
                       xy[i] = gx[i] * gy[i];
                       xsquare[i] = gx[i] * gx[i];
                       ysquare[i] = gy[i] * gy[i];
                       xsum = xsum + gx[i];
                       ysum = ysum + gy[i];
                       xysum = xysum + xy[i];
                       xsqr_sum = xsqr_sum + xsquare[i];
                       ysqr_sum = ysqr_sum + ysquare[i];
               }

               num = 1.0 * ((cal_max_cnt * xysum) - (xsum * ysum));
              // deno = 1.0 * ((n * xsqr_sum - xsum * xsum)* (n * ysqr_sum - ysum * ysum));
               deno = 1.0 * ((cal_max_cnt * ysqr_sum)- (ysum * ysum));
               /* calculate correlation coefficient */
             //  coeff = num / sqrt(deno);
               if(ul==1)
                   rband->calibstateUl=2;
               else
                   rband->calibstateDl=2;
               if(ul==1){
                   rband->ad_ul_calib_coefficient.coeff = num / deno;
                   rband->ad_ul_calib_coefficient.avgX=avgX=xsum/cal_max_cnt;
                   rband->ad_ul_calib_coefficient.avgY=ysum/cal_max_cnt;
               }
               else{
                   rband->ad_dl_calib_coefficient.coeff = num / deno;
                    rband->ad_dl_calib_coefficient.avgX=avgX=xsum/cal_max_cnt;
                    rband->ad_dl_calib_coefficient.avgY=ysum/cal_max_cnt;

               }
               //write in flash
               set_band_info(bandnum, rband);
               /* print the result */
              // printf("Correlation Coefficient : %.4f\n", coeff);
               write_at_shift_reg_ul(bandnum,0);
               write_at_shift_reg_dl(bandnum,0);
           }
           return 0;

}
int apply_alc_uplink( band_data* rband,   int bandnum,prevPeripheralState *state){
    int adpower=0;int offset; int totalOutPower; int attnDCA;int attnAD;
    int ad_power_in_db=0;
    int bandIndex=bandnum-1;
    volatile int inptpp;
   // getRxRssiUl(bandnum_ind0);
    read_ad_power_ul(&adpower,bandnum);
   // *ad_power=adpower;
    int pos=0;

  //  ad_power_in_db=adpower*5;//ad power least count is .5 we will multiply by 10 to remove floating point at -40 input it will read 400
    inptpp=((rband->ad_ul_calib_coefficient.coeff*adpower)-(rband->ad_ul_calib_coefficient.coeff*rband->ad_ul_calib_coefficient.avgY))+rband->ad_ul_calib_coefficient.avgX;
    ad_power_in_db=0-inptpp;
    //calculate_power(adpower,rband->calib_max_uplink,rband->calib_data_ar_ul,&pos);
   // return;
    offset=rband->offset_uplink;
    attnDCA=rband->comp_attn_uplink;
    attnAD=rband->attn_uplink;
    totalOutPower=rband->Gain_uplink+(ad_power_in_db);
    state->ULInPower[bandIndex]=ad_power_in_db;
    if(rband->PA_uplink==0){
        write_at_shift_reg_ul(bandnum,31);//full attan in dca

         set_ad_att_dl(69, bandnum);
     }
     else{
         if(rband->alc_on_off==0){//if alc is off then simply attan signal
        // read_ad_power_dl(&adpower,bandnumind0);//read the power from ad
             state->ULOutPower[bandIndex]=rband->Gain_uplink+(0-ad_power_in_db)+(0-attnDCA);
             if(state->ULOutPower[bandIndex] !=state->prevULOutPower[bandIndex]){
                 write_at_shift_reg_ul(bandnum,rband->comp_attn_uplink);
                 set_ad_att_ul(attnAD, bandnum);
               }

         }
         else{//alc is on put the logic
             int alclvl=0;
             int total_attn=0;
             int adjust=0;
             int system_out_pwr=0;
             total_attn=rband->comp_attn_uplink+rband->attn_uplink;
            // calib_pwr= rband->Gain_uplink+rband->calib_max_uplink;
             system_out_pwr=rband->Gain_uplink+(ad_power_in_db)+(0-attnAD); //system can give 70 db gain ad also add gain but attn in ad tx path can not be calculated
             state->ULOutPower[bandIndex]=system_out_pwr;
             alclvl=rband->alc_uplink_level+offset;
             state->ULOutPower[bandIndex]=system_out_pwr;
             //cal max in minimum input at which calibration happened Gain_uplink is total actual gain and ad power is present ad power
             //now if max gain is 70 and calmax is -40 then 70-40=30 db is the out put Now if we want to achieve 22 db then (30-(40+adpower)-alclevel if alc level is +ive
                       //outputlow alarm
             if(system_out_pwr !=alclvl){

                 totalOutPower=system_out_pwr;

                 adjust= totalOutPower-alclvl;
                 if(adjust <0)
                     adjust=0-adjust;
                 if(adjust > 29){
                    write_at_shift_reg_ul(bandnum,attnDCA+29);
                    set_ad_att_ul((attnAD+adjust-29), bandnum);
                    rband->comp_attn_uplink=attnDCA+29;
                    rband->attn_uplink=(attnAD+adjust-29);
                }else{
                    write_at_shift_reg_ul(bandnum,attnDCA+adjust);
                    rband->comp_attn_uplink=attnDCA+adjust;
                }
              }
                /*
             else if(rband->alc_uplink_level<calib_pwr-31){//desire to attan more than board can require calibration
                 write_at_shift_reg_ul(bandnum_ind0,30);//remove attan
                 rband->comp_attn_uplink=30;
                 rband->attn_uplink=rband->alc_uplink_level-30;
                 set_ad_att_ul(rband->attn_uplink, bandnum_ind0);
             }
             else if(rband->alc_uplink_level > calib_pwr){  //desire to gain much as the board can give require calibration
                 write_at_shift_reg_ul(bandnum_ind0,0);//remove attan
                 set_ad_att_ul(0, bandnum_ind0);
                 rband->attn_uplink=0;
                 rband->comp_attn_uplink=0;
             }
             */
 //            if(rband->alc_uplink_level>0)
  //               attn_to_dca= ((rband->Gain_uplink-abs(rband->calib_max_uplink))-(abs(rband->calib_max_uplink)-abs(ad_power_in_db)))-rband->alc_uplink_level;
            // total_pwr=ad_power_in_db+(rband->Gain_uplink);
            // attn_to_dca=total_pwr-rband->alc_uplink_level;

            /* if((total_pwr<(rband->alc_uplink_level-1))||(total_pwr>(rband->alc_uplink_level+1))){
                   if(attn_to_dca>31){//if the attan is greater than 31 then put 31 in dca and rest in ad
                      int attn_in_ad=attn_to_dca-31;
                      write_at_shift_reg_ul(bandnum_ind0,31);
                      set_ad_att_dl(attn_in_ad, bandnum_ind0);
                  }
                  else{

                      write_at_shift_reg_ul(bandnum_ind0,attn_to_dca);

                  }
                  }*/


         }

     }
    return 0;
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
/*
int apply_alc_downlink(band_data* alc_power_downlink, int bandnum_ind0) {

	char * alc_downlink_response = strdup("");
	int total_calculation=0;
	adc_power[bandnum_ind0].downlink_power_output = output_power_downlink(alc_power_downlink, bandnum_ind0);
	adc_power[bandnum_ind0].downlink_power_input = input_power_downlink(alc_power_downlink, bandnum_ind0);

	if (alc_power_downlink->PA_auto_on_off) {
		if (adc_power[bandnum_ind0].downlink_power_output
			alc_power_downlink->PA_auto_on_off = false;
			pa_downlink_onoff(true, bandnum_ind0);
		} else {
		    pa_downlink_onoff(false, bandnum_ind0);
			return -error_3;
		}
	}

	if (alc_power_downlink->PA_downlink) {
		switch (alc_power_downlink->alc_on_off) {
		case true: {
			if ((alc_power_downlink->PA_auto_on_off == false)
					&& (adc_power[bandnum_ind0].downlink_power_output
							> alc_power_downlink->auto_scale_downlink)) {
				pa_downlink_onoff(false, bandnum_ind0);
				return -error_3;
			}

			else if ((alc_power_downlink->alc_downlink_level
					> adc_power[bandnum_ind0].downlink_power_output)
					&& (adc_power[bandnum_ind0].downlink_power_output
							< alc_power_downlink->auto_scale_downlink)) {

				alc_power_downlink->attn_downlink =
				        adc_power[bandnum_ind0].downlink_power_output
								- alc_power_downlink->alc_downlink_level;
				if (alc_power_downlink->attn_downlink > 31) {
					alc_power_downlink->attn_downlink =
							alc_power_downlink->attn_downlink - 31;
					alc_power_downlink->attn_downlink = 31;
				} else {
					alc_power_downlink->attn_downlink = 0;
				}
				total_calculation=alc_power_downlink->attn_downlink+  alc_power_downlink->comp_attn_downlink
                        +(alc_power_downlink->Max_Gain_downlink- alc_power_downlink->Gain_downlink);
				// ad9361_set_tx_attenuation(phy, 1,total_calculation);
				set_ad_att_dl(total_calculation,bandnum_ind0);
				 return 0;
				//return (AD_DOWNLINK_ATTN(par_1, par_2));
			} else {
				return -error_2;
			}
		}
		default: {
			alc_power_downlink->attn_downlink = 0;
            total_calculation=alc_power_downlink->attn_downlink_DCA+ alc_power_downlink->attn_downlink_AD
                                  + alc_power_downlink->comp_attn_downlink_DCA+ alc_power_downlink->comp_attn_downlink_AD
                                  +(alc_power_downlink->Gain_set_downlink - alc_power_downlink->Gain_downlink);
			// ad9361_set_tx_attenuation(phy, 1,total_calculation);
            set_ad_att_dl(total_calculation,bandnum_ind0);
			//return (AD_DOWNLINK_ATTN(
			//		(alc_power_downlink->attn_downlink_DCA
			//				+ alc_power_downlink->attn_downlink_AD
			//				+ alc_power_downlink->comp_attn_downlink_DCA
			//				+ alc_power_downlink->comp_attn_downlink_AD
			//				+(alc_power_downlink->Gain_set_downlink - alc_power_downlink->Gain_downlink)), par_1,
			//		par_2));

		}
		}
	} else {
        total_calculation=alc_power_downlink->attn_downlink_DCA
                              + alc_power_downlink->attn_downlink_AD
                              + alc_power_downlink->comp_attn_downlink_DCA
                              + alc_power_downlink->comp_attn_downlink_AD
                              +(alc_power_downlink->Gain_set_downlink - alc_power_downlink->Gain_downlink);
         //ad9361_set_tx_attenuation(phy, 1,total_calculation);
        set_ad_att_dl(total_calculation,bandnum_ind0);
		//return (AD_DOWNLINK_ATTN(
		//		(alc_power_downlink->attn_downlink_DCA
		//				+ alc_power_downlink->attn_downlink_AD
		//				+ alc_power_downlink->comp_attn_downlink_DCA
		//				+ alc_power_downlink->comp_attn_downlink_AD
		//				+(alc_power_downlink->Gain_set_downlink - alc_power_downlink->Gain_downlink)), par_1,
		//		par_2));
	}
}
*/
/*
int apply_alc_downlink(band_data* bd, int bandnum_ind0) {

    char * alc_downlink_response = strdup("");
    int total_calculation=0;
    adc_power[bandnum_ind0].downlink_power_output = output_power_downlink(alc_power_downlink, bandnum_ind0);
    adc_power[bandnum_ind0].downlink_power_input = input_power_downlink(alc_power_downlink, bandnum_ind0);

    if (alc_power_downlink->PA_auto_on_off) {
        if (adc_power[bandnum_ind0].downlink_power_output
            alc_power_downlink->PA_auto_on_off = false;
            pa_downlink_onoff(true, bandnum_ind0);
        } else {
            pa_downlink_onoff(false, bandnum_ind0);
            return -error_3;
        }
    }

    if (alc_power_downlink->PA_downlink) {
        switch (alc_power_downlink->alc_on_off) {
        case true: {
            if ((alc_power_downlink->PA_auto_on_off == false)
                    && (adc_power[bandnum_ind0].downlink_power_output
                            > alc_power_downlink->auto_scale_downlink)) {
                pa_downlink_onoff(false, bandnum_ind0);
                return -error_3;
            }

            else if ((alc_power_downlink->alc_downlink_level
                    > adc_power[bandnum_ind0].downlink_power_output)
                    && (adc_power[bandnum_ind0].downlink_power_output
                            < alc_power_downlink->auto_scale_downlink)) {

                alc_power_downlink->attn_downlink =
                        adc_power[bandnum_ind0].downlink_power_output
                                - alc_power_downlink->alc_downlink_level;
                if (alc_power_downlink->attn_downlink > 31) {
                    alc_power_downlink->attn_downlink =
                            alc_power_downlink->attn_downlink - 31;
                    alc_power_downlink->attn_downlink = 31;
                } else {
                    alc_power_downlink->attn_downlink = 0;
                }
                total_calculation=alc_power_downlink->attn_downlink+  alc_power_downlink->comp_attn_downlink
                        +(alc_power_downlink->Max_Gain_downlink- alc_power_downlink->Gain_downlink);
                // ad9361_set_tx_attenuation(phy, 1,total_calculation);
                set_ad_att_dl(total_calculation,bandnum_ind0);
                 return 0;
                //return (AD_DOWNLINK_ATTN(par_1, par_2));
            } else {
                return -error_2;
            }
        }
        default: {
            alc_power_downlink->attn_downlink = 0;
            total_calculation=alc_power_downlink->attn_downlink_DCA+ alc_power_downlink->attn_downlink_AD
                                  + alc_power_downlink->comp_attn_downlink_DCA+ alc_power_downlink->comp_attn_downlink_AD
                                  +(alc_power_downlink->Gain_set_downlink - alc_power_downlink->Gain_downlink);
            // ad9361_set_tx_attenuation(phy, 1,total_calculation);
            set_ad_att_dl(total_calculation,bandnum_ind0);
            //return (AD_DOWNLINK_ATTN(
            //      (alc_power_downlink->attn_downlink_DCA
            //              + alc_power_downlink->attn_downlink_AD
            //              + alc_power_downlink->comp_attn_downlink_DCA
            //              + alc_power_downlink->comp_attn_downlink_AD
            //              +(alc_power_downlink->Gain_set_downlink - alc_power_downlink->Gain_downlink)), par_1,
            //      par_2));

        }
        }
    } else {
        total_calculation=alc_power_downlink->attn_downlink_DCA
                              + alc_power_downlink->attn_downlink_AD
                              + alc_power_downlink->comp_attn_downlink_DCA
                              + alc_power_downlink->comp_attn_downlink_AD
                              +(alc_power_downlink->Gain_set_downlink - alc_power_downlink->Gain_downlink);
         //ad9361_set_tx_attenuation(phy, 1,total_calculation);
        set_ad_att_dl(total_calculation,bandnum_ind0);
        //return (AD_DOWNLINK_ATTN(
        //      (alc_power_downlink->attn_downlink_DCA
        //              + alc_power_downlink->attn_downlink_AD
        //              + alc_power_downlink->comp_attn_downlink_DCA
        //              + alc_power_downlink->comp_attn_downlink_AD
        //              +(alc_power_downlink->Gain_set_downlink - alc_power_downlink->Gain_downlink)), par_1,
        //      par_2));
    }
}
*/

/*
 * this is same as the downlink file.
 * do need to be modified accordingly.
 *
 * returns 	0 if sucess
 * 			-error_3 if LED is to blin red
 * 			else just the total attenuation value that is required by ALC field (this is temporary please change it accordingly)
 */
/*
int apply_alc_uplink(band_data* alc_power_uplink,  int bandnum_ind0) {
  int total_calculation=0;
  adc_power[bandnum_ind0].uplink_power_output = output_power_uplink(alc_power_uplink, bandnum_ind0);
  adc_power[bandnum_ind0].uplink_power_input = input_power_uplink(alc_power_uplink, bandnum_ind0);

	if (alc_power_uplink->PA_auto_on_off) {
		if (adc_power[bandnum_ind0].uplink_power_output
				> (alc_power_uplink->auto_scale_uplink - 15)) {
			alc_power_uplink->PA_auto_on_off = false;
			pa_uplink_onoff(true, bandnum_ind0);
		} else {
		    pa_uplink_onoff(false, bandnum_ind0);
			return -error_3;
		}
	}

	if (alc_power_uplink->PA_uplink) {
		switch (alc_power_uplink->alc_on_off) {
		case true: {
			if ((alc_power_uplink->PA_auto_on_off == false)
					&& (adc_power[bandnum_ind0].uplink_power_output
							> alc_power_uplink->auto_scale_uplink)) {
			    pa_uplink_onoff(false, bandnum_ind0);
				return -error_3;
			}

			else if ((alc_power_uplink->alc_uplink_level
					> adc_power[bandnum_ind0].uplink_power_output)
					&& (adc_power[bandnum_ind0].uplink_power_output
							< alc_power_uplink->auto_scale_uplink)) {

				alc_power_uplink->attn_uplink_DCA =
				        adc_power[bandnum_ind0].uplink_power_output
								- alc_power_uplink->alc_uplink_level;
				if (alc_power_uplink->attn_uplink > 31) {
					alc_power_uplink->attn_uplink_AD =
							alc_power_uplink->attn_uplink_DCA - 31;
					alc_power_uplink->attn_uplink_DCA = 31;
				} else {
					alc_power_uplink->attn_uplink_AD = 0;
				}
			  total_calculation=alc_power_uplink->attn_uplink_DCA+ alc_power_uplink->attn_uplink_AD
			                              + alc_power_uplink->comp_attn_uplink_DCA+ alc_power_uplink->comp_attn_uplink_AD
			                              + (alc_power_uplink->Gain_set_uplink - alc_power_uplink->Gain_uplink);
			 // ad9361_set_tx_attenuation(phy, 1,total_calculation);
			  set_ad_att_ul(total_calculation,bandnum_ind0);
			 return 0;
			//	return (AD_UPLINK_ATTN(
			//			(alc_power_uplink->attn_uplink_DCA
			//					+ alc_power_uplink->attn_uplink_AD
			//					+ alc_power_uplink->comp_attn_uplink_DCA
			//					+ alc_power_uplink->comp_attn_uplink_AD
			//					+ (alc_power_uplink->Gain_set_uplink - alc_power_uplink->Gain_uplink)),
			//			par_1, par_2));
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
                   // ad9361_set_tx_attenuation(phy, 1,total_calculation);
            set_ad_att_ul(total_calculation,bandnum_ind0);
			return 0;
		}
		}
	} else {
        total_calculation=alc_power_uplink->attn_uplink_DCA+ alc_power_uplink->attn_uplink_AD
                + alc_power_uplink->comp_attn_uplink_DCA+ alc_power_uplink->comp_attn_uplink_AD
                + (alc_power_uplink->Gain_set_uplink - alc_power_uplink->Gain_uplink);
         // ad9361_set_tx_attenuation(phy, 1,total_calculation);
        set_ad_att_ul(total_calculation,bandnum_ind0);
          return 0;
		//return (AD_UPLINK_ATTN(
		//		(alc_power_uplink->attn_uplink_DCA
		//				+ alc_power_uplink->attn_uplink_AD
		//				+ alc_power_uplink->comp_attn_uplink_DCA
		//				+ alc_power_uplink->comp_attn_uplink_AD
		//				+ (alc_power_uplink->Gain_set_uplink - alc_power_uplink->Gain_uplink)), par_1, par_2));
	}
}
*/
/*
 * repeter* update_repeter: the repeter that is being pointed to be returned
 * BAND_TYPE : it is the enum value of selected band, just for identification in GUI
 *
 * returns: char* update_repeter which stores the real time data of the repeter with the header of "$UPD"
 */
/*
char * update_return(band_data* update_repeter) {
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
	ltoa(update_repeter->attn_downlink, repeter_update);
	repeter_update += sizeof(repeter_update);
	ltoa(update_repeter->attn_downlink, repeter_update);
	repeter_update += sizeof(repeter_update);

	ltoa('c', repeter_update);
	repeter_update += sizeof(repeter_update);
	ltoa(update_repeter->attn_uplink, repeter_update);
	repeter_update += sizeof(repeter_update);
	ltoa(update_repeter->attn_uplink, repeter_update);
	repeter_update += sizeof(repeter_update);

	ltoa('d', repeter_update);
	repeter_update += sizeof(repeter_update);
	ltoa(adc_power[0].downlink_power_input, repeter_update);
	repeter_update += sizeof(repeter_update);
	ltoa(adc_power[0].downlink_power_output, repeter_update);
	repeter_update += sizeof(repeter_update);

	ltoa('e', repeter_update);
	repeter_update += sizeof(repeter_update);
	ltoa(adc_power[0].uplink_power_input, repeter_update);
	repeter_update += sizeof(repeter_update);
	ltoa(adc_power[0].uplink_power_output, repeter_update);
	repeter_update += sizeof(repeter_update);

	return &repeter_update[0];
}
*/

int16_t calculate_power(uint32_t pui32ADC0Value, int8_t base, uint16_t *ptrTemp,int *arpos/*adc_count_band* repeter_uplink*/)//GSM_UPLINK
{
    int outpower;
   // int base=-31;
    int err=1;
    int cntr,i;
    cntr=31;
    outpower=base;
    if(pui32ADC0Value<=ptrTemp[1]){
        outpower=base;
        err=0;
    }
    else{
    for (i=0;i<cntr-1;i++){
        if((pui32ADC0Value>=ptrTemp[i])&&(pui32ADC0Value<=ptrTemp[i+1])){
            int avg=((ptrTemp[i]+ptrTemp[i+1])/2);
            if(pui32ADC0Value<=avg){
                outpower= (base+i);
                *arpos=i;
            }
            else{
                outpower= (base+i)+1;//consider lower or upper bound
                *arpos=i+1;
            }
            err=0;
            break;
            }
        }
    }
    if(err==1){
        outpower=base;
        *arpos=0;
    }

	return outpower;
}

