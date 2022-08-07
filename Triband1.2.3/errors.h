/*
 * errors.h
 *
 *  Created on: Mar 7, 2019
 *      Author: FCS-RN5
 */

#ifndef TRIBAND1_2_3_ERRORS_H_
#define TRIBAND1_2_3_ERRORS_H_

 enum
{
    error_0,
    error_1,    //lo set error
    error_2,    //alc fault
    error_3,    //turn red led on
    error_4,    //system detail
    error_5,    //calibration error
    error_6,    //data error
    error_7,
}eError_list;

enum eAdErrorList{
    SUCESS,
    FAIL,
    AD_INIT1_ERROR,
    COMM_PORT_ERROR,

};
#define BAND_PARAM_SET_ERROR    1
#define BAND_PARAM_GET_ERROR    2
#define HUMP_PARAM_SET_ERROR    3
#define HUMP_PARAM_GET_ERROR    4
#define SYS_DET_SET_ERROR    6
#define SYS_DET_GET_ERROR    7
#define MOD_PARAM_SET_ERROR    8
#define MOD_PARAM_GET_ERROR   9

#endif /* TRIBAND1_2_3_ERRORS_H_ */
