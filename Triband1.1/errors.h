/*
 * errors.h
 *
 *  Created on: Mar 7, 2019
 *      Author: FCS-RN5
 */

#ifndef ERRORS_H_
#define ERRORS_H_

extern volatile enum
{
	error_0,
	error_1,	//lo set error
	error_2,	//alc fault
	error_3,	//turn red led on
	error_4,	//system detail
	error_5,	//calibration error
	error_6,	//data error
	error_7,
}error_list;



#endif /* ERRORS_H_ */
