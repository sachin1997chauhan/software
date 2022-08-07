/*
 * storing_reading_data.h
 *
 *  Created on: Mar 22, 2019
 *      Author: FCS-RN5
 */

#ifndef STORING_READING_DATA_H_
#define STORING_READING_DATA_H_

#include <string.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include "errors.h"
#include "driverlib/sysctl.h"
#include "driverlib/eeprom.h"
#include "stracture_all.h"
//extern repeter_on_board repeter1,repeter2,repeter3, repeter4;
extern system_details system1;

void program_eeprom_system(system_details* storing_system, int32_t address_system);
void read_eeprom_system(system_details* reading_system, int32_t address_system);

void program_eeprom_repeter(band* storing_repeter, int32_t address);
void read_eeprom_repeter(band* reading_repeter, int32_t address);


#endif /* STORING_READING_DATA_H_ */
