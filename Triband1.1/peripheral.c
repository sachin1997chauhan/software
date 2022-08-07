#include "peripheral.h"


int pa_uplink_onoff(bool onn, int bandType)
 {
	switch (bandType) {
	case GSM_BAND1: {
		switch (onn) {
		case true:
			GPIOPinWrite(GPIO_PORTG_BASE, GPIO_PIN_0, GPIO_PIN_0);
			break;
		default:
			GPIOPinWrite(GPIO_PORTG_BASE, GPIO_PIN_0, ~GPIO_PIN_0);
			break;
		}
	}
	case UMTS_BAND1: {
		switch (onn) {
		case true:
			GPIOPinWrite(GPIO_PORTJ_BASE, GPIO_PIN_0, GPIO_PIN_0);
			break;
		default:
			GPIOPinWrite(GPIO_PORTJ_BASE, GPIO_PIN_0, ~GPIO_PIN_0);
			break;
		}
	}
	case DCS1_BAND1: {
		switch (onn) {
		case true:
			GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_0, GPIO_PIN_0);
			break;
		default:
			GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_0, ~GPIO_PIN_0);
			break;
		}
	}
	case DCS2_BAND1: {
		switch (onn) {
		case true:
			GPIOPinWrite(GPIO_PORTB_BASE, GPIO_PIN_4, GPIO_PIN_4);
			break;
		default:
			GPIOPinWrite(GPIO_PORTB_BASE, GPIO_PIN_4, ~GPIO_PIN_4);
			break;
		}
	}
	}
	return 0;
}

int pa_downlink_onoff(bool onn, int bandType)
 {
	switch (bandType) {
	case GSM_BAND1: {
		switch (onn) {
		case true:
			GPIOPinWrite(GPIO_PORTG_BASE, GPIO_PIN_1, GPIO_PIN_1);
			break;
		default:
			GPIOPinWrite(GPIO_PORTG_BASE, GPIO_PIN_1, ~GPIO_PIN_1);
			break;
		}
	}
	case UMTS_BAND1: {
		switch (onn) {
		case true:
			GPIOPinWrite(GPIO_PORTJ_BASE, GPIO_PIN_1, GPIO_PIN_1);
			break;
		default:
			GPIOPinWrite(GPIO_PORTJ_BASE, GPIO_PIN_1, ~GPIO_PIN_1);
			break;
		}
	}
	case DCS1_BAND1: {
		switch (onn) {
		case true:
			GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_1, GPIO_PIN_1);
			break;
		default:
			GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_1, ~GPIO_PIN_1);
			break;
		}
	}
	case DCS2_BAND1: {
		switch (onn) {
		case true:
			GPIOPinWrite(GPIO_PORTB_BASE, GPIO_PIN_5, GPIO_PIN_5);
			break;
		default:
			GPIOPinWrite(GPIO_PORTB_BASE, GPIO_PIN_5, ~GPIO_PIN_5);
			break;
		}
	}
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


void fpga_reset(void)
{
	//FPGA RESET DCS side
	SysCtlDelay(5000);
	GPIOPinWrite(GPIO_PORTK_BASE, GPIO_PIN_1, GPIO_PIN_1);
	SysCtlDelay(5000);
	GPIOPinWrite(GPIO_PORTK_BASE, GPIO_PIN_1, ~GPIO_PIN_1);
	SysCtlDelay(5000);
	GPIOPinWrite(GPIO_PORTK_BASE, GPIO_PIN_1, GPIO_PIN_1);
	SysCtlDelay(5000);

	//FPGA RESET GSM side
	SysCtlDelay(5000);
	GPIOPinWrite(GPIO_PORTN_BASE, GPIO_PIN_1, GPIO_PIN_1);
	SysCtlDelay(5000);
	GPIOPinWrite(GPIO_PORTN_BASE, GPIO_PIN_1, ~GPIO_PIN_1);
	SysCtlDelay(5000);
	GPIOPinWrite(GPIO_PORTN_BASE, GPIO_PIN_1, GPIO_PIN_1);
	SysCtlDelay(5000);
}
/*
int ad9361_uplink_attn(int attn_value,struct ad9361_rf_phy *phy)
{
	return ad9361_set_tx_attenuation( ad9361_phy, 1,attn_value);
}
int AD_DOWNLINK_ATTN(int attn_value, int32_t par_1, struct ad9361_rf_phy *phy)
{
	return ad9361_set_tx_attenuation( ad9361_phy, 1,attn_value);
}
int UMTS_AD_UPLINK_ATTN(int attn_value)
{
	return ad9361_set_tx_attenuation( ad9361_phy, 1,attn_value);
}
int UMTS_AD_DOWNLINK_ATTN(int attn_value)
{
	return ad9361_set_tx_attenuation( ad9361_phy, 1,attn_value);
}
int DCS1_AD_UPLINK_ATTN(int attn_value)
{
	return ad9361_set_tx_attenuation( ad9361_phy, 1,attn_value);
}
int DCS1_AD_DOWNLINK_ATTN(int attn_value)
{
	return ad9361_set_tx_attenuation( ad9361_phy, 1,attn_value);
}
int DCS2_AD_UPLINK_ATTN(int attn_value)
{
	return ad9361_set_tx_attenuation(ad9361_phy, 1,attn_value);
}
int DCS2_AD_DOWNLINK_ATTN(int attn_value)
{
	return ad9361_set_tx_attenuation(&ad9361_phy[2], 1,attn_value);
}
*/
