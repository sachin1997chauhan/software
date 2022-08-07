/*
 * eepromHandler.h
 *
 *  Created on: Nov 16, 2020
 *      Author: frogcell
 */

#ifndef TRIBAND1_2_3_EEPROMHANDLER_H_
#define TRIBAND1_2_3_EEPROMHANDLER_H_


void  program_eeprom(uint32_t* data, int32_t start_address,int length);
//void  program_eeprom_band(uint32_t* data, int32_t bandnum,int length);
void read_eeprom_system(uint32_t* reading_system, int32_t start_address,int length);
void  read_all_data();
void  program_eeprom_band(uint32_t* data, int32_t bandnum);

#endif /* TRIBAND1_2_3_EEPROMHANDLER_H_ */
