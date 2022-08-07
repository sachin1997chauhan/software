/*
 * eepromHandler.c
 *
 *  Created on: Nov 16, 2020
 *      Author: frogcell
 */
#include <stdbool.h>
#include <stdint.h>
#include "driverlib/eeprom.h"
#include "definitions.h"
extern repeater_board gTriband_board;
extern hump_data gHumpInfo_50t[MAX_TOTAL_HUMP_ON_FPGA];//max  humps for all bands
extern hump_data gHumpInfo_35t[MAX_TOTAL_HUMP_ON_FPGA];
#define EEPROM_LAST_ADDRESS 6144

void  program_eeprom(uint32_t* data, int32_t start_address,int length)
 {
    EEPROMInit();

    EEPROMProgram(data, start_address,length);

}
void  program_eeprom_band(uint32_t* data, int32_t bandnum)
 {
    EEPROMInit();
if(bandnum==1)
    EEPROMProgram(data, EEPROM_BAND_ADDRESS(1),sizeof(band_data));
else if(bandnum==2)
    EEPROMProgram(data, EEPROM_BAND_ADDRESS(2),sizeof(band_data));
else if(bandnum==3)
    EEPROMProgram(data, EEPROM_BAND_ADDRESS(3),sizeof(band_data));
else if(bandnum==4)
    EEPROMProgram(data, EEPROM_BAND_ADDRESS(4),sizeof(band_data));

}
void  read_eeprom_system(uint32_t* reading_system, int32_t start_address,int length)
{

    EEPROMInit();
    EEPROMRead(reading_system,start_address, length);

}

void read_all_data(){
    uint32_t reading_system[400];

    EEPROMInit();
    volatile int sz=EEPROMSizeGet();
    EEPROMRead(reading_system,EEPROM_SYSTEM_ADDRESS, sizeof(system_details));//140
    memcpy((char *)&gTriband_board.sys_detail,(char *)reading_system,sizeof(system_details));
    EEPROMRead(reading_system,EEPROM_MODEM_ADDRESS, sizeof(modem));//121
    memcpy((char *)&gTriband_board.modem_detail,(char *)reading_system,sizeof(modem));
    EEPROMRead(reading_system,EEPROM_BAND_ADDRESS(1), sizeof(band_data));//52
    memcpy((char *)&gTriband_board.repeater_band[0],(char *)reading_system,sizeof(band_data));
    EEPROMRead(reading_system,EEPROM_BAND_ADDRESS(2), sizeof(band_data));
    memcpy((char *)&gTriband_board.repeater_band[1],(char *)reading_system,sizeof(band_data));
    EEPROMRead(reading_system,EEPROM_BAND_ADDRESS(3), sizeof(band_data));
    memcpy((char *)&gTriband_board.repeater_band[2],(char *)reading_system,sizeof(band_data));
    EEPROMRead(reading_system,EEPROM_BAND_ADDRESS(4), sizeof(band_data));
    memcpy((char *)&gTriband_board.repeater_band[3],(char *)reading_system,sizeof(band_data));
    EEPROMRead(reading_system,EEPROM_HUMP_FPGA1_ADDRESS, sizeof(gHumpInfo_50t)); //192
    memcpy((char *)&gHumpInfo_50t[0],(char *)reading_system,sizeof(gHumpInfo_50t));
    EEPROMRead(reading_system,EEPROM_HUMP_FPGA2_ADDRESS, sizeof(gHumpInfo_35t));
    memcpy((char *)&gHumpInfo_35t[0],(char *)reading_system,sizeof(gHumpInfo_35t));
    EEPROMRead(reading_system,EEPROM_HUMP_FPGA2_ADDRESS, sizeof(gHumpInfo_35t));
    memcpy((char *)&gHumpInfo_35t[0],(char *)reading_system,sizeof(gHumpInfo_35t));
    EEPROMRead(reading_system,EEPROM_PREV_ALARM_STATE_ADDRESS, sizeof(Alarm));
    memcpy((char *)&gTriband_board.prevAlarm,(char *)reading_system,sizeof(Alarm));//27
    //0x00001800 is the last address
    //total size= 140+121+(4*52)+(2*192)+27

}
/*

void program_eeprom_repeter(band* storing_repeter, int32_t address)
{
    EEPROMInit();
    int32_t system_store_details[sizeof(storing_repeter)];
    memcpy(&system_store_details[0], (int32_t*)&storing_repeter, sizeof(storing_repeter));
    EEPROMProgram(system_store_details, address,sizeof(storing_repeter));
    free(system_store_details);
}

void read_eeprom_repeter(band* reading_repeter, int32_t address)
 {
    int32_t system_read_details[sizeof(reading_repeter)];
    EEPROMInit();
    EEPROMRead(system_read_details,address, sizeof(reading_repeter));
    memcpy(&reading_repeter, &system_read_details[0], sizeof(reading_repeter));
    free(system_read_details);
 }

void read_eeprom_data(void)
 {
    read_eeprom_system(&gTriband_board.sys_detail, system_details_address);
    read_eeprom_repeter(&gTriband_board.repeater_band[0], repeter1_address);
    read_eeprom_repeter(&gTriband_board.repeater_band[1], repeter2_address);
    read_eeprom_repeter(&gTriband_board.repeater_band[2], repeter3_address);
    read_eeprom_repeter(&gTriband_board.repeater_band[3], repeter4_address);
}
*/
