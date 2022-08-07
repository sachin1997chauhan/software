#include <stdio.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "inc/hw_memmap.h"
#include "inc/hw_types.h"
#include "inc/hw_gpio.h"
#include "inc/hw_ints.h"
#include "inc/hw_sysctl.h"
#include "inc/hw_types.h"
#include "inc/hw_uart.h"
#include "inc/hw_nvic.h"

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
#include "driverlib/watchdog.h"
#include "driverlib/interrupt.h"


#include "usblib/usblib.h"
#include "usblib/usbhid.h"
#include "usblib/device/usbdevice.h"
#include "usblib/device/usbdhid.h"
#include "usblib/device/usbdhidkeyb.h"
#include "drivers/pinout.h"
#include "usb_keyb_structs.h"
//#include "utils/uartstdio.h"

#include "stracture_all.h"
#include "main.h"
#include "initialization_parameter.h"

#define TARGET_IS_TM4C129_RA1

void SendCharUSB(uint8_t *send);
 void UART5IntHandler(void);
 void UART7IntHandler(void);

#define SYSTICKS_PER_SECOND     100
#define SYSTICK_PERIOD_MS (10000 / SYSTICKS_PER_SECOND)
volatile uint32_t g_ui32UARTTxCount = 0;
volatile uint32_t g_ui32UARTRxCount = 0;
volatile uint32_t g_ui32SysTickCount = 0;

uint32_t ui32SysClock;
uint32_t ui32PLLRate;
//*****************************************************************************
//
// A mapping from the ASCII value received from the UART to the corresponding
// USB HID usage code.
//
//*****************************************************************************
static const int8_t g_ppi8KeyUsageCodes[][2] =
{
    { 0, HID_KEYB_USAGE_SPACE },                       //   0x20
};

volatile bool g_bConnected = false;
volatile bool trigger = false;
volatile bool g_bSuspended = false;
volatile uint32_t g_ui32SysTickCount;
volatile bool g_bDisplayUpdateRequired;
extern uint8_t send_new[64];
/*extern uint8_t recieve_new[1920];
extern uint8_t recieve_temp[1920];*/
#define MAX_SEND_DELAY          20


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

#ifdef DEBUG
void
__error__(char *pcFilename, uint32_t ui32Line)
{
}
#endif

bool clearwatchdog = false;

void
Int_Watchdog(void)
{
	if(clearwatchdog)
	{
		clearwatchdog = false;
		WatchdogIntClear(WATCHDOG0_BASE);
		WatchdogReloadSet(WATCHDOG0_BASE,100);
	}
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
            ROM_GPIOPinWrite(GPIO_PORTN_BASE, GPIO_PIN_0,
                             (ui32MsgData & HID_KEYB_CAPS_LOCK) ? GPIO_PIN_0 :
                             0);

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

//*****************************************************************************
//
// This is the interrupt handler for the SysTick interrupt.  It is used to
// update our local tick count which, in turn, is used to check for transmit
// timeouts.
//
//*****************************************************************************
void
SysTickIntHandler(void)
 {
	g_ui32SysTickCount++;
}

uint_fast32_t ui32LastTickCount;

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
	                     USBDHIDKeyboardRemoteWakeupRequest(
	                                                    (void *)&g_sKeyboardDevice);
	                 }
	                 else
	                 {
	                 SendString(" ");
	                 trigger = false;
	                 }
	             }
	 return;
}



volatile uint32_t g_ui32Flags = 0;
char *g_pcStatus;
//FPGA Com Ports
void UART5IntHandler(void){

}
void UART7IntHandler(void){

}
void config_board()
 {
	ui32SysClock = MAP_SysCtlClockFreqSet((SYSCTL_XTAL_25MHZ |
	SYSCTL_OSC_MAIN |
	SYSCTL_USE_PLL |
	SYSCTL_CFG_VCO_480), 120000000);
	g_eKeyboardState = STATE_UNCONFIGURED;
	PinoutSet(false, true);
	SysCtlPeripheralEnable(SYSCTL_PERIPH_EEPROM0);
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPION);  // ON BOARD LEDS
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOE);  //for reset pin of SPI-1
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOG);
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOJ);
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOB);
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOH);
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOQ);
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOL);
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOP);
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOK);
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOM);
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOC);  //for uart also
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOD);
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPION);

	/*				ON Board LED PINS												*/
	GPIOPinTypeGPIOOutput(GPIO_PORTL_BASE, GPIO_PIN_2 | GPIO_PIN_3);

	/*				FPGA Reset Pins													*/
	GPIOPinTypeGPIOOutput(GPIO_PORTK_BASE, GPIO_PIN_1);
	GPIOPinTypeGPIOOutput(GPIO_PORTN_BASE, GPIO_PIN_1);

	/* FPGA Communication uart ports */


    SysCtlPeripheralEnable(SYSCTL_PERIPH_UART5);
   // SysCtlPeripheralEnable(UART_3_GPIO_PERIPH);
    GPIOPinConfigure(GPIO_PC6_U5RX);
    GPIOPinConfigure(GPIO_PC7_U5TX);
    GPIOPinTypeUART(GPIO_PORTC_BASE, GPIO_PIN_6 | GPIO_PIN_7);
    IntDisable(INT_UART5);
    UARTDisable(UART5_BASE);
    UARTClockSourceSet(UART5_BASE, UART_CLOCK_PIOSC);
    UARTConfigSetExpClk(UART5_BASE, 16000000, 9600,
            UART_CONFIG_WLEN_8 | UART_CONFIG_STOP_ONE | UART_CONFIG_PAR_NONE);
    UARTFIFODisable(UART5_BASE);
    UARTEnable(UART5_BASE);
    UARTIntEnable(UART5_BASE, UART_INT_RX | UART_INT_RT);
    UARTIntRegister(UART5_BASE, UART5IntHandler);

       SysCtlPeripheralEnable(SYSCTL_PERIPH_UART7);
      // SysCtlPeripheralEnable(UART_3_GPIO_PERIPH);
       GPIOPinConfigure(GPIO_PC4_U7RX);
       GPIOPinConfigure(GPIO_PC5_U7TX);
       GPIOPinTypeUART(GPIO_PORTC_BASE, GPIO_PIN_4 | GPIO_PIN_5);
       IntDisable(INT_UART7);
       UARTDisable(UART7_BASE);
       UARTClockSourceSet(UART7_BASE, UART_CLOCK_PIOSC);
       UARTConfigSetExpClk(UART7_BASE, 16000000, 9600,
               UART_CONFIG_WLEN_8 | UART_CONFIG_STOP_ONE | UART_CONFIG_PAR_NONE);
       UARTFIFODisable(UART7_BASE);
       UARTEnable(UART7_BASE);
       UARTIntEnable(UART7_BASE, UART_INT_RX | UART_INT_RT);
       UARTIntRegister(UART7_BASE, UART7IntHandler);

	/*				HARD Spi Enable													*/
	m25p16_init2();
	m25p16_init1();

	/*				Power Amplifier 												*/
	GPIOPinTypeGPIOOutput(GPIO_PORTG_BASE, (GPIO_PIN_0 | GPIO_PIN_1));
	GPIOPinTypeGPIOOutput(GPIO_PORTJ_BASE, (GPIO_PIN_0 | GPIO_PIN_1));
	GPIOPinTypeGPIOOutput(GPIO_PORTL_BASE, (GPIO_PIN_0 | GPIO_PIN_1));
	GPIOPinTypeGPIOOutput(GPIO_PORTB_BASE, (GPIO_PIN_4 | GPIO_PIN_5));
/* AD configuration and Ad Reset Pins  first is reset and other is slave select*/
#ifdef SPI_1
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOA);
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOD);
    GPIOPinTypeGPIOOutput(GPIO_PORTA_BASE, GPIO_PIN_3);
    GPIOPinTypeGPIOOutput(GPIO_PORTD_BASE, GPIO_PIN_4);

    GPIOPinWrite(GPIO_PORTA_BASE, GPIO_PIN_3, GPIO_PIN_3);//SS 1
    GPIOPinWrite(GPIO_PORTD_BASE, GPIO_PIN_4, GPIO_PIN_4);// AD Reset 1
#endif

#ifdef SPI_2
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOH);
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOD);
    GPIOPinTypeGPIOOutput(GPIO_PORTH_BASE, GPIO_PIN_0);
    GPIOPinTypeGPIOOutput(GPIO_PORTD_BASE, GPIO_PIN_5);

    GPIOPinWrite(GPIO_PORTH_BASE, GPIO_PIN_0, GPIO_PIN_0); //SS AD 2
    GPIOPinWrite(GPIO_PORTD_BASE, GPIO_PIN_5, GPIO_PIN_5);// AD Reset 2
#endif
#ifdef SPI_3
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOH);
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOD);
    GPIOPinTypeGPIOOutput(GPIO_PORTH_BASE, GPIO_PIN_1);
    GPIOPinTypeGPIOOutput(GPIO_PORTD_BASE, GPIO_PIN_6);

    GPIOPinWrite(GPIO_PORTH_BASE, GPIO_PIN_1, GPIO_PIN_1);//SS AD 3
    GPIOPinWrite(GPIO_PORTD_BASE, GPIO_PIN_6, GPIO_PIN_6);// AD Reset 3
#endif

#ifdef SPI_4
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOH);
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOD);
	GPIOPinTypeGPIOOutput(GPIO_PORTH_BASE, GPIO_PIN_2);
	GPIOPinTypeGPIOOutput(GPIO_PORTD_BASE, GPIO_PIN_7);

	GPIOPinWrite(GPIO_PORTH_BASE, GPIO_PIN_2, GPIO_PIN_2);//Slave select
	GPIOPinWrite(GPIO_PORTD_BASE, GPIO_PIN_7, GPIO_PIN_7);// AD Reset 4
#endif
#ifdef SPI_5
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOD);
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPION);
    GPIOPinTypeGPIOOutput(GPIO_PORTD_BASE, GPIO_PIN_2);
    GPIOPinTypeGPIOOutput(GPIO_PORTN_BASE, GPIO_PIN_4);

    GPIOPinWrite(GPIO_PORTD_BASE, GPIO_PIN_2, GPIO_PIN_2);//SS 5
    GPIOPinWrite(GPIO_PORTN_BASE, GPIO_PIN_4, GPIO_PIN_4);//AD Reset 5
#endif
#ifdef SPI_6
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOF);
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOP);
    GPIOPinTypeGPIOOutput(GPIO_PORTF_BASE, GPIO_PIN_1);
    GPIOPinTypeGPIOOutput(GPIO_PORTP_BASE, GPIO_PIN_3);

    GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_1, GPIO_PIN_1); //SS 6
    GPIOPinWrite(GPIO_PORTP_BASE, GPIO_PIN_3, GPIO_PIN_3);// AD Reset 6
#endif
#ifdef SPI_7
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOF);
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOP);
    GPIOPinTypeGPIOOutput(GPIO_PORTF_BASE, GPIO_PIN_2);
    GPIOPinTypeGPIOOutput(GPIO_PORTP_BASE, GPIO_PIN_4);

    GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_2, GPIO_PIN_2);//SS 7
    GPIOPinWrite(GPIO_PORTP_BASE, GPIO_PIN_4, GPIO_PIN_4);// AD Reset 7
#endif

#ifdef SPI_8
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOF);
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOP);
	GPIOPinTypeGPIOOutput(GPIO_PORTF_BASE, GPIO_PIN_4);
	GPIOPinTypeGPIOOutput(GPIO_PORTP_BASE, GPIO_PIN_5);

	GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_4, GPIO_PIN_4);//SS 8
	GPIOPinWrite(GPIO_PORTP_BASE, GPIO_PIN_5, GPIO_PIN_5);// AD Reset 8
#endif






/*
#ifdef TIMER_0
	 SysCtlPeripheralEnable(SYSCTL_PERIPH_TIMER0);
	 IntMasterEnable();
	 TimerConfigure(TIMER0_BASE, TIMER_CFG_PERIODIC);
	 TimerLoadSet(TIMER0_BASE, TIMER_A, ui32SysClock * 0.5);
	 IntEnable(INT_TIMER0A);
	 TimerIntEnable(TIMER0_BASE, TIMER_TIMA_TIMEOUT);
	 TimerDisable(TIMER0_BASE, TIMER_A);
#endif
*/
#ifdef TIMER_1
	 SysCtlPeripheralEnable(SYSCTL_PERIPH_TIMER1);
	 IntMasterEnable();
	 TimerConfigure(TIMER1_BASE, TIMER_CFG_PERIODIC);
	 TimerLoadSet(TIMER1_BASE, TIMER_A, ui32SysClock*1.5);
	 IntEnable(INT_TIMER1A);
	 TimerIntEnable(TIMER1_BASE, TIMER_TIMA_TIMEOUT);
	 TimerDisable(TIMER1_BASE, TIMER_A);
#endif

#ifdef watchdog
	SysCtlPeripheralEnable(SYSCTL_PERIPH_WDOG0);
	WatchdogReloadSet(WATCHDOG0_BASE, ui32SysClock);
	WatchdogIntRegister(WATCHDOG0_BASE,Int_Watchdog);
#endif
}

void INTR_TIMER0(void)
 {
	TimerDisable(TIMER0_BASE, TIMER_A);
//	ALC_DOWNLINK(&repeter1, &COMPLETE_DATA.REPETER_1, GSM_BAND1);
//	ALC_UPLINK(&repeter1, &COMPLETE_DATA.REPETER_1, GSM_BAND1);
	switch (LED_STATE) {
	case red_green:
		GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_2, GPIO_PIN_2);
		GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_3, ~GPIO_PIN_3);
		SysCtlDelay(200);
		GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_2, ~GPIO_PIN_2);
		GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_3, GPIO_PIN_3);
		break;
	case red_steady:
		GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_2, GPIO_PIN_2);
		GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_3, ~GPIO_PIN_3);
		break;
	case green_steady:
		GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_2, ~GPIO_PIN_2);
		GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_3, GPIO_PIN_3);
		break;
	case red_blink:
		GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_2, GPIO_PIN_2);
		GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_3, ~GPIO_PIN_3);
		SysCtlDelay(200);
		GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_2, ~GPIO_PIN_2);
		GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_3, ~GPIO_PIN_3);
		break;
	case green_blink:
		GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_2, ~GPIO_PIN_2);
		GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_3, GPIO_PIN_3);
		SysCtlDelay(200);
		GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_2, ~GPIO_PIN_2);
		GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_3, ~GPIO_PIN_3);
		break;
	case reset_board:
		HWREG(NVIC_APINT) = NVIC_APINT_VECTKEY|NVIC_APINT_SYSRESETREQ;
	}
	TimerEnable(TIMER0_BASE, TIMER_A);
}

void read_data(void)
 {
	read_eeprom_system(&gTriband_board.sys_detail, system_details_address);
	read_eeprom_repeter(&gTriband_board.repeater_band[0], repeter1_address);
	read_eeprom_repeter(&gTriband_board.repeater_band[1], repeter2_address);
	read_eeprom_repeter(&gTriband_board.repeater_band[2], repeter3_address);
	read_eeprom_repeter(&gTriband_board.repeater_band[3], repeter4_address);
}

int32_t All_AD_Configuration() {
	int32_t paru;
	fpga_reset();
	//  U3 & U8 gsm
	   default_init_param.rx_synthesizer_frequency_hz=UPLINK_GSM;
	    default_init_param.tx_synthesizer_frequency_hz=DOWNLINK_GSM;

    paru = ad9361_init(0,&ad9361_phy[0], &default_init_param);//function which initialize the ad9361 board for 2400Mhz
    ad9361_trx_load_enable_fir(ad9361_phy[0], rx_fir_config, tx_fir_config);
    SysCtlDelay(2000);

   // default_init_param
    paru = ad9361_init(1,&ad9361_phy[1], &default_init_param);//function which initialize the ad9361 board for 2400Mhz
    SysCtlDelay(2 * 1600);
    ad9361_trx_load_enable_fir(ad9361_phy[1], rx_fir_config, tx_fir_config);
    SysCtlDelay(2000);


    SysCtlDelay(2 * 16000000);
    ad9361_set_tx_lo_freq(ad9361_phy[0], UPLINK_GSM);
    SysCtlDelay(2000);
    ad9361_set_rx_lo_freq(ad9361_phy[1], DOWNLINK_GSM);
    SysCtlDelay(2000);

    //ad9361_set_tx_attenuation(1,ad9361_phy, 1,70);

    GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_2 | GPIO_PIN_3,
    GPIO_PIN_2 | ~GPIO_PIN_3);
    SysCtlDelay(2 * 16000000);
    GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_2 | GPIO_PIN_3,
            ~GPIO_PIN_2 | GPIO_PIN_3);

    //  U13 & U18 wcdma
    default_init_param.rx_synthesizer_frequency_hz=UPLINK_WCDMA;
    default_init_param.tx_synthesizer_frequency_hz=DOWNLINK_WCDMA;
    paru = ad9361_init(2,&ad9361_phy[2], &default_init_param);//function which initialize the ad9361 board for 2400Mhz
     ad9361_trx_load_enable_fir(ad9361_phy[2], rx_fir_config, tx_fir_config);
     SysCtlDelay(2000);
     paru = ad9361_init(3,&ad9361_phy[3], &default_init_param);//function which initialize the ad9361 board for 2400Mhz
     SysCtlDelay(2 * 1600);
     ad9361_trx_load_enable_fir(ad9361_phy[3], rx_fir_config, tx_fir_config);
     SysCtlDelay(2000);


     SysCtlDelay(2 * 16000000);
     ad9361_set_tx_lo_freq(ad9361_phy[2], UPLINK_WCDMA);
     SysCtlDelay(2000);
     ad9361_set_rx_lo_freq(ad9361_phy[3], DOWNLINK_WCDMA);
     SysCtlDelay(2000);

     GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_2 | GPIO_PIN_3,
      GPIO_PIN_2 | ~GPIO_PIN_3);
      SysCtlDelay(2 * 16000000);
      GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_2 | GPIO_PIN_3,
              ~GPIO_PIN_2 | GPIO_PIN_3);

      fpga_reset();
      SysCtlDelay(2 * 16000000);
//U23 & U28
      default_init_param.rx_synthesizer_frequency_hz=UPLINK_DCS1;
      default_init_param.tx_synthesizer_frequency_hz=DOWNLINK_DCS1;

      paru = ad9361_init(4,&ad9361_phy[4], &default_init_param);//function which initialize the ad9361 board for 2400Mhz
         ad9361_trx_load_enable_fir(ad9361_phy[4], rx_fir_config, tx_fir_config);
         SysCtlDelay(2000);
         paru = ad9361_init(5,&ad9361_phy[5], &default_init_param);//function which initialize the ad9361 board for 2400Mhz
         SysCtlDelay(2 * 1600);
         ad9361_trx_load_enable_fir(ad9361_phy[5], rx_fir_config, tx_fir_config);
         SysCtlDelay(2000);


         SysCtlDelay(2 * 16000000);
         ad9361_set_tx_lo_freq(ad9361_phy[4], UPLINK_DCS1);
         SysCtlDelay(2000);
         ad9361_set_rx_lo_freq(ad9361_phy[5], DOWNLINK_DCS1);
         SysCtlDelay(2000);

         GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_2 | GPIO_PIN_3,
          GPIO_PIN_2 | ~GPIO_PIN_3);
          SysCtlDelay(2 * 16000000);
          GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_2 | GPIO_PIN_3,
                  ~GPIO_PIN_2 | GPIO_PIN_3);

 //U33 & U39
          paru = ad9361_init(6,&ad9361_phy[6], &default_init_param);//function which initialize the ad9361 board for 2400Mhz
          ad9361_trx_load_enable_fir(ad9361_phy[6], rx_fir_config, tx_fir_config);
          SysCtlDelay(2000);
          paru = ad9361_init(7,&ad9361_phy[5], &default_init_param);//function which initialize the ad9361 board for 2400Mhz
          SysCtlDelay(2 * 1600);
          ad9361_trx_load_enable_fir(ad9361_phy[7], rx_fir_config, tx_fir_config);
          SysCtlDelay(2000);


          SysCtlDelay(2 * 16000000);
          ad9361_set_tx_lo_freq(ad9361_phy[6], UPLINK_DCS2);
          SysCtlDelay(2000);
          ad9361_set_rx_lo_freq(ad9361_phy[7], DOWNLINK_DCS2);
          SysCtlDelay(2000);

          GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_2 | GPIO_PIN_3,
                    GPIO_PIN_2 | ~GPIO_PIN_3);
          SysCtlDelay(2 * 16000000);
          GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_2 | GPIO_PIN_3,
                            ~GPIO_PIN_2 | GPIO_PIN_3);
	fpga_reset();
	int i;
	for (i = 70; i > 0; i -= 7) {
		GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_2 | GPIO_PIN_3,
		GPIO_PIN_2 | ~GPIO_PIN_3);
		SysCtlDelay(1.5 * 16000000);
		GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_2 | GPIO_PIN_3,
				~GPIO_PIN_2 | GPIO_PIN_3);
		SysCtlDelay(1.5 * 16000000);
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

//*****************************************************************************
//
// This is the main loop that runs the application.
//
//*****************************************************************************
int
main(void)
{
	LED_STATE = red_green;
	config_board();
    bool bLastSuspend;
    g_bConnected = false;
    g_bSuspended = false;
    bLastSuspend = false;

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
    ROM_SysTickPeriodSet(ui32SysClock / SYSTICKS_PER_SECOND);
    ROM_SysTickIntEnable();
    ROM_SysTickEnable();


    if(All_AD_Configuration() < 0)
    {
    	LED_STATE = red_steady;
    }
    else{
    	LED_STATE = green_steady;
    }
    // The main loop starts here.  We begin by waiting for a host connection
    // then drop into the main keyboard handling section.  If the host
    // disconnects, we return to the top and wait for a new connection.

    TimerEnable(TIMER0_BASE, TIMER_A);              //for on board LED functioning

    while(1)
    {
        while(!g_bConnected)
        {
        	SysCtlDelay(100);
        }
        if(g_bConnected == true)
        {
    	g_eKeyboardState = STATE_IDLE;
        bLastSuspend = false;
        }
        while(g_bConnected)
        {
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
    }
}
