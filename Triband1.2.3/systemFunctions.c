/*
 * systemFunctions.c
 *
 *  Created on: Nov 16, 2020
 *      Author: frogcell
 */
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "othInterfaceHandler.h"
#include "definitions.h"
#include "errors.h"
#include "adHandler.h"
#include "eepromHandler.h"
extern repeater_board gTriband_board;
extern eLED_STATE gLed_State;
extern struct ad9361_rf_phy  *ad9361_phy[8];
header HEAD;
//extern hump_data gHumpInfo[MAX_TOTAL_HUMP];//max 16 humps for all bands
extern hump_data gHumpInfo_50t[MAX_TOTAL_HUMP_ON_FPGA];//max  humps for all bands
extern hump_data gHumpInfo_35t[MAX_TOTAL_HUMP_ON_FPGA];

char* itoa(int num, char* str, int base){
    memset(str,0,base);
    sprintf(str,"%d",num);
}
/*
char* itoa(int num, char* str, int base)
{
    int i = 0;
    bool isNegative = false;

    // Handle 0 explicitely, otherwise empty string is printed for 0
    if (num == 0)
    {
        str[i++] = '0';
        str[i] = '\0';
        return str;
    }

    // In standard itoa(), negative numbers are handled only with
    // base 10. Otherwise numbers are considered unsigned.
    if (num < 0 && base == 10)
    {
        isNegative = true;
        num = -num;
    }

    // Process individual digits
    while (num != 0)
    {
        int rem = num % base;
        str[i++] = (rem > 9)? (rem-10) + 'a' : rem + '0';
        num = num/base;
    }

    // If number is negative, append '-'
    if (isNegative)
        str[i++] = '-';

    str[i] = '\0'; // Append string terminator

    // Reverse the string
    reverse(str, i);

    return str;
}
*/
/*
char* itoa(int num, char* buffer, int base)
{
    int current = 0;
    if (num == 0) {
        buffer[current++] = '0';
        buffer[current] = '\0';
        return buffer;
    }
    int num_digits = 0;
    if (num < 0) {
        if (base == 10) {
            num_digits ++;
            buffer[current] = '-';
            current ++;
            num *= -1;
        }
        else
            return NULL;
    }
    num_digits += (int)floor(log(num) / log(base)) + 1;
        while (current < num_digits)
        {
            int base_val = (int) pow(base, num_digits-1-current);
            int num_val = num / base_val;
            char value = num_val + '0';
            buffer[current] = value;
            current ++;
            num -= base_val * num_val;
        }
    buffer[current] = '\0';
    return buffer;
}
*/
int set_calib_info(int bandNum,band_data *bd){
    memcpy((char *)&gTriband_board.repeater_band[bandNum-1],(char *)bd,sizeof(band_data));
    program_eeprom_band((uint32_t *)&gTriband_board.repeater_band[bandNum-1],bandNum);
return 0;
}
int set_band_info(int bandNum,band_data *bd){
    int i=0;
    int j=0;
    if(bandNum <5){
//save the band info
        if(bandNum==1){
            if(bd->total_hump>gTriband_board.sys_detail.max_hump_1 )
                return -1;
        }
        else if(bandNum==2){
                    if(bd->total_hump>gTriband_board.sys_detail.max_hump_2 )
                        return -1;
        }
        else if(bandNum==3){
                    if(bd->total_hump>gTriband_board.sys_detail.max_hump_3 )
                        return -1;
        }
        else if(bandNum==4){
                    if(bd->total_hump>gTriband_board.sys_detail.max_hump_4 )
                        return -1;
        }
        memcpy((char *)&gTriband_board.repeater_band[bandNum-1],(char *)bd,sizeof(band_data));
        program_eeprom_band((uint32_t *)&gTriband_board.repeater_band[bandNum-1],bandNum);
      /* if(bd->total_hump==0){//delete old configured band
           for(i=0;i<MAX_TOTAL_HUMP;i++)//max 16 humps for all bands
           {
               if(gHumpInfo[i].band_id==bandNum){
                   gHumpInfo[i].band_id=0;
                   gHumpInfo[i].hump_present=0;

               }
           }

       }
       else{ //reserve humps for hump configuration
        //for(j=0;j<bd->total_hump;j++){
           j=0;
            for(i=0;i<MAX_TOTAL_HUMP;i++)//max 16 humps for all bands
            {
                if((gHumpInfo[i].hump_present==1)&&(gHumpInfo[i].band_id==bandNum)){
                    j++;//already reserve
                }
                if((gHumpInfo[i].hump_present==0)&&(gHumpInfo[i].band_id!=bandNum)){
                    gHumpInfo[i].band_id=bandNum;
                    gHumpInfo[i].hump_present=1;//reserve this
                    j++;
                    gHumpInfo[i].hump_id=j;
                }
                if(j>=bd->total_hump)
                    break;//total reserved
            }
           //}
       }*/
       set_hump_info();
      //  gTriband_board.repeater_band[bandNum-1].
    }
    else{
        return -1;
    }
return 0;
}
int get_band_info(int bandNum,band_data *bd){
    int i=0;
     if(bandNum <4){
         band_data *ptrtempData=&gTriband_board.repeater_band[bandNum];
         memcpy((char *)bd,(char *)ptrtempData,sizeof(band_data));
     }
     else{
         return BAND_PARAM_GET_ERROR;
     }

    return 0;
}
int set_hump_info(int bandNum){
    int i=0;
    if((bandNum==1)||(bandNum==2)){
    program_eeprom((uint32_t *)&gHumpInfo_50t[0],EEPROM_HUMP_FPGA1_ADDRESS, sizeof(gHumpInfo_50t));
    }
    else{
    program_eeprom((uint32_t *)&gHumpInfo_35t[0],EEPROM_HUMP_FPGA2_ADDRESS, sizeof(gHumpInfo_35t));
    }
    return 0;

}
int get_hump_info(int bandNum,int humpNum,hump_data **hd){
    int i=0;
    int bFound=0;
    if((bandNum==1)||(bandNum==2)){
        char reading_system[sizeof(gHumpInfo_50t)];
        read_eeprom_system((uint32_t*) reading_system, EEPROM_HUMP_FPGA1_ADDRESS,sizeof(gHumpInfo_50t));
        for(i=0;i<MAX_TOTAL_HUMP_ON_FPGA;i++)//max 16 humps for all bands
             {
                 if((gHumpInfo_50t[i].band_id==bandNum)&&(gHumpInfo_50t[i].hump_id==humpNum)){
                     *hd=&gHumpInfo_50t[i];
                     bFound=1;
                     break;
                 }
             }
    }
    else{
        char reading_system[sizeof(gHumpInfo_35t)];
        read_eeprom_system((uint32_t*) reading_system, EEPROM_HUMP_FPGA2_ADDRESS,sizeof(gHumpInfo_35t));
        for(i=0;i<MAX_TOTAL_HUMP_ON_FPGA;i++)//max 16 humps for all bands
             {
                 if((gHumpInfo_35t[i].band_id==bandNum)&&(gHumpInfo_35t[i].hump_id==humpNum)){
                     *hd=&gHumpInfo_35t[i];
                     bFound=1;
                     break;
                 }
             }

    }

    if(bFound==0)
        return -1;
    return 0;
}

int set_system_info(system_details *sysdet){
    //validate this
    int i=0;
    if(((sysdet->max_hump_1+sysdet->max_hump_2)>8)||((sysdet->max_hump_3+sysdet->max_hump_4)>8))
        {
            return -1;
        }
    //blanck all
    for(i=0;i<MAX_TOTAL_HUMP_ON_FPGA;i++){
        gHumpInfo_50t[i].band_id=0;
        gHumpInfo_50t[i].hump_id=0;
        gHumpInfo_35t[i].band_id=0;
        gHumpInfo_35t[i].hump_id=0;
        gHumpInfo_50t[i].hump_present=0;
        gHumpInfo_35t[i].hump_present=0;
    }
    if(sysdet->max_hump_1>1){
        for(i=0;i<sysdet->max_hump_1;i++){
             gHumpInfo_50t[i].band_id=1;
             gHumpInfo_50t[i].hump_id=i+1;
             gHumpInfo_50t[i].hump_present=1;
         }

        for(i=sysdet->max_hump_1;i<(sysdet->max_hump_1+sysdet->max_hump_2);i++){
             gHumpInfo_50t[i].band_id=2;
             gHumpInfo_50t[i].hump_id=(i-sysdet->max_hump_1)+1;
             gHumpInfo_50t[i].hump_present=1;
         }

     }
    else{
        for(i=0;i<sysdet->max_hump_2;i++){
             gHumpInfo_50t[i].band_id=2;
             gHumpInfo_50t[i].hump_id=i+1;
             gHumpInfo_50t[i].hump_present=1;

         }

    }

    if(sysdet->max_hump_3>1){
         for(i=0;i<sysdet->max_hump_3;i++){
              gHumpInfo_35t[i].band_id=3;
              gHumpInfo_35t[i].hump_id=i+1;
              gHumpInfo_35t[i].hump_present=1;
          }

         for(i=sysdet->max_hump_3;i<(sysdet->max_hump_3+sysdet->max_hump_4);i++){
              gHumpInfo_35t[i].band_id=4;
              gHumpInfo_35t[i].hump_id=(i-sysdet->max_hump_3)+1;
              gHumpInfo_35t[i].hump_present=1;
          }

      }
     else{
         for(i=0;i<sysdet->max_hump_4;i++){
              gHumpInfo_35t[i].band_id=4;
              gHumpInfo_35t[i].hump_id=i+1;
              gHumpInfo_35t[i].hump_present=1;
          }

     }

    memcpy((char *)&gTriband_board.sys_detail,(char *)sysdet,sizeof(system_details));
    program_eeprom((uint32_t *)&gTriband_board.sys_detail,EEPROM_SYSTEM_ADDRESS, sizeof(system_details));
    //update new hump info
    program_eeprom((uint32_t *)&gHumpInfo_50t[0],EEPROM_HUMP_FPGA1_ADDRESS, sizeof(gHumpInfo_50t));
    program_eeprom((uint32_t *)&gHumpInfo_35t[0],EEPROM_HUMP_FPGA2_ADDRESS, sizeof(gHumpInfo_35t));

    return 0;
}
int get_system_info(system_details *sys_detail){
    read_all_data();
    memcpy((char *)sys_detail,(char *)&gTriband_board.sys_detail,sizeof(system_details));
    return 0;
}
int set_modem_info(modem *mod){
    memcpy((char *)&gTriband_board.modem_detail,(char *)mod,sizeof(modem));
    program_eeprom((uint32_t *)&gTriband_board.modem_detail,EEPROM_MODEM_ADDRESS, sizeof(modem));
    return 0;
}
int get_modem_info(modem *mod){
    memcpy((char *)mod,(char *)&gTriband_board.modem_detail,sizeof(modem));

    return 0;
}
int set_fpga_param(band_data *repeater_band,int band_num,int hump_num){
    //int hump_if=0;int saw=0;int fpga_ul=1;int fpga_dl=0;
   // TestToFpga();
    sendToFpga(repeater_band, band_num,hump_num);//index from 0 1
   // sendToFpga(repeater_band, band_num,hump_num);//index from 0 1
}
int get_fpga_param(int fpgaNumber){

}

int get_calibration_uplink(int bandnum,uint16_t* calibration_get_data)
{
    /*uint8_t * calib_buffer = malloc(
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
            */
//    memcpy((char *)calibration_get_data,(char *)&gTriband_board.repeater_band[bandnum-1].calib_data_ar_ul,sizeof(gTriband_board.repeater_band[bandnum-1].calib_data_ar_ul));
    return 0;
}
int get_calibration_downlink(int bandnum,uint16_t* calibration_get_data){
  //  memcpy((char *)calibration_get_data,(char *)&gTriband_board.repeater_band[bandnum-1].calib_data_ar_dl,sizeof(gTriband_board.repeater_band[bandnum-1].calib_data_ar_dl));
     return 0;

}
int set_calibration_uplink(int bandnum,uint16_t* calibration_get_data)
{
    /*uint8_t * calib_buffer = malloc(
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
            */
   // memcpy(gTriband_board.repeater_band[bandnum-1].calib_data_ar_ul)
    //memcpy((char *)&gTriband_board.repeater_band[bandnum-1].calib_data_ar_ul,(char *)calibration_get_data,sizeof(gTriband_board.repeater_band[bandnum-1].calib_data_ar_ul));

    return 0;
}
int set_calibration_downlink(int bandnum,uint16_t* calibration_get_data){
    //memcpy((char *)&gTriband_board.repeater_band[bandnum-1].calib_data_ar_dl,(char *)calibration_get_data,sizeof(gTriband_board.repeater_band[bandnum-1].calib_data_ar_dl));

    return 0;

}

/*
 * repeter_calbration_onboard : this is the on board structure
 *                               which contains the variables that are
 *                               required to control the on board operation of the repeter.
 * repeter_calibration: repeter structure to be edited
 * par_1:   notation of AD in terms of controlling
 * par_2:   notation of AD in terms of controlling
 */
int system_calibration_uplink( band_data* repeter_calibration, int bandNum)
 {
    int32_t calibration_counter = 0, return_counter = 1;int32_t icount=0;
    bandNum=bandNum-1;
    int extraval[60];
   // int excntr=0;
    write_at_shift_reg_ul(bandNum,0);
    if((bandNum <4)&&(bandNum>-1)){


    }
    else{
        return_counter=0;
    }
    if (return_counter > 0) {
        program_eeprom_band((uint32_t *)&gTriband_board.repeater_band[bandNum],bandNum+1);
        return return_counter;
    } else {
        return -error_5;
    }
}

/*int system_calibration_uplink( band_data* repeter_calibration, int bandNum)
 {
    int32_t calibration_counter = 0, return_counter = 1;int32_t icount=0;
    bandNum=bandNum-1;
    int extraval[60];
   // int excntr=0;
    write_at_shift_reg_ul(bandNum,0);
    if((bandNum <4)&&(bandNum>-1)){

            for (calibration_counter = 0; calibration_counter <= 31;
                    calibration_counter++) {
                int32_t power=0;int32_t sumP=0;
               // excntr=calibration_counter-32;
                //return_counter += AD_UPLINK_ATTN(calibration_counter, par_1, par_2);
                if(calibration_counter<=31)
                    write_at_shift_reg_ul(bandNum,calibration_counter);//starting from full attan
                //else{
                   // write_at_shift_reg_ul(bandNum,31);

                 //   set_ad_att_ul(excntr,0);
                //}
              //  return_counter+=set_ad_att_ul(calibration_counter,   bandNum);//ad9361_set_tx_attenuation(phy, 1,calibration_counter);
               // SysCtlDelay(5000);
               // ad9361_spi_write(phy->spi, 0x158, 240);
                SysCtlDelay(1 * 16000000);
               // repeter_calbration_onboard->adc_up[calibration_counter] =
               //         ad9361_spi_read(phy->spi, 0x1A9);
                for(icount=0;icount<4;icount++){
                    read_ad_power_ul(&power,bandNum);
                    sumP=sumP+power;
                }
                power=sumP/icount;
        if(calibration_counter <=31)
                repeter_calibration->calib_data_ar_ul[calibration_counter]= power;//ad9361_spi_read(phy->spi, 0x1A9);
        //else
         //   extraval[calibration_counter]=power;
        //extraval[calibration_counter]=getRxRssiUl(bandNum);
        //extraval[calibration_counter]=getTxRssiUl(bandNum);
               // SysCtlDelay(5000);
            }
    }
    else{
        return_counter=0;
    }
    if (return_counter > 0) {
        program_eeprom_band((uint32_t *)&gTriband_board.repeater_band[bandNum],bandNum+1, sizeof(band_data));
        return return_counter;
    } else {
        return -error_5;
    }
}
*/

/*
 * repeter_calbration_onboard : this is the on board structure
 *                               which contains the variables that are
 *                               required to control the on board operation of the repeter.
 * repeter_calibration: repeter structure to be edited
 * par_1:   notation of AD in terms of controlling
 * par_2:   notation of AD in terms of controlling
 */
int system_calibration_downlink( band_data* repeter_calibration, int bandNum)
 {
    int32_t calibration_counter = 0, return_counter = 0;int32_t icount=0;
    write_at_shift_reg_dl(bandNum,0);
    for (calibration_counter = 0; calibration_counter <= 31;
            calibration_counter++) {
        //return_counter += AD_DOWNLINK_ATTN(calibration_counter, par_1, par_2);
        int32_t power=0;int32_t sumP=0;
        return_counter +=set_ad_att_dl(calibration_counter,   bandNum);//ad9361_set_tx_attenuation(phy, 1,calibration_counter);
       // SysCtlDelay(5000);
       // ad9361_spi_write(phy->spi, 0x158, 240);
        for(icount=0;icount<4;icount++){
            read_ad_power_dl(&power,bandNum);
            sumP=sumP+power;
        }
        power=sumP/power;
      //  SysCtlDelay(16000000);
       // repeter_calbration_onboard->adc_down[calibration_counter] =
       //         ad9361_spi_read(phy->spi, 0x1A9);
       // repeter_calibration->calib_data_ar_dl[calibration_counter]= power;
       // SysCtlDelay(5000);
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
 *                  advised to free the uint8_t* response_data after use
 */

uint8_t *response_repeter(band_data* repeter_response)
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
int applying_data_board(final_attn_band * repeter_program_onboard, band_data* repeter_program,  int bandNum)
 {
    //struct ad9361_rf_phy *mdlphy;
    //struct ad9361_rf_phy *mulphy;
   // memcpy(&repeter_program, &buffer_board_apply[sizeof(sup_header)+sizeof(header)],
   //         sizeof(repeter_program));
    int32_t reply = 0;
    int adnum;
    //DECODE_AD_NUMBER(bandNum,0,adnum);//0 for ul 1 for dl
    //mulphy=ad9361_phy[adnum];
   // DECODE_AD_NUMBER(bandNum,1,adnum);
   // mdlphy=ad9361_phy[adnum];
    reply += set_local_oscillator_downlink(
            repeter_program->Central_frequency_downlink, bandNum);

    reply += set_local_oscillator_uplink(
            repeter_program->Central_frequency_uplink, bandNum);

    repeter_program_onboard->uplink_attn =
            repeter_program->comp_attn_uplink


                    + repeter_program->attn_uplink
                    + (repeter_program->Max_Gain_uplink
                            - repeter_program->Gain_uplink);

//  reply += AD_UPLINK_ATTN(repeter_program_onboard->uplink_final, par_1,par_2);
    reply +=set_ad_att_ul(repeter_program_onboard->uplink_attn,bandNum);//ad9361_set_tx_attenuation(mulphy, 1,repeter_program_onboard->uplink_attn);
    repeter_program_onboard->downlink_attn =
            repeter_program->comp_attn_downlink
                    + repeter_program->attn_downlink
                    + (repeter_program->Max_gain_downlink
                            - repeter_program->Gain_downlink);

    //reply += AD_DOWNLINK_ATTN(repeter_program_onboard->downlink_final, par_1,
    //      par_2);
    reply +=set_ad_att_dl(repeter_program_onboard->downlink_attn,bandNum);//ad9361_set_tx_attenuation(mdlphy, 1,repeter_program_onboard->downlink_attn);//pass another ad adress
    reply += pa_uplink_onoff(repeter_program->PA_uplink, bandNum);
    reply += pa_downlink_onoff(repeter_program->PA_downlink, bandNum);
    if((repeter_program->Testing_Mode) && (repeter_program_onboard->test_counter != 1))
    {
       // ad9361_set_rx_gain_control_mode(mdlphy, 1, 0);
        SysCtlDelay(2000);
        //set the gain at max

        //ad9361_set_rx_rf_gain(mdlphy, 1, 70); //70//74
        set_rx_gain_downlink(70,bandNum);
        SysCtlDelay(1000);
        //ad9361_set_tx_attenuation(mulphy, 1, 20);
        set_rx_gain_uplink(70,bandNum);
        SysCtlDelay(2000);
        repeter_program_onboard->test_counter = 1;
    }
    else if((repeter_program_onboard->test_counter == 1)&&(repeter_program->Testing_Mode == false))
    {
        gLed_State = reset_board;
    }

    return reply;
}

int convertToString(int dataType,void *data,char *part_num,char *dataar,int *len){

    memset(dataar,0,*len);
    switch(dataType){
    case MESG_TOTAL_HUMP_DATA:{
        int i=0;
        band_data *band=(band_data *)data;
        hump_data *bd;
        int bandnum=band->bandType;
        char str[200];
        if((bandnum==1)||(bandnum==2)){
            for(i=0;i<MAX_TOTAL_HUMP_ON_FPGA;i++)//max 16 humps for all bands
            {
                memset(str,0,200);
                if((gHumpInfo_50t[i].band_id==bandnum)&&(gHumpInfo_50t[i].hump_present==1)){
                    bd=&gHumpInfo_50t[i];
                    sprintf(str,"%s,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,",part_num,bd->hump_id,bd->hump_on_off,bd->center_freq_downlink,bd->center_freq_uplink,bd->downlink_comp,
                        bd->uplink_comp,bd->downlink_attn,bd->uplink_attn,bd->start_channel,bd->stop_channel,bd->saw_bandwidth);
                    strcat(dataar,str);
                }
            }
        }
        else{
            for(i=0;i<MAX_TOTAL_HUMP_ON_FPGA;i++)//max 16 humps for all bands
            {
                if((gHumpInfo_35t[i].band_id==bandnum)&&(gHumpInfo_35t[i].hump_present==1)){
                    bd=&gHumpInfo_35t[i];
                     sprintf(str,"%s,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,",part_num,bd->hump_id,bd->hump_on_off,bd->center_freq_downlink,bd->center_freq_uplink,bd->downlink_comp,
                         bd->uplink_comp,bd->downlink_attn,bd->uplink_attn,bd->start_channel,bd->stop_channel,bd->saw_bandwidth);
                     strcat(dataar,str);
                }
            }
        }
        strcat(dataar,"\r");
        *len=strlen(dataar);

        break;
    }
    case MESG_CATEGORY_ALM_DATA://Alarm or Error Data with code
    {

    }
    break;
    case MESG_CATEGORY_SYS_CONFIG_DATA:{//systemDetail
        char str[50];
        system_details *sd=(system_details *)data;
        sprintf(dataar,"%s,",sd->part_number);
        strcat(dataar,sd->system_name);
        strcat(dataar,",");
        strcat(dataar,sd->region_name);
        strcat(dataar,",");
        strcat(dataar,sd->site_name);
        strcat(dataar,",");
        strcat(dataar,sd->site_address);
        strcat(dataar,",");
        strcat(dataar,sd->latitude);
        strcat(dataar,",");
        strcat(dataar,sd->longitude);
        strcat(dataar,",");
        strcat(dataar,sd->caretaker_number);
        strcat(dataar,",");
        itoa(sd->max_pwr,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa(sd->max_hump_1,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa(sd->max_hump_2,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa(sd->max_hump_3,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa(sd->max_hump_4,str,10);
        strcat(dataar,str);
        strcat(dataar,"\r");
        *len=strlen(dataar);
        break;
    }
    case MESG_CATEGORY_BAND_DATA:{//band detail

        band_data *bd=(band_data *)data;
        char str[50];
        sprintf(dataar,"%s,",part_num);
        itoa(bd->bandType,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa((int)bd->lo_enable,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa((int)bd->alc_on_off,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa((int)bd->PA_downlink,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa((int)bd->PA_uplink,str,10);
        strcat(dataar,str);
        strcat(dataar,",");

        itoa((int)bd->total_hump,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa((int)bd->alc_downlink_level,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa((int)bd->alc_uplink_level,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa((int)bd->auto_scale_downlink,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa((int)bd->auto_scale_uplink,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa((int)bd->offset_downlink,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa((int)bd->offset_uplink,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa((int)bd->attn_downlink,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa((int)bd->attn_uplink,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa((int)bd->comp_attn_downlink,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa((int)bd->comp_attn_uplink,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa((int)bd->Gain_downlink,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa((int)bd->Gain_uplink,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa((int)bd->Max_gain_downlink,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa((int)bd->Max_Gain_uplink,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa((int)bd->Central_frequency_downlink,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa((int)bd->Central_frequency_uplink,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa((int)bd->start_frequency,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa((int)bd->stop_frequency,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa((int)bd->ad_lo_def_frequency,str,10);
        strcat(dataar,str);


        strcat(dataar,",");
        itoa((int)bd->calib_max_uplink,str,10);
        strcat(dataar,str);

        strcat(dataar,",");
        itoa((int)bd->calib_max_downlink,str,10);
        strcat(dataar,str);

        strcat(dataar,"\r");
        *len=strlen(dataar);
      //  strcat(dataar,"\n");
        break;
    }
    case MESG_CATEGORY_HUMP_DATA://humpDetail
    {
        hump_data *bd=(hump_data *)data;
        char str[50];
        sprintf(dataar,"%s,",part_num);
        itoa(bd->hump_id,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa((int)bd->hump_on_off,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa((int)bd->center_freq_downlink,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa((int)bd->center_freq_uplink,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa((int)bd->downlink_comp,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa((int)bd->uplink_comp,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa((int)bd->downlink_attn,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa((int)bd->uplink_attn,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa((int)bd->start_channel,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa((int)bd->stop_channel,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa((int)bd->saw_bandwidth,str,10);
        strcat(dataar,str);
        strcat(dataar,"\r");
        *len=strlen(dataar);
        break;
    }
    case MESG_CATEGORY_MODEM_DATA:{//modem detail
        modem *sd=(modem *)data;
        char str[50];
         sprintf(dataar,"%s,",part_num);
         strcat(dataar,sd->LAC);
         strcat(dataar,",");
         strcat(dataar,sd->CELL);
         strcat(dataar,",");
         strcat(dataar,sd->ServerIP);
         strcat(dataar,",");
         strcat(dataar,sd->PORT);
         strcat(dataar,",");
         strcat(dataar,sd->APN);
         strcat(dataar,",");
         strcat(dataar,sd->IMEI);
         strcat(dataar,",");
         strcat(dataar,sd->smsnumber);
         strcat(dataar,",");
         itoa(sd->modem_mode,str,10);
         strcat(dataar,str);
         strcat(dataar,",");
         itoa(sd->modem_tech,str,10);
         strcat(dataar,str);

         strcat(dataar,",");
         strcat(dataar,sd->caretakerNumber);
          strcat(dataar,str);

          strcat(dataar,",");
           itoa(sd->network_selection,str,10);
           strcat(dataar,str);

           strcat(dataar,",");
            itoa(sd->testMode,str,10);
            strcat(dataar,str);

        // itoa(sd->smsnumber,str,10);

         strcat(dataar,"\r");
         *len=strlen(dataar);
         break;
    }
    case MESG_CATEGORY_FREQ_DATA://frequent data;
    {
        /*
        repeter_power *rp=(repeter_power *)data;
        char str[50];
        sprintf(dataar,"%s,",part_num);
        itoa(rp->band_num,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa((int)rp->uplink_power_input,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa((int)rp->uplink_power_output,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa((int)rp->downlink_power_input,str,10);
        strcat(dataar,str);
        strcat(dataar,",");
        itoa((int)rp->downlink_power_output,str,10);
        strcat(dataar,str);
        strcat(dataar,"\r");
        *len=strlen(dataar);
        *len=strlen(dataar);*/
        break;
    }
    case MESG_CATEGORY_CALIB_DATA:{
        band_data *bd=(band_data *)data;
        sprintf(dataar,"%s,%d,%d,%d,%d,%d,%d,%d,%d\r",part_num,bd->calib_max_uplink,bd->calib_max_downlink,bd->ad_ul_calib_coefficient.coeff,bd->ad_ul_calib_coefficient.avgX,bd->ad_ul_calib_coefficient.avgY
        ,bd->ad_ul_calib_coefficient.coeff,bd->ad_ul_calib_coefficient.avgX,bd->ad_ul_calib_coefficient.avgY);
        *len=strlen(dataar);
        break;
    }

    }
    return 0;
}
int stringToStruct(int dataType, char *str,void *Outstruct){
    int err=0;
    int system_restart=0;
    char dataArray[50][30];
    char *token;
    int paramNum=0;
    const char s[2] = ",";//separator
    int pos=0;
     /* get the first token */
     token = strtok(str, s);
     strcpy(dataArray[paramNum],token);
     paramNum++;
     /* walk through other tokens */
     while( token != NULL ) {
       // printf( "%s\n", token );

        token = strtok(NULL, s);
        strcpy(dataArray[paramNum],token);
        paramNum++;
     }
     switch(dataType){
     case MESG_CATEGORY_ALM_DATA:{

     }
     break;
     case MESG_CATEGORY_CALIB_DATA:{
         band_data *bd=(band_data *)Outstruct;
         if(paramNum>=5){//
             pos++;//for part num
             bd->calib_max_uplink=atoi(dataArray[pos++]);
             bd->calib_max_downlink=atoi(dataArray[pos++]);
             system_restart=1;
             //bd->calib_max_count_ul=atoi(dataArray[pos++]);
             //bd->calib_max_count_dl=atoi(dataArray[pos++]);
         }
         break;
     }
     case MESG_CATEGORY_SYS_CONFIG_DATA:{
         char str[50];
         system_details *sd=(system_details *)Outstruct;
         if(paramNum>=15){
             int number=0;
             strcpy(sd->part_number,dataArray[pos++]);
             strcpy(sd->system_name,dataArray[pos++]);
             strcpy(sd->region_name,dataArray[pos++]);
             strcpy(sd->site_name,dataArray[pos++]);
             strcpy(sd->site_address,dataArray[pos++]);
             strcpy(sd->latitude,dataArray[pos++]);
             strcpy(sd->longitude,dataArray[pos++]);
             strcpy(sd->caretaker_number,dataArray[pos++]);
             sd->max_pwr=atoi(dataArray[pos++]);
             number=atoi(dataArray[pos++]);
             if(sd->max_hump_1!=number){//old one is not equal to new one
                 sd->max_hump_1=number;
                 system_restart=1;
             }
             number=atoi(dataArray[pos++]);
             if(sd->max_hump_2!=number){//old one is not equal to new one
                 sd->max_hump_2=number;
                 system_restart=1;
             }
              number=atoi(dataArray[pos++]);
              if(sd->max_hump_3!=number){//old one is not equal to new one
                  sd->max_hump_3=number;
                  system_restart=1;
              }
             number=atoi(dataArray[pos++]);
             if(sd->max_hump_4!=number){//old one is not equal to new one
                 sd->max_hump_4=number;
                 system_restart=1;
             }
         }
         else
             err=-1;
     }
     break;
     case MESG_CATEGORY_BAND_DATA:{
         band_data *bd=(band_data *)Outstruct;
         if(paramNum>=21){//27
             int number=0;
             pos++;//for part num
             bd->bandType=atoi(dataArray[pos++]);
             bd->lo_enable=atoi(dataArray[pos++]);
             bd->alc_on_off=atoi(dataArray[pos++]);
             bd->PA_downlink=atoi(dataArray[pos++]);
             bd->PA_uplink=atoi(dataArray[pos++]);
             number=atoi(dataArray[pos++]);
             bd->total_hump=number;
             /*if(number<=gTriband_board.sys_detail.max_hump_1){
                  bd->total_hump=number;
                  system_restart=1;
             }
             */
             bd->alc_downlink_level=atoi(dataArray[pos++]);
             bd->alc_uplink_level=atoi(dataArray[pos++]);
             bd->auto_scale_downlink=atoi(dataArray[pos++]);
             bd->auto_scale_uplink=atoi(dataArray[pos++]);
             bd->offset_downlink=atoi(dataArray[pos++]);
             bd->offset_uplink=atoi(dataArray[pos++]);
            bd->attn_downlink=atoi(dataArray[pos++]);
             bd->attn_uplink=atoi(dataArray[pos++]);
            bd->comp_attn_downlink=atoi(dataArray[pos++]);
            bd->comp_attn_uplink=atoi(dataArray[pos++]);
            bd->Gain_downlink=atoi(dataArray[pos++]);
            bd->Gain_uplink=atoi(dataArray[pos++]);
            bd->Max_gain_downlink=atoi(dataArray[pos++]);
            bd->Max_Gain_uplink=atoi(dataArray[pos++]);
            number=atoi(dataArray[pos++]);
            if(bd->Central_frequency_downlink!=number){
                bd->Central_frequency_downlink=number;
                system_restart=1;
            }
            number=atoi(dataArray[pos++]);
            if(bd->Central_frequency_uplink!=number){
                bd->Central_frequency_uplink=number;
                system_restart=1;
            }
            bd->start_frequency=atoi(dataArray[pos++]);
            bd->stop_frequency=atoi(dataArray[pos++]);
            bd->ad_lo_def_frequency=bd->Central_frequency_downlink;//atoi(dataArray[pos++]);
      //      bd->calib_max_count_ul=atoi(dataArray[pos++]);
      //      bd->calib_max_count_dl=atoi(dataArray[pos++]);
             // strcpy(bd->bandType,itoa(dataArray[10]));

         }
         else
             err=-1;
     }
     break;
     case MESG_CATEGORY_HUMP_DATA:{
          hump_data *hd=(hump_data *)Outstruct;
          if(paramNum>=11){
              int number=0;
              pos++;//for part num
              pos++;// do not store humpid              hd->hump_id=atoi(dataArray[pos++]);
              number=atoi(dataArray[pos++]);
              if(hd->hump_on_off!=number){
                   hd->hump_on_off=number;
                   system_restart=1;
               }
              number=atoi(dataArray[pos++]);
              if(hd->center_freq_downlink!=number){
                    hd->center_freq_downlink=number;
                    system_restart=1;
               }
              number=atoi(dataArray[pos++]);
              if(hd->center_freq_uplink!=number){
                    hd->center_freq_uplink=number;
                    system_restart=1;
               }
             hd->downlink_comp=atoi(dataArray[pos++]);
             hd->uplink_comp=atoi(dataArray[pos++]);
              hd->downlink_attn=atoi(dataArray[pos++]);
              hd->uplink_attn=atoi(dataArray[pos++]);
              number=atoi(dataArray[pos++]);
              if(hd->start_channel!=number){
                    hd->start_channel=number;
                    system_restart=1;
               }
              number=atoi(dataArray[pos++]);
              if(hd->stop_channel!=number){
                    hd->stop_channel=number;
                    system_restart=1;
               }
              hd->saw_bandwidth=atoi(dataArray[pos++]);
          }
          else
              err=-1;
     }
     break;
     case MESG_CATEGORY_MODEM_DATA:{
         modem *sd=(modem *)Outstruct;
         if(paramNum>=10){

             strcpy(sd->LAC,(dataArray[pos++]));
             strcpy(sd->CELL,(dataArray[pos++]));
             strcpy(sd->ServerIP,(dataArray[pos++]));
             strcpy(sd->PORT,(dataArray[pos++]));
             strcpy(sd->APN,(dataArray[pos++]));
             strcpy(sd->IMEI,dataArray[pos++]);
             strcpy(sd->smsnumber,dataArray[pos++]);
             sd->modem_mode=atoi(dataArray[pos++]);
             sd->modem_tech=atoi(dataArray[pos++]);
             strcpy(sd->caretakerNumber,dataArray[pos++]);
             sd->network_selection=atoi(dataArray[pos++]);
             sd->testMode=atoi(dataArray[pos++]);
//restart modem from here;
             // sd->smsnumber=atoi(dataArray[pos++]);


         }
         else
             err=-1;
     }
     break;
     case MESG_CATEGORY_FREQ_DATA:{

     }
     break;
     }
     if(system_restart==1)
         err=1;
     return err;
}
