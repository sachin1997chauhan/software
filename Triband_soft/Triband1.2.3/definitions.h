/*
 * definitions.h
 *
 *  Created on: Nov 13, 2020
 *      Author: frogcell
 */

#ifndef TRIBAND1_2_3_DEFINITIONS_H_
#define TRIBAND1_2_3_DEFINITIONS_H_

#include <stdbool.h>
#define _LOG_DATA_  1
#define M800_SMS 0
#define M7600_SMS 1
#define M800_GPRS 2
#define M7600_GPRS 3

#define adc_clb 31

#define SPI_1
#define SPI_2
#define SPI_3
#define SPI_4
#define SPI_5
#define SPI_6
#define SPI_7
#define SPI_8
#define watchdog
#define TIMER_0

#define repeter1_address  0x04
#define repeter2_address  repeter1_address+(sizeof(band))
#define repeter3_address  repeter2_address+(sizeof(band))
#define repeter4_address  repeter3_address+(sizeof(band))

#define system_details_address  repeter4_address + (sizeof(band))

#define SYSTICKS_PER_SECOND     1000
#define SYSTICK_PERIOD_MS (10000 / SYSTICKS_PER_SECOND)
#define MAX_SEND_DELAY          500 //1/2 second
#define MAX_BAND 4;

#define MESG_CATEGORY_ALM_DATA   1
#define MESG_CATEGORY_SYS_CONFIG_DATA   2
#define MESG_CATEGORY_BAND_DATA   3
#define MESG_CATEGORY_HUMP_DATA   4
#define MESG_CATEGORY_MODEM_DATA   5
#define MESG_CATEGORY_FREQ_DATA   6
#define MESG_CATEGORY_CALIB_DATA   7
#define MESG_CATEGORY_OTH_DATA   8
#define EXTERNAL_PA 1
#define INTERNAL_PA 2
#define MAX_TOTAL_HUMP_ON_FPGA  8
#define MESG_TOTAL_HUMP_DATA   9

#define ALARM_SET 1
#define ALARM_CLEAR 2
#define NO_ALARM    0

typedef enum _eErrorNum
{
    AD_INIT_ERROR=1,
    AD_CALIB_ERROR,
    PARAM_SAVE_ERROR,
    PARAM_GET_ERROR,
   SYSTEM_FAULT,
}eErrorNum;

typedef struct _prevPeripheralState{
   signed char prevElectricityState;
   signed char ElectricityState;
   signed char prevDLOutPower[4];
   signed char prevULOutPower[4];
   signed char DLOutPower[4];
   signed char ULOutPower[4];
   signed char prevDLInPower[4];
   signed char prevULInPower[4];
   signed char DLInPower[4];
   signed char ULInPower[4];

   signed char prevPAState[4];//pa alarm state pa current in case of external
   signed char PAState[4];
   signed char PrevPADl_state[4]; //to check PA on off at runtime
   signed char PrevPAUl_state[4]; //to check PA on off
}prevPeripheralState;
typedef enum _eLED_STATE
{
    red_green,
    red_steady,
    red_blink,
    green_steady,
    green_blink,
    reset_board,
}eLED_STATE;
typedef enum _eAlarmID //at send time use this for communication
{
    ELECTRICITY_ALM=1,
    VCO_ALM,
   OVER_PWR_UL_ALM,
   LOW_PWR_UL_ALM,
   OVER_PWR_DL_ALM,
   LOW_PWR_DL_ALM,
  TEMP_ALM,
}eAlarmID;
typedef struct _Alarm {
    char electricity_alm;
    char temp_alm;
    char vco_fail_alm[8];//for 8 ad
    char over_pwr_dl[4];//separate band
    char over_pwr_ul[4];//separate band
    char low_pwr_dl[4];//separate band
    char low_pwr_ul[4];//separate band
    char vswr_alm;
}Alarm;
typedef enum _eCommandlist
{
    /*                          all band 1 criteria                                 */
    GET_SYSTEM_DETAIL,
    SET_SYSTEM_DETAIL,
    get_band_detail,
    set_band_detail,
    get_band_calib_data,
    set_band_calib_data,
    GET_ALARM_DATA,
    NO_use2,
    get_band_hump_detail,
    set_band_hump_detail,
    GET_MODEM_DETAIL,
    SET_MODEM_DETAIL,

    get_maintenance,
    set_maintenance,
    get_alarm_detail,
    set_alarm_detail,
    GET_PROTOCOL_VERSION,
    CLEAR_HUMP_DATA,
    board_RESET,
    GET_TOTAL_HUMP,
    START_CALIBRATION_UL,
    START_CALIBRATION_DL,
    MODEM_RESET,
    UNSYNC_ALARM,

}eCOMMANDS;
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

typedef struct _sup_header {
    char  main_header[3];
    char COMMANDS;
    uint16_t datalen;
}sup_header;
typedef struct {
    char band_num;
    char hump_no;
}header;

typedef struct _hump_data{

    unsigned hump_id : 6;
    unsigned band_id : 4;
    unsigned hump_present: 1;
    unsigned hump_on_off:1;

    int32_t center_freq_downlink;
    int32_t center_freq_uplink;
    int8_t downlink_comp,downlink_attn,uplink_comp, uplink_attn;
    int16_t start_channel;
    int16_t stop_channel;
    int16_t saw_bandwidth;
}hump_data;
/*typedef struct _hump_data{
    char hump_id;
    char band_num;//band array
    bool hump_on_off;

    int32_t center_freq_downlink;
    int32_t center_freq_uplink;
    int8_t downlink_comp,downlink_attn,uplink_comp, uplink_attn;
    int16_t start_channel;
    int16_t stop_channel;
}hump_data;
*/
typedef struct _modem{
    char  LAC[10];
    char  CELL[10];
    char  ServerIP[16];
    char  PORT[5];
    char  APN[30];
    char  IMEI[16];
    char smsnumber[15];
    char modem_mode;//sms or gprs sms 1 gprs 0
    char modem_tech;//o for 2g or  1 for 4g
    char caretakerNumber[15];
    char network_selection;//in case of 4 g it is network selection
    char testMode;
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
    int max_pwr;
    char max_hump_1;
    char max_hump_2;//1 and two for 50 t
    char max_hump_3;
    char max_hump_4; // 3 and 4 for 35t
    //modem modem_details;
}system_details;


typedef struct _repeter_runtime_power{
    char band_num;
    /*int8_t uplink_power_input;
    int8_t uplink_power_output;
    int8_t downlink_power_input;
    int8_t downlink_power_output;
    */
    int8_t cur_ad_power_dl;
    int8_t cur_ad_power_ul;
    int8_t prev_attn_val_ad_dl;
    int8_t prev_attn_val_ad_ul;
    int8_t prev_attn_val_dca_dl;
    int8_t prev_attn_val_dca_ul;

    int8_t cur_attn_val_dca_dl;
    int8_t cur_attn_val_dca_ul;
    int8_t cur_attn_val_ad_dl;
    int8_t cur_attn_val_ad_ul;

}repeter_runtime_power;
typedef struct{
    /*
     * adc_up:  The ADC value list noted for the uplink path of the repeter
     * adc_down: The ADC value list noted for the downlink path of the repeter
     */
    //int32_t adc_up[32], adc_down[32];
    /*
     * uplink_final: final attenuation that has to be applied to the uplink path
     * downlink_final: final attenuation that has to be applied to the downlink path
     */
    int32_t uplink_attn, downlink_attn;
    int32_t prev_uplink_attn, prev_downlink_attn;
    /*
     * test_counter: just a counter to see if test mode is turned off after being used
     */
    int test_counter;

}final_attn_band;
/*
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
    hump *repHump;
    repeter_power power;
    //system_details sys_detail;
    //modem *modem_detail;
    adc_count_band adc_count_var;
}band;
*/

typedef struct {
    char bandnum;//euqal to bandarray+1
    char bandType;

    bool lo_enable;
    bool alc_on_off;
    bool PA_auto_on_off;
    bool PA_downlink, PA_uplink;
    bool Testing_Mode;

    char total_hump;
    int calib_max_uplink, calib_max_downlink;

    char alc_downlink_level, alc_uplink_level;

    char auto_scale_downlink, auto_scale_uplink;

    char offset_downlink, offset_uplink;

    char comp_attn_downlink;//, comp_attn_downlink_AD;
    char attn_downlink;//, attn_downlink_AD;

    char comp_attn_uplink;//, comp_attn_uplink_AD;
    char attn_uplink;//, attn_uplink_AD;

    char Gain_downlink, Gain_uplink;

    char Max_gain_downlink, Max_Gain_uplink;

    int16_t Central_frequency_downlink, Central_frequency_uplink;
    int16_t start_frequency, stop_frequency;
    int16_t ad_lo_def_frequency;
  //  int16_t power;
    //system_details sys_detail;
    //modem *modem_detail;
   // adc_count_band adc_count_var;
    int16_t calib_data_ar_ul[31];
    int16_t calib_data_ar_dl[31];
       char paUl_type;
    char paDl_type;

}band_data1;
typedef struct _calib_coeffi{
    int avgX,avgY;
    float coeff;
}calib_coeffi;

typedef struct _band_data{
    char bandnum;//euqal to bandarray+1
    char     bandType ;

    unsigned lo_enable :1;
    unsigned alc_on_off:1;
    unsigned PA_auto_on_off:1;
    unsigned PA_downlink :1;
    unsigned PA_uplink:1;
    unsigned Testing_Mode:1;

    unsigned total_hump : 4;
    unsigned  paUl_type :1;
    unsigned  paDl_type :1;

    signed char calib_max_uplink, calib_max_downlink;

    signed char alc_downlink_level, alc_uplink_level;

    char auto_scale_downlink, auto_scale_uplink;

    signed char offset_downlink, offset_uplink;

    char comp_attn_downlink;//, comp_attn_downlink_AD;
    char attn_downlink;//, attn_downlink_AD;

    char comp_attn_uplink;//, comp_attn_uplink_AD;
    char attn_uplink;//, attn_uplink_AD;

    char Gain_downlink, Gain_uplink;

    char Max_gain_downlink, Max_Gain_uplink;

    int16_t Central_frequency_downlink, Central_frequency_uplink;
    int16_t start_frequency, stop_frequency;
    int16_t ad_lo_def_frequency;
    calib_coeffi ad_ul_calib_coefficient;
    calib_coeffi ad_dl_calib_coefficient;
  //  repeter_power power;
    //system_details sys_detail;
    //modem *modem_detail;
   // adc_count_band adc_count_var;
  //  char paUl_type;
  //  char paDl_type;
   // int16_t calib_data_ar_ul[31];
   // int16_t calib_data_ar_dl[31];
   // int ptrHumpInfo[8];
 //   hump_data repHump[5];//max 5 hump
    char calibstateUl; //0 no calib, 1 calib_start, 2 calib_stop
    char calibstateDl;
}band_data;

/*
typedef struct {
    repeter REPETER_1, REPETER_2, REPETER_3, REPETER_4;
    system_details SYSTEM1;
}complete_data;
*/

typedef struct {
    band_data repeater_band[4];//max band on triband dcs1 and dcs2 are separate
    modem modem_detail;
    system_details sys_detail;
    Alarm prevAlarm;
}repeater_board;
#define HUMP_SIZE (MAX_TOTAL_HUMP_ON_FPGA*sizeof(hump_data))

#define EEPROM_SYSTEM_ADDRESS   8
#define EEPROM_MODEM_ADDRESS   EEPROM_SYSTEM_ADDRESS+sizeof(system_details)
#define EEPROM_BAND1_ADDRESS   EEPROM_MODEM_ADDRESS+sizeof(modem)
#define EEPROM_BAND2_ADDRESS   EEPROM_BAND1_ADDRESS+sizeof(band_data)
#define EEPROM_BAND3_ADDRESS   EEPROM_BAND2_ADDRESS+sizeof(band_data)
#define EEPROM_BAND4_ADDRESS   EEPROM_BAND3_ADDRESS+sizeof(band_data)
#define EEPROM_HUMP_FPGA1_ADDRESS    EEPROM_BAND4_ADDRESS+sizeof(band_data)
#define EEPROM_HUMP_FPGA2_ADDRESS    EEPROM_HUMP_FPGA1_ADDRESS+HUMP_SIZE
#define EEPROM_PREV_ALARM_STATE_ADDRESS EEPROM_HUMP_FPGA2_ADDRESS+HUMP_SIZE

#define EEPROM_OTHER_INFO_ADDRESS EEPROM_PREV_ALARM_STATE_ADDRESS+size

//#define MOU_READ_CALLBACK(n) &mou_read_callback_##n ADDRESS
#define EEPROM_BAND_ADDRESS(band)    EEPROM_BAND##band##_ADDRESS
/*#define EEPROM_HUMP1_ADDRESS   EEPROM_BAND4_ADDRESS+sizeof(eeprom_band_data)
#define EEPROM_HUMP2_ADDRESS   EEPROM_HUMP1_ADDRESS+sizeof(eeprom_hump_data)
#define EEPROM_HUMP3_ADDRESS   EEPROM_HUMP2_ADDRESS+sizeof(eeprom_hump_data)
#define EEPROM_HUMP4_ADDRESS   EEPROM_HUMP3_ADDRESS+sizeof(eeprom_hump_data)
#define EEPROM_HUMP5_ADDRESS   EEPROM_HUMP4_ADDRESS+sizeof(eeprom_hump_data)
#define EEPROM_HUMP6_ADDRESS   EEPROM_HUMP5_ADDRESS+sizeof(eeprom_hump_data)
#define EEPROM_HUMP7_ADDRESS   EEPROM_HUMP6_ADDRESS+sizeof(eeprom_hump_data)
#define EEPROM_HUMP8_ADDRESS   EEPROM_HUMP7_ADDRESS+sizeof(eeprom_hump_data)
#define EEPROM_HUMP9_ADDRESS   EEPROM_BAND4_ADDRESS+sizeof(eeprom_hump_data)
#define EEPROM_HUMP10_ADDRESS   EEPROM_HUMP9_ADDRESS+sizeof(eeprom_hump_data)
#define EEPROM_HUMP11_ADDRESS   EEPROM_HUMP10_ADDRESS+sizeof(eeprom_hump_data)
#define EEPROM_HUMP12_ADDRESS   EEPROM_HUMP11_ADDRESS+sizeof(eeprom_hump_data)
#define EEPROM_HUMP13_ADDRESS   EEPROM_HUMP12_ADDRESS+sizeof(eeprom_hump_data)
#define EEPROM_HUMP14_ADDRESS   EEPROM_HUMP13_ADDRESS+sizeof(eeprom_hump_data)
#define EEPROM_HUMP15_ADDRESS   EEPROM_HUMP14_ADDRESS+sizeof(eeprom_hump_data)
#define EEPROM_HUMP16_ADDRESS   EEPROM_HUMP15_ADDRESS+sizeof(eeprom_hump_data)
#define EEPROM_HUMP17_ADDRESS   EEPROM_HUMP16_ADDRESS+sizeof(eeprom_hump_data)
#define EEPROM_HUMP18_ADDRESS   EEPROM_HUMP17_ADDRESS+sizeof(eeprom_hump_data)
#define EEPROM_HUMP19_ADDRESS   EEPROM_HUMP18_ADDRESS+sizeof(eeprom_hump_data)
#define EEPROM_HUMP20_ADDRESS   EEPROM_HUMP19_ADDRESS+sizeof(eeprom_hump_data)
#define EEPROM_HUMP21_ADDRESS   EEPROM_HUMP20_ADDRESS+sizeof(eeprom_hump_data)
#define EEPROM_HUMP22_ADDRESS   EEPROM_HUMP21_ADDRESS+sizeof(eeprom_hump_data)
#define EEPROM_HUMP23_ADDRESS   EEPROM_HUMP22_ADDRESS+sizeof(eeprom_hump_data)
#define EEPROM_HUMP24_ADDRESS   EEPROM_HUMP23_ADDRESS+sizeof(eeprom_hump_data)
#define EEPROM_HUMP25_ADDRESS   EEPROM_HUMP24_ADDRESS
*/
#define DECODE_AD_NUMBER(band,Dl,retval) \
    if(Dl==0) retval=band*2;\
else \
    retval=(band*2)+1;

#endif /* TRIBAND1_2_3_DEFINITIONS_H_ */
