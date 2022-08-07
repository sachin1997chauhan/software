/*
 * get_set_9361.c
 *
 *  Created on: Mar 7, 2019
 *      Author: FCS-RN5
 */
#include "get_set_9361.h"

/*
 * central_downlink_freq: this is downlink LO eg 9475 multiplication is done within the function
 * central_uplink_freq: this is uplink LO eg 9025 multiplication is done within the function
 * par_1: the nomenclature of AD to be affected as first TX then RX
 * 			for GSM: 	7
 * 			for UMTS:	6
 * 			for DCS1:	5
 * 			for DCS2:	3
 * par_2: the nomenclature of AD to be affected	as first RX then TX
 * 			for GSM: 	1
 * 			for UMTS:	8
 * 			for DCS1:	4
 * 			for DCS2:	2
 */

int set_local_oscillator_downlink(uint64_t central_downlink_freq, struct ad9361_rf_phy *phy) {
	int32_t a;
	central_downlink_freq *= 100000;
	a = ad9361_set_tx_lo_freq(phy, central_downlink_freq);
	if (a < 0) {
		return -error_1;
	}
	SysCtlDelay(200);
	a = ad9361_set_rx_lo_freq(phy, central_downlink_freq);
	if (a < 0) {
		return -error_1;
	}
	SysCtlDelay(200);
	return done;
}

int set_local_oscillator_uplink(uint64_t central_uplink_freq, struct ad9361_rf_phy *phy) {
	int32_t a;
	central_uplink_freq *= 100000;
	a = ad9361_set_rx_lo_freq(phy, central_uplink_freq);
	if (a < 0) {
		return -error_1;
	}
	SysCtlDelay(200);
	a = ad9361_set_tx_lo_freq(phy, central_uplink_freq);
	if (a < 0) {
		return -error_1;
	}
	SysCtlDelay(200);

	return done;
}

int set_lo_umts(uint64_t central_downlink_freq, uint64_t central_uplink_freq) {
	int32_t a;
	central_downlink_freq *= 100000;
	central_uplink_freq *= 100000;
	a = ad9361_set_tx_lo_freq(ad9361_phy[5], central_downlink_freq);
	if (a < 0) {
		return -error_1;
	}
	SysCtlDelay(200);
	a = ad9361_set_rx_lo_freq(ad9361_phy[5], central_uplink_freq);
	if (a < 0) {
		return -error_1;
	}
	SysCtlDelay(200);
	a = ad9361_set_tx_lo_freq(ad9361_phy[7], central_uplink_freq);
	if (a < 0) {
		return -error_1;
	}
	SysCtlDelay(200);
	a = ad9361_set_rx_lo_freq(ad9361_phy[7], central_downlink_freq);
	if (a < 0) {
		return -error_1;
	}
	SysCtlDelay(200);
	return done;
}

int set_lo_dcs1(uint64_t central_downlink_freq, uint64_t central_uplink_freq) {
	int32_t a;
	central_downlink_freq *= 100000;
	central_uplink_freq *= 100000;
	a = ad9361_set_tx_lo_freq(ad9361_phy[4], central_downlink_freq);
	if (a < 0) {
		return -error_1;
	}
	SysCtlDelay(200);
	a = ad9361_set_rx_lo_freq(ad9361_phy[4], central_uplink_freq);
	if (a < 0) {
		return -error_1;
	}
	SysCtlDelay(200);
	a = ad9361_set_tx_lo_freq(ad9361_phy[3], central_uplink_freq);
	if (a < 0) {
		return -error_1;
	}
	SysCtlDelay(200);
	a = ad9361_set_rx_lo_freq(ad9361_phy[3], central_downlink_freq);
	if (a < 0) {
		return -error_1;
	}
	SysCtlDelay(200);
	return done;
}

int set_lo_dcs2(uint64_t central_downlink_freq, uint64_t central_uplink_freq) {
	int32_t a;
	central_downlink_freq *= 100000;
	central_uplink_freq *= 100000;
	a = ad9361_set_tx_lo_freq(ad9361_phy[2], central_downlink_freq);
	if (a < 0) {
		return -error_1;
	}
	SysCtlDelay(200);
	a = ad9361_set_rx_lo_freq(ad9361_phy[2], central_uplink_freq);
	if (a < 0) {
		return -error_1;
	}
	SysCtlDelay(200);
	a = ad9361_set_tx_lo_freq(ad9361_phy[1], central_uplink_freq);
	if (a < 0) {
		return -error_1;
	}
	SysCtlDelay(200);
	a = ad9361_set_rx_lo_freq(ad9361_phy[1], central_downlink_freq);
	if (a < 0) {
		return -error_1;
	}
	SysCtlDelay(200);
	return done;
}
