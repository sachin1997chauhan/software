/*
 * paHandler.c
 *
 *  Created on: Nov 19, 2020
 *      Author: frogcell
 */

#include <stdbool.h>
#include <stdint.h>
#include "driverlib/gpio.h"
#include "inc/hw_gpio.h"
#include "inc/hw_memmap.h"
#include "definitions.h"
#include "paHandler.h"
int configure_pa_uplink(band_data* band){
    if(band->paUl_type==EXTERNAL_PA){
        //prepare ADC for reading the power

    }
}
int configure_pa_downlink(band_data* band){
    if(band->paDl_type==EXTERNAL_PA){
        //prepare ADC for reading the power
    }
}

int pa_uplink_onoff(bool onn, int bandType)
 {
    switch (bandType) {
        case 0: {
            onn==1? GPIOPinWrite(GPIO_PORTG_BASE, GPIO_PIN_0, GPIO_PIN_0): GPIOPinWrite(GPIO_PORTG_BASE, GPIO_PIN_0, ~GPIO_PIN_0);
        }
        break;
        case 1: {
            onn==1? GPIOPinWrite(GPIO_PORTJ_BASE, GPIO_PIN_0, GPIO_PIN_0): GPIOPinWrite(GPIO_PORTJ_BASE, GPIO_PIN_0, ~GPIO_PIN_0);
        }
        break;
        case 2: {
            onn==1? GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_0, GPIO_PIN_0): GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_0, ~GPIO_PIN_0);
        }
        break;
        case 3: {
            onn==1? GPIOPinWrite(GPIO_PORTB_BASE, GPIO_PIN_4, GPIO_PIN_4): GPIOPinWrite(GPIO_PORTB_BASE, GPIO_PIN_4, ~GPIO_PIN_4);
        }
        break;
        default:
            break;
    }
    return 0;
}

int pa_downlink_onoff(bool onn, int bandType)
 {
    switch (bandType) {
    case 0: {
        onn==true? GPIOPinWrite(GPIO_PORTG_BASE, GPIO_PIN_1, GPIO_PIN_1): GPIOPinWrite(GPIO_PORTG_BASE, GPIO_PIN_1, ~GPIO_PIN_1);
     }
        break;
    case 1: {
        onn==true? GPIOPinWrite(GPIO_PORTJ_BASE, GPIO_PIN_1, GPIO_PIN_1): GPIOPinWrite(GPIO_PORTJ_BASE, GPIO_PIN_1, ~GPIO_PIN_1);

    }
    break;
    case 2: {
        onn==true? GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_1, GPIO_PIN_1): GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_1, ~GPIO_PIN_1);
    }
    break;
    case 3: {
        onn==true? GPIOPinWrite(GPIO_PORTB_BASE, GPIO_PIN_5, GPIO_PIN_5): GPIOPinWrite(GPIO_PORTB_BASE, GPIO_PIN_5, ~GPIO_PIN_5);
        }
    break;
    default:
        break;
    }

    return 0;
}

int umts_pa_uLdL_onoff(bool uponn, bool dlonn)
{
    switch(uponn)
    {
    case true:
    GPIOPinWrite(GPIO_PORTJ_BASE, GPIO_PIN_0, GPIO_PIN_0);break;
    default:
    GPIOPinWrite(GPIO_PORTJ_BASE, GPIO_PIN_0, ~GPIO_PIN_0);break;
    }
    switch(dlonn)
        {
        case true:
        GPIOPinWrite(GPIO_PORTJ_BASE, GPIO_PIN_1, GPIO_PIN_1);break;
        default:
        GPIOPinWrite(GPIO_PORTJ_BASE, GPIO_PIN_1, ~GPIO_PIN_1);break;
        }
    return 0;
}



int dcs_pa_uLdL_onoff(bool uponn, bool dlonn)
{
    switch(uponn)
    {
    case true:
    GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_0, GPIO_PIN_0);break;
    default:
    GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_0, ~GPIO_PIN_0);break;
    }
    switch(dlonn)
        {
        case true:
        GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_1, GPIO_PIN_1);break;
        default:
        GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_1, ~GPIO_PIN_1);break;
        }
    return 0;
}

int dcs2_pa_uLdL_onoff(bool uponn, bool dlonn)
{

    switch(uponn)
    {
    case true:
    GPIOPinWrite(GPIO_PORTB_BASE, GPIO_PIN_4, GPIO_PIN_4);break;
    default:
    GPIOPinWrite(GPIO_PORTB_BASE, GPIO_PIN_4, ~GPIO_PIN_4);break;
    }
    switch(dlonn)
        {
        case true:
        GPIOPinWrite(GPIO_PORTB_BASE, GPIO_PIN_5, GPIO_PIN_5);break;
        default:
        GPIOPinWrite(GPIO_PORTB_BASE, GPIO_PIN_5, ~GPIO_PIN_5);break;
        }
    return 0;
}


