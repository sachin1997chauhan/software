/*
 * define_files.h
 *
 *  Created on: Mar 22, 2019
 *      Author: FCS-RN5
 */

#ifndef DEFINE_FILES_H_
#define DEFINE_FILES_H_

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

#endif /* DEFINE_FILES_H_ */
