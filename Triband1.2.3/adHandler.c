/*
 * adHandler.c
 *
 *  Created on: Nov 19, 2020
 *      Author: frogcell
 */



#include "ad9361_api.h"
#include <stdbool.h>
#include <stdint.h>

#include "inc/hw_memmap.h"
#include "driverlib/gpio.h"
#include "driverlib/sysctl.h"
#include "errors.h"
#include "adHandler.h"
#include "definitions.h"
#include "common.h"
// RX_Sensitivity[dBm] = –174 + 10*LOG(BW[Hz]) + Noise_Figure[dB] + Signal/Noise[dB]





extern repeater_board gTriband_board;
struct ad9361_rf_phy  *ad9361_phy[8];

AD9361_InitParam default_init_param = {
/* Device selection */
ID_AD9361,  // dev_sel
        /* Identification number */
        0,      //id_no
        /* Reference Clock */
        30720000UL, //reference_clk_rate
        /* Base Configuration */
        0,      //two_rx_two_tx_mode_enable *** adi,2rx-2tx-mode-enable
        2,      //one_rx_one_tx_mode_use_rx_num *** adi,1rx-1tx-mode-use-rx-num
        2,      //one_rx_one_tx_mode_use_tx_num *** adi,1rx-1tx-mode-use-tx-num
        1,//frequency_division_duplex_mode_enable *** adi,frequency-division-duplex-mode-enable
        0,//frequency_division_duplex_independent_mode_enable *** adi,frequency-division-duplex-independent-mode-enable
        0,//tdd_use_dual_synth_mode_enable *** adi,tdd-use-dual-synth-mode-enable
        0,      //tdd_skip_vco_cal_enable *** adi,tdd-skip-vco-cal-enable
        0,      //tx_fastlock_delay_ns *** adi,tx-fastlock-delay-ns
        0,      //rx_fastlock_delay_ns *** adi,rx-fastlock-delay-ns
        0,//rx_fastlock_pincontrol_enable *** adi,rx-fastlock-pincontrol-enable
        0,//tx_fastlock_pincontrol_enable *** adi,tx-fastlock-pincontrol-enable
        0,      //external_rx_lo_enable *** adi,external-rx-lo-enable
        0,      //external_tx_lo_enable *** adi,external-tx-lo-enable
        5,//dc_offset_tracking_update_event_mask *** adi,dc-offset-tracking-update-event-mask
        6,//dc_offset_attenuation_high_range *** adi,dc-offset-attenuation-high-range
        5,//dc_offset_attenuation_low_range *** adi,dc-offset-attenuation-low-range
        0x28,   //dc_offset_count_high_range *** adi,dc-offset-count-high-range
        0x32,   //dc_offset_count_low_range *** adi,dc-offset-count-low-range
        0,  //split_gain_table_mode_enable *** adi,split-gain-table-mode-enable
        MAX_SYNTH_FREF, //trx_synthesizer_target_fref_overwrite_hz *** adi,trx-synthesizer-target-fref-overwrite-hz
        0,// qec_tracking_slow_mode_enable *** adi,qec-tracking-slow-mode-enable
        /* ENSM Control */
        0,//ensm_enable_pin_pulse_mode_enable *** adi,ensm-enable-pin-pulse-mode-enable
        0,//ensm_enable_txnrx_control_enable *** adi,ensm-enable-txnrx-control-enable
        /* LO Control */
        UPLINK_GSM, //rx_synthesizer_frequency_hz *** adi,rx-synthesizer-frequency-hz           //DOWNLINK_GSM
        DOWNLINK_GSM,//DOWNLINK,//tx_synthesizer_frequency_hz *** adi,tx-synthesizer-frequency-hz
        /* Rate & BW Control */

        { 983040000, 491520000, 245760000, 245760000, 122880000, 61440000 },//uint32_t  rx_path_clock_frequencies[6] *** adi,rx-path-clock-frequencies
        { 983040000, 245760000, 245760000, 122880000, 122880000, 61440000 },//uint32_t
        52000000,/*33900000,*///rf_rx_bandwidth_hz *** adi,rf-rx-bandwidth-hz*/
        33900000,/*52000000,*/  //rf_tx_bandwidth_hz *** adi,rf-tx-bandwidth-hz
        /* RF Port Control */
        0,      //rx_rf_port_input_select *** adi,rx-rf-port-input-select
        0,      //tx_rf_port_input_select *** adi,tx-rf-port-input-select
        /* TX Attenuation Control */
        0,  //tx_attenuation_mdB *** adi,tx-attenuation-mdB
        0,//update_tx_gain_in_alert_enable *** adi,update-tx-gain-in-alert-enable
        /* Reference Clock Control */
        0,//xo_disable_use_ext_refclk_enable *** adi,xo-disable-use-ext-refclk-enable
        { 8, 5920 },//dcxo_coarse_and_fine_tune[2] *** adi,dcxo-coarse-and-fine-tune
        CLKOUT_DISABLE, //clk_output_mode_select *** adi,clk-output-mode-select
        /* Gain Control */
        2,      //gc_rx1_mode *** adi,gc-rx1-mode
        2,      //gc_rx2_mode *** adi,gc-rx2-mode
        58, //gc_adc_large_overload_thresh *** adi,gc-adc-large-overload-thresh
        4,      //gc_adc_ovr_sample_size *** adi,gc-adc-ovr-sample-size
        47, //gc_adc_small_overload_thresh *** adi,gc-adc-small-overload-thresh
        8192,//gc_dec_pow_measurement_duration *** adi,gc-dec-pow-measurement-duration
        0,      //gc_dig_gain_enable *** adi,gc-dig-gain-enable
        800,//gc_lmt_overload_high_thresh *** adi,gc-lmt-overload-high-thresh
        704,    //gc_lmt_overload_low_thresh *** adi,gc-lmt-overload-low-thresh
        24,     //gc_low_power_thresh *** adi,gc-low-power-thresh
        15,     //gc_max_dig_gain *** adi,gc-max-dig-gain
        /* Gain MGC Control */
        2,      //mgc_dec_gain_step *** adi,mgc-dec-gain-step
        2,      //mgc_inc_gain_step *** adi,mgc-inc-gain-step
        0,      //mgc_rx1_ctrl_inp_enable *** adi,mgc-rx1-ctrl-inp-enable
        0,      //mgc_rx2_ctrl_inp_enable *** adi,mgc-rx2-ctrl-inp-enable
        0,//mgc_split_table_ctrl_inp_gain_mode *** adi,mgc-split-table-ctrl-inp-gain-mode
        /* Gain AGC Control */
        10, //agc_adc_large_overload_exceed_counter *** adi,agc-adc-large-overload-exceed-counter
        2,//agc_adc_large_overload_inc_steps *** adi,agc-adc-large-overload-inc-steps
        0,//agc_adc_lmt_small_overload_prevent_gain_inc_enable *** adi,agc-adc-lmt-small-overload-prevent-gain-inc-enable
        10, //agc_adc_small_overload_exceed_counter *** adi,agc-adc-small-overload-exceed-counter
        4,      //agc_dig_gain_step_size *** adi,agc-dig-gain-step-size
        3,//agc_dig_saturation_exceed_counter *** adi,agc-dig-saturation-exceed-counter
        1000,// agc_gain_update_interval_us *** adi,agc-gain-update-interval-us
        0,//agc_immed_gain_change_if_large_adc_overload_enable *** adi,agc-immed-gain-change-if-large-adc-overload-enable
        0,//agc_immed_gain_change_if_large_lmt_overload_enable *** adi,agc-immed-gain-change-if-large-lmt-overload-enable
        10,     //agc_inner_thresh_high *** adi,agc-inner-thresh-high
        1,//agc_inner_thresh_high_dec_steps *** adi,agc-inner-thresh-high-dec-steps
        12,     //agc_inner_thresh_low *** adi,agc-inner-thresh-low
        1,//agc_inner_thresh_low_inc_steps *** adi,agc-inner-thresh-low-inc-steps
        10, //agc_lmt_overload_large_exceed_counter *** adi,agc-lmt-overload-large-exceed-counter
        2,//agc_lmt_overload_large_inc_steps *** adi,agc-lmt-overload-large-inc-steps
        10, //agc_lmt_overload_small_exceed_counter *** adi,agc-lmt-overload-small-exceed-counter
        5,      //agc_outer_thresh_high *** adi,agc-outer-thresh-high
        2,//agc_outer_thresh_high_dec_steps *** adi,agc-outer-thresh-high-dec-steps
        18,     //agc_outer_thresh_low *** adi,agc-outer-thresh-low
        2,//agc_outer_thresh_low_inc_steps *** adi,agc-outer-thresh-low-inc-steps
        1,//agc_attack_delay_extra_margin_us; *** adi,agc-attack-delay-extra-margin-us
        0,//agc_sync_for_gain_counter_enable *** adi,agc-sync-for-gain-counter-enable
        /* Fast AGC */
        64, //fagc_dec_pow_measuremnt_duration ***  adi,fagc-dec-pow-measurement-duration   default 64 avinish
        260,    //fagc_state_wait_time_ns ***  adi,fagc-state-wait-time-ns
        /* Fast AGC - Low Power */
        0,//fagc_allow_agc_gain_increase ***  adi,fagc-allow-agc-gain-increase-enable
        5,//fagc_lp_thresh_increment_time ***  adi,fagc-lp-thresh-increment-time
        1,//fagc_lp_thresh_increment_steps ***  adi,fagc-lp-thresh-increment-steps
        /* Fast AGC - Lock Level */
        10,     //fagc_lock_level ***  adi,fagc-lock-level
        1,//fagc_lock_level_lmt_gain_increase_en ***  adi,fagc-lock-level-lmt-gain-increase-enable
        5,//fagc_lock_level_gain_increase_upper_limit ***  adi,fagc-lock-level-gain-increase-upper-limit    defautl-5 avinish
        /* Fast AGC - Peak Detectors and Final Settling */
        1,//fagc_lpf_final_settling_steps ***  adi,fagc-lpf-final-settling-steps
        1,//fagc_lmt_final_settling_steps ***  adi,fagc-lmt-final-settling-steps
        3,      //fagc_final_overrange_count ***  adi,fagc-final-overrange-count
        /* Fast AGC - Final Power Test */
        0,//fagc_gain_increase_after_gain_lock_en ***  adi,fagc-gain-increase-after-gain-lock-enable    default-0 avinish
        /* Fast AGC - Unlocking the Gain */
        0,//fagc_gain_index_type_after_exit_rx_mode ***  adi,fagc-gain-index-type-after-exit-rx-mode
        1,//fagc_use_last_lock_level_for_set_gain_en ***  adi,fagc-use-last-lock-level-for-set-gain-enable  default 1 avinish
        1,//fagc_rst_gla_stronger_sig_thresh_exceeded_en ***  adi,fagc-rst-gla-stronger-sig-thresh-exceeded-enable
        5,      //fagc_optimized_gain_offset ***  adi,fagc-optimized-gain-offset
        10, //fagc_rst_gla_stronger_sig_thresh_above_ll ***  adi,fagc-rst-gla-stronger-sig-thresh-above-ll
        1,//fagc_rst_gla_engergy_lost_sig_thresh_exceeded_en ***  adi,fagc-rst-gla-engergy-lost-sig-thresh-exceeded-enable
        1,//fagc_rst_gla_engergy_lost_goto_optim_gain_en ***  adi,fagc-rst-gla-engergy-lost-goto-optim-gain-enable
        10, //fagc_rst_gla_engergy_lost_sig_thresh_below_ll ***  adi,fagc-rst-gla-engergy-lost-sig-thresh-below-ll
        8,//fagc_energy_lost_stronger_sig_gain_lock_exit_cnt ***  adi,fagc-energy-lost-stronger-sig-gain-lock-exit-cnt
        1,//fagc_rst_gla_large_adc_overload_en ***  adi,fagc-rst-gla-large-adc-overload-enable
        1,//fagc_rst_gla_large_lmt_overload_en ***  adi,fagc-rst-gla-large-lmt-overload-enable
        0,//fagc_rst_gla_en_agc_pulled_high_en ***  adi,fagc-rst-gla-en-agc-pulled-high-enable
        0,//fagc_rst_gla_if_en_agc_pulled_high_mode ***  adi,fagc-rst-gla-if-en-agc-pulled-high-mode
        64, //fagc_power_measurement_duration_in_state5 ***  adi,fagc-power-measurement-duration-in-state5
        /* RSSI Control */
        1,      //rssi_delay *** adi,rssi-delay
        1000,   //rssi_duration *** adi,rssi-duration
        4,      //rssi_restart_mode *** adi,rssi-restart-mode           //3
        0,//rssi_unit_is_rx_samples_enable *** adi,rssi-unit-is-rx-samples-enable
        1,      //rssi_wait *** adi,rssi-wait
        /* Aux ADC Control */
        256,    //aux_adc_decimation *** adi,aux-adc-decimation
        30720000UL, //aux_adc_rate *** adi,aux-adc-rate
        /* AuxDAC Control */
        1,      //aux_dac_manual_mode_enable ***  adi,aux-dac-manual-mode-enable
        0,      //aux_dac1_default_value_mV ***  adi,aux-dac1-default-value-mV
        0,  //aux_dac1_active_in_rx_enable ***  adi,aux-dac1-active-in-rx-enable
        0,  //aux_dac1_active_in_tx_enable ***  adi,aux-dac1-active-in-tx-enable
        0,//aux_dac1_active_in_alert_enable ***  adi,aux-dac1-active-in-alert-enable
        0,      //aux_dac1_rx_delay_us ***  adi,aux-dac1-rx-delay-us
        0,      //aux_dac1_tx_delay_us ***  adi,aux-dac1-tx-delay-us
        0,      //aux_dac2_default_value_mV ***  adi,aux-dac2-default-value-mV
        0,  //aux_dac2_active_in_rx_enable ***  adi,aux-dac2-active-in-rx-enable
        0,  //aux_dac2_active_in_tx_enable ***  adi,aux-dac2-active-in-tx-enable
        0,//aux_dac2_active_in_alert_enable ***  adi,aux-dac2-active-in-alert-enable
        0,      //aux_dac2_rx_delay_us ***  adi,aux-dac2-rx-delay-us
        0,      //aux_dac2_tx_delay_us ***  adi,aux-dac2-tx-delay-us
        /* Temperature Sensor Control */
        256,    //temp_sense_decimation *** adi,temp-sense-decimation
        1000,//temp_sense_measurement_interval_ms *** adi,temp-sense-measurement-interval-ms
        0xCE,   //temp_sense_offset_signed *** adi,temp-sense-offset-signed
        1,//temp_sense_periodic_measurement_enable *** adi,temp-sense-periodic-measurement-enable
        /* Control Out Setup */
        0xFF,   //ctrl_outs_enable_mask *** adi,ctrl-outs-enable-mask
        0,      //ctrl_outs_index *** adi,ctrl-outs-index
        /* External LNA Control */
        0,      //elna_settling_delay_ns *** adi,elna-settling-delay-ns
        0,      //elna_gain_mdB *** adi,elna-gain-mdB
        0,      //elna_bypass_loss_mdB *** adi,elna-bypass-loss-mdB
        0,  //elna_rx1_gpo0_control_enable *** adi,elna-rx1-gpo0-control-enable
        0,  //elna_rx2_gpo1_control_enable *** adi,elna-rx2-gpo1-control-enable
        0,//elna_gaintable_all_index_enable *** adi,elna-gaintable-all-index-enable
        /* Digital Interface Control */
        0,//digital_interface_tune_skip_mode *** adi,digital-interface-tune-skip-mode
        0,//digital_interface_tune_fir_disable *** adi,digital-interface-tune-fir-disable
        1,      //pp_tx_swap_enable *** adi,pp-tx-swap-enable
        1,      //pp_rx_swap_enable *** adi,pp-rx-swap-enable
        0,      //tx_channel_swap_enable *** adi,tx-channel-swap-enable
        0,      //rx_channel_swap_enable *** adi,rx-channel-swap-enable
        1,      //rx_frame_pulse_mode_enable *** adi,rx-frame-pulse-mode-enable
        0,      //two_t_two_r_timing_enable *** adi,2t2r-timing-enable
        0,      //invert_data_bus_enable *** adi,invert-data-bus-enable
        0,      //invert_data_clk_enable *** adi,invert-data-clk-enable
        0,      //fdd_alt_word_order_enable *** adi,fdd-alt-word-order-enable
        0,      //invert_rx_frame_enable *** adi,invert-rx-frame-enable
        0,      //fdd_rx_rate_2tx_enable *** adi,fdd-rx-rate-2tx-enable
        0,      //swap_ports_enable *** adi,swap-ports-enable
        0,      //single_data_rate_enable *** adi,single-data-rate-enable
        1,      //lvds_mode_enable *** adi,lvds-mode-enable
        0,      //half_duplex_mode_enable *** adi,half-duplex-mode-enable
        0,      //single_port_mode_enable *** adi,single-port-mode-enable
        0,      //full_port_enable *** adi,full-port-enable
        0,  //full_duplex_swap_bits_enable *** adi,full-duplex-swap-bits-enable
        0,      //delay_rx_data *** adi,delay-rx-data
        0,      //rx_data_clock_delay *** adi,rx-data-clock-delay
        0,      //rx_data_delay *** adi,rx-data-delay
        0,      //tx_fb_clock_delay *** adi,tx-fb-clock-delay
        3,      //tx_data_delay *** adi,tx-data-delay
        150,    //lvds_bias_mV *** adi,lvds-bias-mV
        1,//lvds_rx_onchip_termination_enable *** adi,lvds-rx-onchip-termination-enable
        0,  //rx1rx2_phase_inversion_en *** adi,rx1-rx2-phase-inversion-enable
        0xFF,   //lvds_invert1_control *** adi,lvds-invert1-control
        0x0F,   //lvds_invert2_control *** adi,lvds-invert2-control
        /* GPO Control */
        0,//gpo0_inactive_state_high_enable *** adi,gpo0-inactive-state-high-enable
        0,//gpo1_inactive_state_high_enable *** adi,gpo1-inactive-state-high-enable
        0,//gpo2_inactive_state_high_enable *** adi,gpo2-inactive-state-high-enable
        0,//gpo3_inactive_state_high_enable *** adi,gpo3-inactive-state-high-enable
        0,      //gpo0_slave_rx_enable *** adi,gpo0-slave-rx-enable
        0,      //gpo0_slave_tx_enable *** adi,gpo0-slave-tx-enable
        0,      //gpo1_slave_rx_enable *** adi,gpo1-slave-rx-enable
        0,      //gpo1_slave_tx_enable *** adi,gpo1-slave-tx-enable
        0,      //gpo2_slave_rx_enable *** adi,gpo2-slave-rx-enable
        0,      //gpo2_slave_tx_enable *** adi,gpo2-slave-tx-enable
        0,      //gpo3_slave_rx_enable *** adi,gpo3-slave-rx-enable
        0,      //gpo3_slave_tx_enable *** adi,gpo3-slave-tx-enable
        0,      //gpo0_rx_delay_us *** adi,gpo0-rx-delay-us
        0,      //gpo0_tx_delay_us *** adi,gpo0-tx-delay-us
        0,      //gpo1_rx_delay_us *** adi,gpo1-rx-delay-us
        0,      //gpo1_tx_delay_us *** adi,gpo1-tx-delay-us
        0,      //gpo2_rx_delay_us *** adi,gpo2-rx-delay-us
        0,      //gpo2_tx_delay_us *** adi,gpo2-tx-delay-us
        0,      //gpo3_rx_delay_us *** adi,gpo3-rx-delay-us
        0,      //gpo3_tx_delay_us *** adi,gpo3-tx-delay-us
        /* Tx Monitor Control */
        37000,  //low_high_gain_threshold_mdB *** adi,txmon-low-high-thresh
        0,      //low_gain_dB *** adi,txmon-low-gain
        24,     //high_gain_dB *** adi,txmon-high-gain
        0,      //tx_mon_track_en *** adi,txmon-dc-tracking-enable
        0,      //one_shot_mode_en *** adi,txmon-one-shot-mode-enable
        511,    //tx_mon_delay *** adi,txmon-delay
        8192,   //tx_mon_duration *** adi,txmon-duration
        2,      //tx1_mon_front_end_gain *** adi,txmon-1-front-end-gain
        2,      //tx2_mon_front_end_gain *** adi,txmon-2-front-end-gain
        48,     //tx1_mon_lo_cm *** adi,txmon-1-lo-cm
        48,     //tx2_mon_lo_cm *** adi,txmon-2-lo-cm
        /* GPIO definitions */
        -1,     //gpio_resetb *** reset-gpios
        /* MCS Sync */
        -1,     //gpio_sync *** sync-gpios
        -1,     //gpio_cal_sw1 *** cal-sw1-gpios
        -1,     //gpio_cal_sw2 *** cal-sw2-gpios
        /* External LO clocks */
        NULL,   //(*ad9361_rfpll_ext_recalc_rate)()
        NULL,   //(*ad9361_rfpll_ext_round_rate)()
        NULL    //(*ad9361_rfpll_ext_set_rate)()
        };


AD9361_RXFIRConfig rx_fir_config = { 3, // rx
        -6, // rx_gain
        2, // rx_dec
        { -51, -236, -460, -422, -1, 346, 122, -339, -220, 360, 348, -379, -514,
                378, 724, -344, -982, 259, 1295, -105, -1678, -152, 2159, 568,
                -2800, -1265, 3759, 2594, -5509, -5957, 10644, 30048, 30048,
                10644, -5957, -5509, 2594, 3759, -1265, -2800, 568, 2159, -152,
                -1678, -105, 1295, 259, -982, -344, 724, 378, -514, -379, 348,
                360, -220, -339, 122, 346, -1, -422, -460, -236, -51 }, // rx_coef[128]
        64, // rx_coef_size
        { 983040000, 491520000, 245760000, 245760000, 122880000, 61440000 }, // rx_path_clks[6]
        52000000 // rx_bandwidth
        };

AD9361_TXFIRConfig tx_fir_config = { 3, // tx
        0, // tx_gain
        2, // tx_int
        { -63, -255, -469, -395, 43, 372, 129, -309, -167, 387, 343, -353, -447,
                410, 699, -329, -891, 305, 1240, -112, -1552, -74, 2057, 511,
                -2611, -1111, 3552, 2375, -5133, -5251, 10634, 29001, 29001,
                10634, -5251, -5133, 2375, 3552, -1111, -2611, 511, 2057, -74,
                -1552, -112, 1240, 305, -891, -329, 699, 410, -447, -353, 343,
                387, -167, -309, 129, 372, 43, -395, -469, -255, -63 }, // tx_coef[128]
        64, // tx_coef_size
        { 983040000, 245760000, 245760000, 122880000, 122880000, 61440000 }, // tx_path_clks[6]
        33900000 // tx_bandwidth
        };
/*
 * U3,U8 for GSM UL & DL
 * U13,U18-for WCDMA UL,DL
 * U23,U28 for DCS1 UL,DL
 * U33,U39 for DCS2, UL,DL
 */
int32_t init_all_AD() {
    int32_t paru=0;
    fpga_reset();
    //  U3 & U8 gsm
       default_init_param.rx_synthesizer_frequency_hz=UPLINK_GSM;
        default_init_param.tx_synthesizer_frequency_hz=DOWNLINK_GSM;
//U3 UL
    paru = ad9361_init(0,&ad9361_phy[0], &default_init_param);//function which initialize the ad9361 board for 2400Mhz
    if((paru==-ENODEV)||(paru==-ENOMEM)){
        ad9361_phy[0]=NULL;
        return paru;
    }
    paru=0;
    paru=ad9361_trx_load_enable_fir(ad9361_phy[0], rx_fir_config, tx_fir_config);
    if(paru<0){
              ad9361_phy[0]=NULL;
              return paru;
       }

    SysCtlDelay(2000);
//U8 DL
   // default_init_param
    paru=0;
    paru = ad9361_init(1,&ad9361_phy[1], &default_init_param);//function which initialize the ad9361 board for 2400Mhz
    if((paru==-ENODEV)||(paru==-ENOMEM)){
          ad9361_phy[1]=NULL;
          return paru;
      }
    SysCtlDelay(2 * 1600);
    paru=0;
    paru =ad9361_trx_load_enable_fir(ad9361_phy[1], rx_fir_config, tx_fir_config);
    SysCtlDelay(2000);
    if(paru<0){
            ad9361_phy[1]=NULL;
            return paru;
         }

    SysCtlDelay(2 * 16000000);
   // ad9361_set_tx_attenuation(ad9361_phy[0], 1,69);
   // ad9361_set_tx_attenuation(ad9361_phy[1], 1,69);
 //   ad9361_set_tx_lo_freq(ad9361_phy[0], UPLINK_GSM);
   // ad9361_set_tx_lo_freq(ad9361_phy[0], UPLINK_GSM);
    SysCtlDelay(2000);
  //  ad9361_set_rx_lo_freq(ad9361_phy[1], DOWNLINK_GSM);
   // ad9361_set_rx_lo_freq(ad9361_phy[1], DOWNLINK_GSM);
    SysCtlDelay(2000);
//    set_ad_att_ul(69,0);
//    set_ad_att_dl(69,0);
    //ad9361_set_tx_attenuation(1,ad9361_phy, 1,70);
/*
    GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_2 | GPIO_PIN_3,
    GPIO_PIN_2 | ~GPIO_PIN_3);
    SysCtlDelay(2 * 16000000);
    GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_2 | GPIO_PIN_3,
            ~GPIO_PIN_2 | GPIO_PIN_3);
*/


    //  U13 & U18 wcdma
   // default_init_param.rx_synthesizer_frequency_hz=UPLINK_WCDMA;
   // default_init_param.tx_synthesizer_frequency_hz=DOWNLINK_WCDMA;
    //U13 UL
    paru=0;
    paru = ad9361_init(2,&ad9361_phy[2], &default_init_param);//function which initialize the ad9361 board for 2400Mhz
    if((paru==-ENODEV)||(paru==-ENOMEM)){
          ad9361_phy[2]=NULL;
         // return paru;
      }

    paru=0;
    if(ad9361_phy[2]!=NULL){
    paru =ad9361_trx_load_enable_fir(ad9361_phy[2], rx_fir_config, tx_fir_config);
    if(paru<0){
        ad9361_phy[2]=NULL;
        //return paru;
     }
    ad9361_set_tx_attenuation(ad9361_phy[2], 1,69);
    }
     SysCtlDelay(2000);
     LedBlink();
     //U18 DL
     paru=0;
     paru = ad9361_init(3,&ad9361_phy[3], &default_init_param);//function which initialize the ad9361 board for 2400Mhz
     if((paru==-ENODEV)||(paru==-ENOMEM)){
           ad9361_phy[3]=NULL;
           return paru;
       }

     SysCtlDelay(2 * 1600);
     paru=0;
     paru=ad9361_trx_load_enable_fir(ad9361_phy[3], rx_fir_config, tx_fir_config);
     SysCtlDelay(2000);
     if(paru<0){
         ad9361_phy[3]=NULL;
         return paru;
     }

     SysCtlDelay(2 * 16000000);

     ad9361_set_tx_attenuation(ad9361_phy[3], 1,69);

     ad9361_set_tx_lo_freq(ad9361_phy[2], UPLINK_WCDMA);
     SysCtlDelay(2000);
     ad9361_set_rx_lo_freq(ad9361_phy[3], DOWNLINK_WCDMA);
     SysCtlDelay(2000);
/*
     GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_2 | GPIO_PIN_3,
      GPIO_PIN_2 | ~GPIO_PIN_3);
      SysCtlDelay(2 * 16000000);
      GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_2 | GPIO_PIN_3,
              ~GPIO_PIN_2 | GPIO_PIN_3);
*/
     LedBlink();
      //fpga_reset();
      SysCtlDelay(2 * 16000000);
//U23 & U28
   //   default_init_param.rx_synthesizer_frequency_hz=UPLINK_DCS1;
   //   default_init_param.tx_synthesizer_frequency_hz=DOWNLINK_DCS1;
//U23 UL
      paru=0;
      paru = ad9361_init(4,&ad9361_phy[4], &default_init_param);//function which initialize the ad9361 board for 2400Mhz
      if((paru==-ENODEV)||(paru==-ENOMEM)){
             ad9361_phy[4]=NULL;
             return paru;
         }
      if(ad9361_phy[4]!=NULL){
          paru=ad9361_trx_load_enable_fir(ad9361_phy[4], rx_fir_config, tx_fir_config);
         SysCtlDelay(2000);
         if(paru<0){
             ad9361_phy[4]=NULL;
             return paru;
         }
      }
//UU28 DL
         paru=0;
         paru = ad9361_init(5,&ad9361_phy[5], &default_init_param);//function which initialize the ad9361 board for 2400Mhz
         if((paru==-ENODEV)||(paru==-ENOMEM)){
                ad9361_phy[5]=NULL;
                return paru;
            }

         SysCtlDelay(2 * 1600);
         if(ad9361_phy[5]!=NULL){
         paru=ad9361_trx_load_enable_fir(ad9361_phy[5], rx_fir_config, tx_fir_config);
         if(paru<0){
             ad9361_phy[5]=NULL;
             return paru;
         }

         }
         SysCtlDelay(2000);


         SysCtlDelay(2 * 16000000);
         //ad9361_set_tx_attenuation(ad9361_phy[4], 1,69);
         //ad9361_set_tx_attenuation(ad9361_phy[5], 1,69);
         if(ad9361_phy[4]!=NULL)
         ad9361_set_tx_lo_freq(ad9361_phy[4], UPLINK_DCS1);
         SysCtlDelay(2000);
         if(ad9361_phy[5]!=NULL)
         ad9361_set_rx_lo_freq(ad9361_phy[5], DOWNLINK_DCS1);
         SysCtlDelay(2000);
/*
         GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_2 | GPIO_PIN_3,
          GPIO_PIN_2 | ~GPIO_PIN_3);
          SysCtlDelay(2 * 16000000);
          GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_2 | GPIO_PIN_3,
                  ~GPIO_PIN_2 | GPIO_PIN_3);
*/
         LedBlink();
 //U33 & U39
         //U33 UL
         paru=0;
          paru = ad9361_init(6,&ad9361_phy[6], &default_init_param);//function which initialize the ad9361 board for 2400Mhz
          if((paru==-ENODEV)||(paru==-ENOMEM)){
                 ad9361_phy[6]=NULL;
                 return paru;
             }

          paru=ad9361_trx_load_enable_fir(ad9361_phy[6], rx_fir_config, tx_fir_config);
          if(paru<0){
              ad9361_phy[6]=NULL;
              return paru;
          }
          SysCtlDelay(2000);
         //U39 DL
          paru=0;
          paru = ad9361_init(7,&ad9361_phy[7], &default_init_param);//function which initialize the ad9361 board for 2400Mhz
          if((paru==-ENODEV)||(paru==-ENOMEM)){
              ad9361_phy[7]=NULL;
              return paru;
          }

          SysCtlDelay(2 * 1600);
          paru=ad9361_trx_load_enable_fir(ad9361_phy[7], rx_fir_config, tx_fir_config);
          if(paru<0){
              ad9361_phy[7]=NULL;
              return paru;
          }
          SysCtlDelay(2000);


          SysCtlDelay(2 * 16000000);
          ad9361_set_tx_attenuation(ad9361_phy[6], 1,69);
          ad9361_set_tx_attenuation(ad9361_phy[7], 1,69);

          ad9361_set_tx_lo_freq(ad9361_phy[6], UPLINK_DCS2);
          SysCtlDelay(2000);
          ad9361_set_rx_lo_freq(ad9361_phy[7], DOWNLINK_DCS2);
          SysCtlDelay(2000);

/*
          GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_2 | GPIO_PIN_3,
                    GPIO_PIN_2 | ~GPIO_PIN_3);
          SysCtlDelay(2 * 16000000);
          GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_2 | GPIO_PIN_3,
                            ~GPIO_PIN_2 | GPIO_PIN_3);
 */
    LedBlink();
    fpga_reset();
    int i;
    for (i = 0; i < 5; i++) {
        /*GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_2 | GPIO_PIN_3,
        GPIO_PIN_2 | ~GPIO_PIN_3);
        SysCtlDelay(1.5 * 16000000);
        GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_2 | GPIO_PIN_3,
                ~GPIO_PIN_2 | GPIO_PIN_3);
                */
        LedBlink();
       // SysCtlDelay(1.5 * 16000000);
        /*ad9361_set_tx_attenuation(6,ad9361_phy, 1,i);  SysCtlDelay(.4 * 16000000);
         ad9361_set_tx_attenuation(8,ad9361_phy, 1,i);  SysCtlDelay(.4 * 16000000);
         ad9361_set_tx_attenuation(4,ad9361_phy, 1,i);  SysCtlDelay(.4 * 16000000);
         ad9361_set_tx_attenuation(5,ad9361_phy, 1,i);  SysCtlDelay(.4 * 16000000);
         ad9361_set_tx_attenuation(7,ad9361_phy, 1,i);  SysCtlDelay(.4 * 16000000);
         ad9361_set_tx_attenuation(1,ad9361_phy, 1,i);  SysCtlDelay(.4 * 16000000);
         ad9361_set_tx_attenuation(3,ad9361_phy, 1,i);  SysCtlDelay(.4 * 16000000);
         ad9361_set_tx_attenuation(2,ad9361_phy, 1,i);  SysCtlDelay(.4 * 16000000);*/
    }
    return paru;
}
int set_rx_gain_downlink(int bandnumind0,int32_t gainval ){
    int retval=0;
    int a;
     DECODE_AD_NUMBER(bandnumind0,1,retval);
    struct ad9361_rf_phy *phy=ad9361_phy[retval];
    a = ad9361_set_rx_rf_gain(phy, 1, gainval); //70//74
//ad9361_set_rx_gain_control_mode(phy, 1, 0);
    if (a < 0) {
        return -error_1;
    }
    return 0;
}
int set_rx_gain_uplink(int bandnumind0,int32_t gainval ){
    int retval=0;
    int a;
    DECODE_AD_NUMBER(bandnumind0,0,retval);
    struct ad9361_rf_phy *phy=ad9361_phy[retval];
    a = ad9361_set_rx_rf_gain(phy, 1, gainval); //70//74
//ad9361_set_rx_gain_control_mode(phy, 1, 0);
    if (a < 0) {
        return -error_1;
    }
    return 0;
}
int ad_ctrl_mode_ul(int bandnumind0,int Mode) {
    int retval=0;
     int a;
     DECODE_AD_NUMBER(bandnumind0,0,retval);
     struct ad9361_rf_phy *phy=ad9361_phy[retval];
     if(phy==NULL)
         return -error_1;
     a = ad9361_set_rx_gain_control_mode(phy, 1, Mode);
     if (a < 0) {
         return -error_1;
     }
return 0;
}
int ad_ctrl_mode_dl(int bandnumind0,int Mode) {
    int retval=0;
     int a;
     DECODE_AD_NUMBER(bandnumind0,1,retval);
     struct ad9361_rf_phy *phy=ad9361_phy[retval];
     if(phy==NULL)
         return -error_1;

     a = ad9361_set_rx_gain_control_mode(phy, 1, Mode);
     if (a < 0) {
         return -error_1;
     }
     return 0;
}
int set_local_oscillator_downlink(uint64_t central_downlink_freq, int bandnumind0) {//index with zero
    int32_t a;
    int retval=0;
    uint64_t tcentral_downlink_freq = central_downlink_freq*100000;
    DECODE_AD_NUMBER(bandnumind0,1,retval);
    struct ad9361_rf_phy *phy=ad9361_phy[retval];
    if(phy==NULL)
        return -error_1;

    a = ad9361_set_tx_lo_freq(phy, tcentral_downlink_freq);
    if (a < 0) {
        return -error_1;
    }
    SysCtlDelay(200);
    a = ad9361_set_rx_lo_freq(phy, tcentral_downlink_freq);
    if (a < 0) {
        return -error_1;
    }
    SysCtlDelay(200);
    return 0;
}

int set_local_oscillator_uplink(uint64_t central_uplink_freq,  int bandnumind0) {
    int32_t a;
    int retval=0;
    uint64_t tcentral_uplink_freq =central_uplink_freq*100000;
    DECODE_AD_NUMBER(bandnumind0,0,retval);
    struct ad9361_rf_phy *phy=ad9361_phy[retval];
    if(phy==NULL)
        return -error_1;

    a = ad9361_set_rx_lo_freq(phy, tcentral_uplink_freq);
    if (a < 0) {
        return -error_1;
    }
    SysCtlDelay(200);
    a = ad9361_set_tx_lo_freq(phy, tcentral_uplink_freq);
    if (a < 0) {
        return -error_1;
    }
    SysCtlDelay(200);

    return 0;
}
int set_lo_freq(struct ad9361_rf_phy *phy, uint64_t central_uplink_freq,int tx){
    if(phy==0){
        return -1;
    }
    uint64_t tcentral_uplink_freq =central_uplink_freq*100000;
    if(tx==1){
        ad9361_set_tx_lo_freq(phy, tcentral_uplink_freq);
    }
    else
        ad9361_set_rx_lo_freq(phy, tcentral_uplink_freq);
    return 0;
}
int set_ad_att_dl(int32_t attainval,  int bandnumind0) {
    int32_t a;
    int retval=0;
    bandnumind0=bandnumind0-1;
    DECODE_AD_NUMBER(bandnumind0,1,retval);
    struct ad9361_rf_phy *phy=ad9361_phy[retval];
    if(phy !=NULL)
        a = ad9361_set_tx_attenuation(phy, 1,attainval);
    if (a < 0) {
        return -error_1;
    }
    SysCtlDelay(200);
    return 0;
}
int set_ad_att_ul(int32_t attainval,  int bandnumind0) {
    int32_t a;
    int retval=0;
    bandnumind0=bandnumind0-1;
    DECODE_AD_NUMBER(bandnumind0,0,retval);
    struct ad9361_rf_phy *phy=ad9361_phy[retval];
    if(phy !=NULL)
        a = ad9361_set_tx_attenuation(phy, 1,attainval);
    if (a < 0) {
        return -error_1;
    }
    SysCtlDelay(200);
    return 0;
}
int getRxRssiUl(int bandnumind0){
    int retval=0;
    struct rf_rssi rssi;
    DECODE_AD_NUMBER(bandnumind0,0,retval);
    struct ad9361_rf_phy *phy=ad9361_phy[retval];
    ad9361_get_rx_rssi(phy,1,&rssi);
    // ad9361_spi_write(phy->spi, 0x158, 240);
   // return(ad9361_get_rx_rssi (phy,1,&rssi));
}
int getTxRssiUl(int bandnumind0){
    int retval=0;
    int rssi;
    DECODE_AD_NUMBER(bandnumind0,0,retval);
    struct ad9361_rf_phy *phy=ad9361_phy[retval];
    ad9361_spi_write(phy->spi, 0x71, 0xC1);
    return(ad9361_get_tx_rssi (phy,1,&rssi));
}
int read_ad_power_dl(int32_t *powerval,  int bandnumind0){

    int retval=0;
    bandnumind0=bandnumind0-1;
    DECODE_AD_NUMBER(bandnumind0,1,retval);
    struct ad9361_rf_phy *phy=ad9361_phy[retval];
    ad9361_spi_write(phy->spi, 0x158, 240);
    *powerval= ad9361_spi_read(phy->spi, 0x1A9);
    return 0;
}
int read_ad_power_ul(int32_t *powerval,  int bandnumind0){

    int retval=0;
    bandnumind0=bandnumind0-1;
    DECODE_AD_NUMBER(bandnumind0,0,retval);

    struct ad9361_rf_phy *phy=ad9361_phy[retval];
    ad9361_spi_write(phy->spi, 0x158, 240);
    *powerval= ad9361_spi_read(phy->spi, 0x1A9);
    return 0;
}
