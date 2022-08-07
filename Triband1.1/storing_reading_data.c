/*
 * storing_reading_data.c
 *
 *  Created on: Mar 22, 2019
 *      Author: FCS-RN5
 */

#include "storing_reading_data.h"


void program_eeprom_system(system_details* storing_system, int32_t address_system)
 {
	EEPROMInit();
	int32_t system_store_details[sizeof(storing_system)];
	memcpy(&system_store_details[0], (int32_t*)&storing_system, sizeof(storing_system));
	EEPROMProgram(system_store_details, address_system,sizeof(storing_system));
	free(system_store_details);
}

void read_eeprom_system(system_details* reading_system, int32_t address_system)
{
	int32_t system_read_details[sizeof(reading_system)];
	EEPROMInit();
	EEPROMRead(system_read_details,address_system, sizeof(reading_system));
	memcpy(&reading_system, &system_read_details[0], sizeof(reading_system));
	free(system_read_details);
}


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


