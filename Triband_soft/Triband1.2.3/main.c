#include <stdio.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "inc/hw_memmap.h"

#include "inc/hw_gpio.h"

#include "inc/hw_sysctl.h"
#include "inc/hw_types.h"
#include "inc/hw_uart.h"


#include "driverlib/debug.h"
#include "driverlib/flash.h"
#include "driverlib/fpu.h"
#include "driverlib/gpio.h"
#include "driverlib/pin_map.h"
#include "driverlib/rom.h"
#include "driverlib/rom_map.h"
#include "driverlib/sysctl.h"
#include "driverlib/systick.h"
#include "driverlib/uart.h"
#include "driverlib/timer.h"
#include "driverlib/eeprom.h"
#include "driverlib/adc.h"
#include "modem_handler.h"

// for buildig bin file "${CCE_INSTALL_ROOT}/utils/tiobj2bin/tiobj2bin" "${BuildArtifactFileName}" "${BuildArtifactFileBaseName}.bin" "${CG_TOOL_ROOT}/bin/armofd" "${CG_TOOL_ROOT}/bin/armhex" "${CCE_INSTALL_ROOT}/utils/tiobj2bin/mkhex4bin"


//#include "utils/uartstdio.h"

#include "definitions.h"



#include "alc_power.h"

#include "spi_flash.h"
#include "othInterfaceHandler.h"
#include "adHandler.h"
#include "systemFunctions.h"
#include "user_interface_recieve.h"
#include "eepromHandler.h"
#include "global.h"

#define TARGET_IS_TM4C129_RA1
repeater_board gTriband_board;
final_attn_band band_runtime_attn[4];
//header HEAD;
eLED_STATE gLed_State;
extern AD9361_InitParam default_init_param;
extern struct ad9361_rf_phy  *ad9361_phy[8];
hump_data gHumpInfo_50t[MAX_TOTAL_HUMP_ON_FPGA];//max  humps for all bands
hump_data gHumpInfo_35t[MAX_TOTAL_HUMP_ON_FPGA];
volatile unsigned long long gL_currentTime=0;//in half second it will increament
//*****************************************************************************
//
// A mapping from the ASCII value received from the UART to the corresponding
// USB HID usage code.
//
//*****************************************************************************






#ifdef DEBUG
void
__error__(char *pcFilename, uint32_t ui32Line)
{
}
#endif









volatile uint32_t g_ui32Flags = 0;
char *g_pcStatus;
volatile int giflgDataRecved=0;
bool bLastSuspend=0;
uint_fast32_t ui32LastTickCount;
//*****************************************************************************
//
// This is the main loop that runs the application.
//
//*****************************************************************************
//#include "AdInit.h"

#include "usblib/usblib.h"
#include "usblib/usbhid.h"
#include "usblib/device/usbdevice.h"
#include "usblib/device/usbdhid.h"
#include "usblib/device/usbdhidkeyb.h"
#include "usb_keyb_structs.h"
#include "inc/hw_nvic.h"
volatile bool g_bConnected = false;
volatile bool trigger = false;
volatile bool g_bSuspended = false;
uint32_t ui32PLLRate;

extern uint32_t g_ui32SysTickCount;
extern uint32_t ui32SysClock;
extern uint8_t send_new[64];
int doOther(unsigned long long ctrl);
unsigned long long gCounter=0;
static const int8_t g_ppi8KeyUsageCodes[][2] =
{
    { 0, HID_KEYB_USAGE_SPACE },                       //   0x20
};
volatile enum
{
    //
    // Unconfigured.
    //
    STATE_UNCONFIGURED,

    //
    // No keys to send and not waiting on data.
    //
    STATE_IDLE,

    //
    // Waiting on data to be sent out.
    //
    STATE_SENDING
}
g_eKeyboardState = STATE_UNCONFIGURED;
void init_usb(){
    //
     // Initialize the USB stack for device mode.
     //
     USBStackModeSet(0, eUSBModeDevice, 0);

     //
     // Tell the USB library the CPU clock and the PLL frequency.  This is a
     // new requirement for TM4C129 devices.
     //
     SysCtlVCOGet(SYSCTL_XTAL_25MHZ, &ui32PLLRate);
     USBDCDFeatureSet(0, USBLIB_FEATURE_CPUCLK, &ui32SysClock);
     USBDCDFeatureSet(0, USBLIB_FEATURE_USBPLL, &ui32PLLRate);

     //
     // Pass our device information to the USB HID device class driver,
     // initialize the USB controller and connect the device to the bus.
     //
     USBDHIDKeyboardInit(0, &g_sKeyboardDevice);

     //
     // Set the system tick to fire 100 times per second.
     //
     g_bConnected = false;
     g_bSuspended = false;
     HWREG(NVIC_ST_CTRL)^= NVIC_ST_CTRL_CLK_SRC;
     ROM_SysTickPeriodSet(ui32SysClock / SYSTICKS_PER_SECOND);
     ROM_SysTickIntEnable();
     ROM_SysTickEnable();
     g_eKeyboardState = STATE_UNCONFIGURED;
 }

uint32_t KeyboardHandler(void *pvCBData, uint32_t ui32Event, uint32_t ui32MsgData,
                void *pvMsgData)
{
    switch (ui32Event)
    {
        //
        // The host has connected to us and configured the device.

        case USB_EVENT_CONNECTED:
        {
            g_bConnected = true;
            g_bSuspended = false;
            break;
        }

        //
        // The host has disconnected from us.
        //
        case USB_EVENT_DISCONNECTED:
        {
            g_bConnected = false;
            break;
        }

        //
        // We receive this event every time the host acknowledges transmission
        // of a report. It is used here purely as a way of determining whether
        // the host is still talking to us or not.
        //
        case USB_EVENT_TX_COMPLETE:
        {
            //
            // Enter the idle state since we finished sending something.
            //
            g_eKeyboardState = STATE_IDLE;
            break;
        }

        //
        // This event indicates that the host has suspended the USB bus.
        //
        case USB_EVENT_SUSPEND:
        {
            g_bSuspended = true;
            break;
        }

        //
        // This event signals that the host has resumed signalling on the bus.
        //
        case USB_EVENT_RESUME:
        {
            g_bSuspended = false;
            break;
        }

        //
        // This event indicates that the host has sent us an Output or
        // Feature report and that the report is now in the buffer we provided
        // on the previous USBD_HID_EVENT_GET_REPORT_BUFFER callback.
        //
        case USBD_HID_KEYB_EVENT_SET_LEDS:
        {
            //
            // Set the LED to match the current state of the caps lock LED.
            //
           // ROM_GPIOPinWrite(GPIO_PORTN_BASE, GPIO_PIN_0,
           //                  (ui32MsgData & HID_KEYB_CAPS_LOCK) ? GPIO_PIN_0 :
            //                 0);

            break;
        }

        //
        // We ignore all other events.
        //
        default:
        {
            break;
        }
    }

    return(0);
}
//***************************************************************************
//
// Wait for a period of time for the state to become idle.
//
// \param ui32TimeoutTick is the number of system ticks to wait before
// declaring a timeout and returning \b false.
//
// This function polls the current keyboard state for ui32TimeoutTicks system
// ticks waiting for it to become idle.  If the state becomes idle, the
// function returns true.  If it ui32TimeoutTicks occur prior to the state
// becoming idle, false is returned to indicate a timeout.
//
// \return Returns \b true on success or \b false on timeout.
//
//***************************************************************************
bool
WaitForSendIdle(uint_fast32_t ui32TimeoutTicks)
{
    uint32_t ui32Start;
    uint32_t ui32Now;
    uint32_t ui32Elapsed;

    ui32Start = g_ui32SysTickCount;
    ui32Elapsed = 0;
//    g_eKeyboardState = STATE_IDLE;
    while(ui32Elapsed < ui32TimeoutTicks)
    {
        //
        // Is the keyboard is idle, return immediately.
        //
        if(g_eKeyboardState == STATE_IDLE)
        {
            return(true);
        }

        //
        // Determine how much time has elapsed since we started waiting.  This
        // should be safe across a wrap of g_ui32SysTickCount.
        //
        ui32Now = g_ui32SysTickCount;
        ui32Elapsed = ((ui32Start < ui32Now) ? (ui32Now - ui32Start) :
                     (((uint32_t)0xFFFFFFFF - ui32Start) + ui32Now + 1));
    }

    //
    // If we get here, we timed out so return a bad return code to let the
    // caller know.
    //
    return(false);
}

//*****************************************************************************
//
// Sends a string of characters via the USB HID keyboard interface.
//
//*****************************************************************************
void
SendString(char *pcStr)
{
    uint32_t ui32Char;

    //
    // Loop while there are more characters in the string.
    //
    while(*pcStr)
    {
        //
        // Get the next character from the string.
        //
        ui32Char = *pcStr++;

        //
        // Skip this character if it is a non-printable character.
        //
        if((ui32Char < ' ') || (ui32Char > '~'))
        {
            continue;
        }

        //
        // Convert the character into an index into the keyboard usage code
        // table.
        //
        ui32Char -= ' ';

        //
        // Send the key press message.
        //
        g_eKeyboardState = STATE_SENDING;
        if(USBDHIDKeyboardKeyStateChange((void *)&g_sKeyboardDevice,
                                         g_ppi8KeyUsageCodes[ui32Char][0],
                                         g_ppi8KeyUsageCodes[ui32Char][1],
                                         true) != KEYB_SUCCESS)
        {
            return;
        }
        //
        // Wait until the key release message has been sent.
        //
        if(!WaitForSendIdle(MAX_SEND_DELAY))
        {
            g_bConnected = 0;
            return;
        }
    }
}
void SendCharUSB(uint8_t *send)
{
    memset(&send_new[0], '\0', 64);
    memcpy(&send_new[0], send, 64);
     /*for(i= 0; i<64; i++)
        {
         send_new[i] = '\0';
          send_new[i] = *send++;
        }*/
     trigger = true;
     if(trigger == true)
                 {
                     //
                     // If the bus is suspended then resume it.  Otherwise, type
                     // some "random" characters.
                     //
                     if(g_bSuspended)
                     {
                         USBDCDRemoteWakeupRequest ((void *)&g_sKeyboardDevice);
                     }
                     else
                     {
                     SendString(" ");
                     trigger = false;
                     }
                 }
     return;
}
prevPeripheralState stPrevperipheralState;
Alarm systemAlarm;
main(void)
{
    system_modem mdm;
    int i=0;
    modem lmod;
    int adnum=0;
    int jLoop=0;
    uint64_t defdl,deful;
    unsigned long long cntr=69;
	gLed_State = red_green;
	initmodem(&mdm);
	init_hardware();
volatile char tt=255;
//	i=EEPROM_BAND_ADDRESS(1);
	memset((char *)&gTriband_board,0,sizeof(repeater_board));
	//memset((char *)&mdm,0,sizeof(system_modem));
	/*gTriband_board.repeater_band[2].bandType=3;
	gTriband_board.repeater_band[3].bandType=4;
	program_eeprom_band((uint32_t *)&gTriband_board.repeater_band[2],3);
	program_eeprom_band((uint32_t *)&gTriband_board.repeater_band[3],4);
	*/
	read_all_data();


	//gHumpInfo_50t[1].hump_id=2;
    //program_eeprom((uint32_t *)&gHumpInfo_50t[0],EEPROM_HUMP_FPGA1_ADDRESS, sizeof(gHumpInfo_50t));

	//memset(&gTriband_board.repeater_band[0].calib_data_ar_ul,0,32);
	//memset()
    init_var();

    for(i=0;i<8;i++)
        ad9361_phy[i]=NULL;
    gLed_State = red_steady;
   // LedBlink();
    SysCtlDelay(4 * 16000000);//let ad boot
  //  pa_uplink_onoff (1,0);
    if(init_all_AD() < 0)
    {
        gLed_State = red_steady;
    }
    else{
        gLed_State = green_steady;
    }
    init_usb();
    //initmodem(&mdm);
    SysCtlDelay(4 * 16000000);//let ad boot
    enableTimer();
    if( gLed_State != red_steady)
        gLed_State = red_blink;
    //LedBlink();
    // The main loop starts here.  We begin by waiting for a host connection
    // then drop into the main keyboard handling section.  If the host
    // disconnects, we return to the top and wait for a new connection.
    //configure fpga
  //  gTriband_board.repeater_band[0].bandType=255;
     /*
    for(i=0;i<4;i++){
        band_runtime_attn[i].uplink_attn =
                gTriband_board.repeater_band[i].comp_attn_uplink_DCA
                      + gTriband_board.repeater_band[i].comp_attn_uplink_AD
                      + gTriband_board.repeater_band[i].attn_uplink_AD
                      + gTriband_board.repeater_band[i].attn_uplink_DCA
                      + (gTriband_board.repeater_band[i].Gain_set_uplink - gTriband_board.repeater_band[i].Gain_uplink);
        band_runtime_attn[i].downlink_attn =
                gTriband_board.repeater_band[i].comp_attn_downlink_DCA
                          + gTriband_board.repeater_band[i].comp_attn_downlink_AD
                          + gTriband_board.repeater_band[i].attn_downlink_AD
                          + gTriband_board.repeater_band[i].attn_downlink_DCA
                          + (gTriband_board.repeater_band[i].Gain_set_downlink - gTriband_board.repeater_band[i].Gain_downlink);
    }
    */

/*
strcpy(gTriband_board.sys_detail.part_number,"123");
gTriband_board.repeater_band[0].bandType=2;
gTriband_board.repeater_band[0].total_hump=3;
gTriband_board.repeater_band[0].lo_enable=1;
gTriband_board.repeater_band[0].alc_on_off=1;
gTriband_board.repeater_band[0].PA_auto_on_off=1;
gTriband_board.repeater_band[0].PA_downlink=2,
gTriband_board.repeater_band[0].PA_uplink=3;
gTriband_board.repeater_band[0].Testing_Mode=1;

gTriband_board.repeater_band[0].total_hump=3;
gTriband_board.repeater_band[0].calib_max_uplink=4;
gTriband_board.repeater_band[0].calib_max_downlink=5;

gTriband_board.repeater_band[0].alc_downlink_level=6;
gTriband_board.repeater_band[0].alc_uplink_level=7;

gTriband_board.repeater_band[0].auto_scale_downlink=8;
gTriband_board.repeater_band[0].auto_scale_uplink=9;

gTriband_board.repeater_band[0].offset_downlink=10;
gTriband_board.repeater_band[0].offset_uplink=11;

gTriband_board.repeater_band[0].comp_attn_downlink=12;
gTriband_board.repeater_band[0].comp_attn_downlink=13;
gTriband_board.repeater_band[0].attn_downlink=14;
gTriband_board.repeater_band[0].attn_downlink=15;

gTriband_board.repeater_band[0].comp_attn_uplink=16;
gTriband_board.repeater_band[0].comp_attn_uplink=17;
gTriband_board.repeater_band[0].attn_uplink=18;
gTriband_board.repeater_band[0].attn_uplink=19;

gTriband_board.repeater_band[0].Gain_downlink=20;
gTriband_board.repeater_band[0].Gain_uplink=21;

gTriband_board.repeater_band[0].Max_gain_downlink=22;
        gTriband_board.repeater_band[0].Max_Gain_uplink=23;

gTriband_board.repeater_band[0].Central_frequency_downlink=876;
gTriband_board.repeater_band[0].Central_frequency_uplink=4567;
gTriband_board.repeater_band[0].start_frequency=513;
gTriband_board.repeater_band[0].stop_frequency=512;
gTriband_board.repeater_band[0].ad_lo_def_frequency=1234;


gTriband_board.repeater_band[0].repHump[0].hump_id=12;
gTriband_board.repeater_band[0].repHump[0].hump_present=1;
gTriband_board.repeater_band[0].repHump[0].hump_on_off=1;
gTriband_board.repeater_band[0].repHump[0].center_freq_downlink=123;
gTriband_board.repeater_band[0].repHump[0].center_freq_uplink=345;
gTriband_board.repeater_band[0].repHump[0].downlink_attn=4;
gTriband_board.repeater_band[0].repHump[0].uplink_attn=3;
gTriband_board.repeater_band[0].repHump[0].downlink_comp=2;
gTriband_board.repeater_band[0].repHump[0].uplink_comp=1;
gTriband_board.repeater_band[0].repHump[0].start_channel=512;
gTriband_board.repeater_band[0].repHump[0].stop_channel=891;
gTriband_board.repeater_band[0].repHump[0].saw_bandwidth=5;
strcpy(lmod.LAC,"lacid123");
strcpy(lmod.CELL,"cellid123");
strcpy(lmod.ServerIP,"111.222.333.444");
strcpy(lmod.PORT,"5001");
strcpy(lmod.APN,"wwwAPN");
strcpy(lmod.IMEI,"IMEI123");
strcpy(lmod.smsnumber,"+919810568850");
lmod.modem_mode=1;
lmod.modem_tech=2;

memcpy(&gTriband_board.modem_detail,&lmod,sizeof(lmod));
*/
//now set ad parameter
/*
    for(i=0;i<4;i++){
                struct ad9361_rf_phy *phy=ad9361_phy[adnum];
                if(phy!=NULL){
                band_data* band=&gTriband_board.repeater_band[i];
                if(band->lo_enable==1)
                    set_local_oscillator_uplink(band->Central_frequency_uplink,i)
                    ad9361_set_tx_lo_freq(phy, band->Central_frequency_uplink);
                adnum=adnum+1;
                phy=ad9361_phy[adnum];
                adnum=adnum+1;
                if(band->lo_enable==1)
                    set_local_oscillator_downlink(band->Central_frequency_downlink,i)
                    ad9361_set_tx_lo_freq(phy, band->Central_frequency_downlink);
                }
               // apply_alc_downlink(alc_power,i,phy);

    }
*/
i=0;
/*
if(band==0){
    defdl= 9475*100000;
    deful=9025*100000;
}
else if(band==2){
        defdl= 21400*100000;
        deful=19500*100000;
    }
else{
        defdl= 18250*100000;
        deful=17300*100000;
    }
*/
band_data* band=&gTriband_board.repeater_band[i];

       // if(band->lo_enable==1){
          //  set_local_oscillator_uplink(band->Central_frequency_uplink,i);
           // set_local_oscillator_downlink(band->Central_frequency_downlink,i);
        //}
//upl = 9025, dnl = 9475;
//defdl= 9425;
 deful=9025;  //if not manual then set this other wise ul or dl 4321 then vco fail
 defdl= 9475;
 //deful= 8975;
 //defdl= 9329;
// deful= 8879;
 // deful=8975;  //if not manual then set this other wise ul or dl 4321 then vco fail
//in auto set this for manual something else
//if(testing mode)
 gTriband_board.repeater_band[0].ad_lo_def_frequency=defdl;
 gTriband_board.repeater_band[1].ad_lo_def_frequency=21400;
 gTriband_board.repeater_band[2].ad_lo_def_frequency=gTriband_board.repeater_band[2].Central_frequency_downlink;
 gTriband_board.repeater_band[3].ad_lo_def_frequency=gTriband_board.repeater_band[3].Central_frequency_downlink;
// gTriband_board.repeater_band[2].ad_lo_def_frequency=18250;
// gTriband_board.repeater_band[3].ad_lo_def_frequency=18250;


 struct ad9361_rf_phy *phy=ad9361_phy[0];
/*
 * if(manual){then
        set_lo_freq(phy, band->Central_frequency_downlink,1); //U3 AD80305 SIDE TX FREQUENCY SETTING
        SysCtlDelay(200);
        set_lo_freq(phy, band->Central_frequency_uplink,0); //U3 AD80305 SIDE RX FREQUENCY SETTING
         phy=ad9361_phy[1];
        SysCtlDelay(200);
        set_lo_freq(phy, band->Central_frequency_downlink,0); //U7 AD80305 SIDE RX FREQUENCY SETTING
        SysCtlDelay(200);
        set_lo_freq(phy, band->Central_frequency_uplink,1); //U7 AD80305 SIDE TX FREQUENCY SETTING
else {*/
 //  U3 & U8 gsm
     if(phy!=NULL){
         set_lo_freq(phy, defdl,1); //U3 UL AD80305 SIDE TX FREQUENCY SETTING
        SysCtlDelay(200);
        set_lo_freq(phy, deful,0); //U3 UL AD80305 SIDE RX FREQUENCY SETTING
        phy=ad9361_phy[1];
        SysCtlDelay(200);
        set_lo_freq(phy, defdl,0); //U8 DL AD80305 SIDE RX FREQUENCY SETTING
        SysCtlDelay(200);
        set_lo_freq(phy, deful,1); //U8 DL AD80305 SIDE TX FREQUENCY SETTING
     }
        defdl= 21400;
        deful=19500;  //if not manual then set this other wise ul or dl 4321 then vco fail

        phy=ad9361_phy[2];
        if(phy!=NULL){

        set_lo_freq(phy, defdl,1); //U13 UL AD80305 SIDE TX FREQUENCY SETTING
        SysCtlDelay(200);
        set_lo_freq(phy, deful,0); //U13 UL AD80305 SIDE RX FREQUENCY SETTING
        phy=ad9361_phy[3];
        SysCtlDelay(200);
        set_lo_freq(phy, defdl,0); //U18 DL AD80305 SIDE RX FREQUENCY SETTING
        SysCtlDelay(200);
        set_lo_freq(phy, deful,1); //U18 DL AD80305 SIDE TX FREQUENCY SETTING
        }
        defdl= gTriband_board.repeater_band[2].Central_frequency_downlink;// 18250;
        deful=gTriband_board.repeater_band[2].Central_frequency_uplink;// 17300;  //if not manual then set this other wise ul or dl 4321 then vco fail

        phy=ad9361_phy[4];
//U23 Dl output UL input in ul path
        if(phy!=NULL){

        set_lo_freq(phy, defdl,1); //U23 UL AD80305 SIDE TX FREQUENCY SETTING
        SysCtlDelay(200);
        set_lo_freq(phy, deful,0); //U23 UL AD80305 SIDE RX FREQUENCY SETTING
        phy=ad9361_phy[5];
        SysCtlDelay(200);
        set_lo_freq(phy, defdl,0); //U28 DL AD80305 SIDE RX FREQUENCY SETTING
        SysCtlDelay(200);
        set_lo_freq(phy, deful,1); //U28 DL AD80305 SIDE TX FREQUENCY SETTING
        }
        defdl= gTriband_board.repeater_band[3].Central_frequency_downlink;// 18250;
        deful=gTriband_board.repeater_band[3].Central_frequency_uplink;// 17300;  //if not manual then set this other wise ul or dl 4321 then vco fail

        phy=ad9361_phy[6];
        if(phy!=NULL){

        set_lo_freq(phy, defdl,1); //U33 UL AD80305 SIDE TX FREQUENCY SETTING
        SysCtlDelay(200);
        set_lo_freq(phy, deful,0); //U33 UL AD80305 SIDE RX FREQUENCY SETTING
        }
        phy=ad9361_phy[7];
        if(phy!=NULL){

        SysCtlDelay(200);
        set_lo_freq(phy, defdl,0); //U39 DL AD80305 SIDE RX FREQUENCY SETTING
        SysCtlDelay(200);
        set_lo_freq(phy, deful,1); //U39 DL AD80305 SIDE TX FREQUENCY SETTING
        }
            if (band->Testing_Mode == '1') {
                        //-------------------------------------------------------------------U3 MAUAL GAIN------------------------------------------------------//

                            ad_ctrl_mode_ul(0, 0);
                            SysCtlDelay(1000);
                            set_rx_gain_uplink(0, 58);
                            SysCtlDelay(1000);
                            //-------------------------------------------------------------------U7 MANUAL GAIN-----------------------------------------------------//
                            ad_ctrl_mode_dl(0, 0);
                            SysCtlDelay(1000);
                            set_rx_gain_downlink(0, 58);
                            SysCtlDelay(2000);
                           // tx1 = tx1 + (25 - gc1); //attenuation when we are trying to measure the noise figure of the system as gain is very high from AD
                           // tx2 = tx2 + (25 - gc2); //attenuation when we are trying to measure the noise figure of the system as gain is very high from AD




                    } else {
                        ad_ctrl_mode_ul(0, 2);
                        SysCtlDelay(1000);
                        ad_ctrl_mode_dl(0, 2);
                        SysCtlDelay(2000);

                        ad_ctrl_mode_ul(1, 2);
                         SysCtlDelay(1000);
                         ad_ctrl_mode_dl(1, 2);
                         SysCtlDelay(2000);

                         ad_ctrl_mode_ul(2, 2);
                         SysCtlDelay(1000);
                         ad_ctrl_mode_dl(2, 2);
                         SysCtlDelay(2000);

                         ad_ctrl_mode_ul(3, 2);
                          SysCtlDelay(1000);
                          ad_ctrl_mode_dl(3, 2);
                          SysCtlDelay(2000);

                      //  set_rx_gain_uplink(0, 30);
                       // set_rx_gain_downlink(0, 30);

                    }
            set_ad_att_dl(cntr,1);
            set_ad_att_ul(cntr,1);
            //fpga_reset();
            if( gLed_State != red_steady)
                gLed_State = red_green;
            SysCtlDelay(120000000);
            SysCtlDelay(120000000);
            //SysCtlDelay(120000000);
            //SysCtlDelay(120000000);
            if( gLed_State != red_steady)
                gLed_State =  green_steady;

           // gTriband_board.repeater_band[2].total_hump=1;
            //  gTriband_board.repeater_band[0].total_hump=1;

             if(gTriband_board.repeater_band[0].bandType!=255){

               if(gTriband_board.repeater_band[0].total_hump<=7)
                   for(i=0;i<gTriband_board.repeater_band[0].total_hump;i++)
                       set_fpga_param(&gTriband_board.repeater_band[0],1,i+1);
               if(gTriband_board.repeater_band[1].total_hump<=7)
                   for(i=0;i<gTriband_board.repeater_band[1].total_hump;i++)
                       set_fpga_param(&gTriband_board.repeater_band[1],2,i+1);
               if(gTriband_board.repeater_band[2].total_hump<=7)
                   for(i=0;i<gTriband_board.repeater_band[2].total_hump;i++)
                       set_fpga_param(&gTriband_board.repeater_band[2],3,i+1);
               if(gTriband_board.repeater_band[3].total_hump<=7)
                   for(i=0;i<gTriband_board.repeater_band[3].total_hump;i++)
                       set_fpga_param(&gTriband_board.repeater_band[3],4,i+1);
             }


 //           testFPGA(1);
    while (cntr>0){
        //set_ad_att_dl(cntr,0);
        //set_ad_att_ul(cntr,0);
        set_ad_att_dl(cntr,1);
        set_ad_att_ul(cntr,1);
        set_ad_att_dl(cntr,2);
         set_ad_att_ul(cntr,2);
         set_ad_att_dl(cntr,3);
           set_ad_att_ul(cntr,3);
           set_ad_att_dl(cntr,4);
             set_ad_att_ul(cntr,4);
        SysCtlDelay(1500000);
       cntr--;
    }
    /*
    for(cntr=0;cntr<=31;cntr++){
          write_at_shift_reg_ul(1,cntr);
          SysCtlDelay(15000000);
    }
    */
   //  system_calibration_uplink(&gTriband_board.repeater_band[0],1);
  //   write_at_shift_reg_ul(1,1);
  //   write_at_shift_reg_ul(2,1);
   //  SysCtlDelay(120000000);
   //  grecCount=0;
   //  gmaxC=gTriband_board.repeater_band[0].calib_max_uplink;
  //   gTriband_board.repeater_band[0].calibstateUl=1;

   //  gTriband_board.repeater_band[0].alc_on_off=1;
   //  gTriband_board.repeater_band[0].Gain_uplink=70;
   //  gTriband_board.repeater_band[0].alc_uplink_level=-22;
    //  rband->calib_max_uplink=-40;
    //  rband->PA_uplink=1;
/*
for(i=0;i<4;i++){
    int cLoop=0;
band_data* band=&gTriband_board.repeater_band[i];
cLoop=jLoop;
       // if(band->lo_enable==1){
          //  set_local_oscillator_uplink(band->Central_frequency_uplink,i);
           // set_local_oscillator_downlink(band->Central_frequency_downlink,i);
        //}
        struct ad9361_rf_phy *phy=ad9361_phy[jLoop];

        set_lo_freq(phy, band->Central_frequency_downlink,1); //U3 AD80305 SIDE TX FREQUENCY SETTING
        SysCtlDelay(100);
        set_lo_freq(phy, band->Central_frequency_uplink,0); //U3 AD80305 SIDE RX FREQUENCY SETTING
         phy=ad9361_phy[jLoop++];
        SysCtlDelay(100);
        set_lo_freq(phy, band->Central_frequency_downlink,0); //U7 AD80305 SIDE RX FREQUENCY SETTING
        SysCtlDelay(100);
        set_lo_freq(phy, band->Central_frequency_uplink,1); //U7 AD80305 SIDE TX FREQUENCY SETTING

            if (band->Testing_Mode == '1') {
                        //-------------------------------------------------------------------U3 MAUAL GAIN------------------------------------------------------//

                            ad_ctrl_mode_ul(cLoop, 0);
                            SysCtlDelay(1000);
                            set_rx_gain_uplink(cLoop, 58);
                            SysCtlDelay(1000);
                            //-------------------------------------------------------------------U7 MANUAL GAIN-----------------------------------------------------//
                            ad_ctrl_mode_dl(cLoop+1, 0);
                            SysCtlDelay(1000);
                            set_rx_gain_downlink(cLoop+1, 58);
                            SysCtlDelay(1000);
                           // tx1 = tx1 + (25 - gc1); //attenuation when we are trying to measure the noise figure of the system as gain is very high from AD
                           // tx2 = tx2 + (25 - gc2); //attenuation when we are trying to measure the noise figure of the system as gain is very high from AD




                    } else {
                        ad_ctrl_mode_ul(cLoop, 2);
                        SysCtlDelay(1000);
                        ad_ctrl_mode_dl(cLoop+1, 2);
                        SysCtlDelay(1000);
                    }
            // apply_alc_downlink(alc_power,i,phy);

     }
*/
   // TimerEnable(TIMER0_BASE, TIMER_A);              //for on board LED functioning
    /*
    while(1){
        int i=0;
        for(i=0;i<4;i++){
            band_data* alc_power=&gTriband_board.repeater_band[i];
            apply_alc_uplink(alc_power,i);
            apply_alc_downlink(alc_power,i);
//write_at_shift_reg
        }

        if(giflgDataRecved==1){
            giflgDataRecved=0;
            parse_string();//defined in user_inerface_recieve.h
        }

    }
*/
 //   record_coeff(&gTriband_board.repeater_band[0],1,1);
//     band_data* rband,int bandnum,int ul
    gTriband_board.modem_detail.modem_mode=0;
    gTriband_board.modem_detail.modem_tech=0;


   // while(1)
  //      modemLoop();
    while(1)
    {
        while(!g_bConnected)
        {
            if(giflgDataRecved==1){
                giflgDataRecved=0;
                parse_string();//defined in user_inerface_recieve.h
             }
            modemLoop(&mdm);
            doOther(cntr);
        }
        if(g_bConnected == true)
        {
    	g_eKeyboardState = STATE_IDLE;
        bLastSuspend = false;
        }
        while(g_bConnected)
        {
            if(giflgDataRecved==1){
                giflgDataRecved=0;
                parse_string();//defined in user_inerface_recieve.h
            }
            doOther(cntr);
            ui32LastTickCount = g_ui32SysTickCount;
            if(bLastSuspend != g_bSuspended)
            {
                bLastSuspend = g_bSuspended;
                if(bLastSuspend)
                {
                }
                else
                {
                }
            }
        }
            USBDHIDKeyboardRemoteWakeupRequest((void *)&g_sKeyboardDevice);
    }

}

void sendAlarm(int band,int hump, int AlarmId,int AlarmState){
    //from here send to modem also
    char send_buff[255];
    char alm_str[6];
    char almid=AlarmId;
    char almSt=AlarmState;
    //memcpy(&head, &parameter_passed[0], sizeof(sup_header));
    //memcpy(&hd, &parameter_passed[sizeof(sup_header)], sizeof(header));
    //,struct ad9361_rf_phy *phy, eCOMMANDS cmd
    sup_header head;
    header hd;//=(header *)(gcBuf_usb+sizeof(sup_header));
    head.COMMANDS=UNSYNC_ALARM;
    hd.band_num=band;
    hd.hump_no=hump;
    alm_str[0]=',';alm_str[1]=almid;alm_str[2]=',';alm_str[3]=almSt;alm_str[4]='\r';alm_str[5]='\0';
    memset(send_buff,0,sizeof(send_buff));
    memcpy(send_buff,&head,sizeof(sup_header));
    memcpy((char *)&send_buff[sizeof(sup_header)],(char *)&hd,sizeof(header));
    memcpy((char *)&send_buff[sizeof(sup_header)+sizeof(header)],alm_str,6);
}
volatile int gi_sendAlarm=0;
void checkAndSendAlarm(int bandArrayPos,band_data* band){
    int i=bandArrayPos;
    int elec=0;
    if(stPrevperipheralState.prevULOutPower[i] !=stPrevperipheralState.ULOutPower[i]){
              if(stPrevperipheralState.ULOutPower[i]>band->Gain_uplink){
                  systemAlarm.over_pwr_ul[i]=ALARM_SET;
                  gi_sendAlarm=1;
              }
              if(stPrevperipheralState.ULOutPower[i]<-70){
                  systemAlarm.low_pwr_ul[i]=ALARM_SET;
                  gi_sendAlarm=1;
              }
              if((stPrevperipheralState.ULOutPower[i] < 70)&&(stPrevperipheralState.ULOutPower[i] > -70)){
                   systemAlarm.low_pwr_ul[i]=ALARM_CLEAR;
                   systemAlarm.over_pwr_ul[i]=ALARM_CLEAR;
                   gi_sendAlarm=1;
              }
    }
    if(stPrevperipheralState.prevDLOutPower[i] !=stPrevperipheralState.DLOutPower[i]){
                 if(stPrevperipheralState.DLOutPower[i]>band->Gain_downlink){
                     systemAlarm.over_pwr_dl[i]=ALARM_SET;
                     gi_sendAlarm=1;
                 }
                 if(stPrevperipheralState.DLOutPower[i]<-70){
                     systemAlarm.low_pwr_dl[i]=ALARM_SET;
                     gi_sendAlarm=1;
                 }
                 if((stPrevperipheralState.DLOutPower[i] < 70)&&(stPrevperipheralState.DLOutPower[i] > -70)){
                      systemAlarm.low_pwr_dl[i]=ALARM_CLEAR;
                      systemAlarm.over_pwr_dl[i]=ALARM_CLEAR;
                      gi_sendAlarm=1;
                 }
    }
    stPrevperipheralState.ElectricityState=GPIOPinRead(GPIO_PORTN_BASE, GPIO_PIN_1); //gpio n1
    if(stPrevperipheralState.prevElectricityState !=stPrevperipheralState.ElectricityState){
        gi_sendAlarm=1;
        if(stPrevperipheralState.ElectricityState)
            stPrevperipheralState.ElectricityState=ALARM_SET;
        else
            stPrevperipheralState.ElectricityState=ALARM_CLEAR;
    }
    if(gi_sendAlarm==1){
        gi_sendAlarm=0;
    }

    stPrevperipheralState.prevElectricityState=stPrevperipheralState.ElectricityState;
    stPrevperipheralState.prevULOutPower[i]=stPrevperipheralState.ULOutPower[i];
    stPrevperipheralState.prevDLOutPower[i]=stPrevperipheralState.DLOutPower[i];
    stPrevperipheralState.prevDLInPower[i]=stPrevperipheralState.DLInPower[i];
    stPrevperipheralState.prevULInPower[i]=stPrevperipheralState.ULInPower[i];
}
int doOther(unsigned long long ctrl){
    int i=0;
   // gTriband_board.repeater_band[0].calib_max_uplink=-40;
    //SysCtlDelay(15000000);

     for(i=0;i<4;i++){
         band_data* band=&gTriband_board.repeater_band[i];
         if(band->calibstateUl==1){//ul calib
             //apply_alc_uplink(band,i+1,&stPrevperipheralState);
             SysCtlDelay(1000);
            // apply_alc_uplink(band,i,&stPrevperipheralState.ULOutPower[i]);
         }
         else if(band->calibstateDl==1){//dl calib
             //apply_alc_uplink(band,i+1,&stPrevperipheralState.ULOutPower[i]);
             SysCtlDelay(1000);
         }
         else{
           //  apply_alc_uplink(band,i+1,&stPrevperipheralState.ULOutPower[i]);
             SysCtlDelay(1000);
         }
        // apply_alc_uplink(band,i,&stPrevperipheralState.ULOutPower[i]);
         //record_coeff();
         //apply_alc_downlink(band,i,&stPrevperipheralState.DLOutPower[i]);
         if(band->PA_downlink !=stPrevperipheralState.PrevPADl_state[i]){
                 pa_downlink_onoff (band->PA_downlink,i);
                 stPrevperipheralState.PrevPADl_state[i]=band->PA_downlink;
           }
           if(band->PA_uplink !=stPrevperipheralState.PrevPAUl_state[i]){
                 pa_uplink_onoff (band->PA_uplink,i);
                 stPrevperipheralState.PrevPAUl_state[i]=band->PA_uplink;
           }
           checkAndSendAlarm(i,band);

     }

}
