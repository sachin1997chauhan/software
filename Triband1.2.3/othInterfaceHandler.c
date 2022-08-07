/*
 * othInterfaceHandler.c
 *
 *  Created on: Dec 1, 2020
 *      Author: frogcell
 */


#include <stdio.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>


#include "inc/hw_memmap.h"
#include "driverlib/sysctl.h"
#include "driverlib/gpio.h"
#include "inc/hw_gpio.h"
#include "driverlib/rom.h"
#include "driverlib/rom_map.h"
#include "driverlib/pin_map.h"
#include "driverlib/uart.h"
//#include "usblib/usblib.h"
//#include "usblib/usbhid.h"
//#include "usblib/device/usbdevice.h"
//#include "usblib/device/usbdhid.h"
//#include "usblib/device/usbdhidkeyb.h"
#include "drivers/pinout.h"
//#include "usb_keyb_structs.h"
#include "driverlib/timer.h"
#include "inc/hw_nvic.h"
#include "inc/hw_ints.h"
#include "driverlib/ssi.h"
#include "inc/hw_types.h"
#include "driverlib/eeprom.h"
#include "driverlib/watchdog.h"
#include "driverlib/interrupt.h"
#include "driverlib/adc.h"
#include "adutil.h"
#include "spi_flash.h"
#include "othInterfaceHandler.h"

#include "definitions.h"
#include "global.h"
#ifdef _LOG_DATA_
#include "modem_handler.h"
#endif
#define LSBFIRST 0
#define MSBFIRST 1

volatile uint32_t g_ui32UARTTxCount = 0;
volatile uint32_t g_ui32UARTRxCount = 0;
volatile uint32_t g_ui32SysTickCount = 0;

volatile bool g_bDisplayUpdateRequired;

extern uint8_t send_new[64];
extern repeater_board gTriband_board;
extern eLED_STATE gLed_State;
//extern hump_data gHumpInfo[MAX_TOTAL_HUMP];//max 16 humps for all bands
extern hump_data gHumpInfo_50t[MAX_TOTAL_HUMP_ON_FPGA];//max  humps for all bands
extern hump_data gHumpInfo_35t[MAX_TOTAL_HUMP_ON_FPGA];

/*extern uint8_t recieve_new[1920];
extern uint8_t recieve_temp[1920];*/
int FLAG=0;

uint32_t ui32SysClock;
char bufRecFpga1[350];
char cntrRecFpga1=0;
char bufRecFpga2[350];
char cntrRecFpga2=0;
int bandid;
int i;

//---------------//

//----------------//
int gfpga_version1;
void FPGA1IntHandler(void);
void FPGA2IntHandler(void);
void LogIntHandler(void);
void Int_Watchdog(void);


bool clearwatchdog = false;
void LogIntHandler(void)
{
    uint32_t ui32Status;
    ui32Status = UARTIntStatus(UART6_BASE, true);
    UARTIntClear(UART6_BASE, ui32Status);
    while (UARTCharsAvail(UART6_BASE))
    {
           char ab = UARTCharGetNonBlocking(UART6_BASE);
         //  UARTCharPut(UART7_BASE, ab);


    }
}
#ifdef _LOG_DATA_
void logString(char *data,int len)
{
    int i=0;
       if(len>0)
       {
           for(i=0;i<len;i++)
               UARTCharPut(UART2_BASE, data[i]);
       }
}
void logdata(char data)
{

           UARTCharPut(UART6_BASE, data);

}
#endif
//FPGA Com Ports

/*
void FPGA1IntHandler(void){
   uint32_t ui32Status;
    ui32Status = UARTIntStatus(UART5_BASE, true);
    UARTIntClear(UART5_BASE, ui32Status);
    while (UARTCharsAvail(UART5_BASE)) {
    	bufRecFpga1[cntrRecFpga1] = UARTCharGetNonBlocking(UART5_BASE);

        cntrRecFpga1=(cntrRecFpga1+1)%350;
        cntrRecFpga1=(cntrRecFpga1+1);

///////////////////////////////////


      //  if (bufRecFpga1[0] == 'A' && bufRecFpga1[1] == 'B' && bufRecFpga1[2] == 'C'
        //            && bufRecFpga1[3] == 'D')
      //  {


         //       if (bufRecFpga1[7] == 'P' && bufRecFpga1[8] == 'A' && bufRecFpga1[9] == 'S'
            //            && bufRecFpga1[10] == 'S' && bufRecFpga1[31] != 'Z') {

             //       cntrRecFpga1=0;

              //  } else {

              //  }

       // }
       //


    }
}

*/

void FPGA1IntHandler(void){
    uint32_t ui32Status;
       ui32Status = UARTIntStatus(UART5_BASE, true);
       UARTIntClear(UART5_BASE, ui32Status);
       while (UARTCharsAvail(UART5_BASE))
       {

    	  // cntrRecFpga2 = counter;
    	   bufRecFpga1[cntrRecFpga1] = UARTCharGetNonBlocking(UART5_BASE);
    	//	logdata(bufRecFpga2[cntrRecFpga2]);
    	   cntrRecFpga1++;
    	   //  cntrRecFpga2=(cntrRecFpga2+1)%350;
    	      //  cntrRecFpga2=(cntrRecFpga2+1);
                //if(cntrRecFpga2==32)
                {
    	             if ( bufRecFpga1[cntrRecFpga1-1]=='Z')
                     {
                                            //   bandid++;

	 	                       	   	   	   	   logdata((char)';');
    	            	 	 	 	 	 	   logdata((char)'F');
    	            	 	 	 	 	 	   logdata((char)'P');
    	            	 	 	 	 	 	   logdata((char)'G');
    	            	 	 	 	 	 	   logdata((char)'A');

    	        	                           logdata((char)'B');
    	        	        	               logdata((char)'A');
    	        	        	               logdata((char)'N');
    	        	        	               logdata((char)'D');
    	        	        	               //logdata((char)(48+bandid));
    	        	        	               logdata((char)'-');
    	        	        	               for(i=0;i<32;i++)
    	        	        	                   UARTCharPut(UART6_BASE,bufRecFpga1[i]);

    	        	        	               logdata((char)'\n');

    	        	        	               cntrRecFpga1=0;
                      }
                }
}
}




/*
 void FPGA2IntHandler(void){
    uint32_t ui32Status;
       ui32Status = UARTIntStatus(UART7_BASE, true);
       UARTIntClear(UART7_BASE, ui32Status);
       while (UARTCharsAvail(UART7_BASE)) {
    	   bufRecFpga2[cntrRecFpga2] = UARTCharGetNonBlocking(UART7_BASE);


           // cntrRecFpga2=(cntrRecFpga2+1)%35;//bufp[0] = 0;





          // if (bufRecFpga2[0] == 'A' && bufRecFpga2[1] == 'B' && bufRecFpga2[2] == 'C'
                       && bufRecFpga2[3] == 'D')
           //{


             //    if (bufRecFpga2[7] == 'P' && bufRecFpga2[8] == 'A' && bufRecFpga2[9] == 'S'
                                        && bufRecFpga2[10] == 'S' && bufRecFpga2[cntrRecFpga2] != 'Z')
             //    {

             //                       cntrRecFpga1=0;

            //                    }

           //}




       }
}

*/




void FPGA2IntHandler(void){
    uint32_t ui32Status;
       ui32Status = UARTIntStatus(UART7_BASE, true);
       UARTIntClear(UART7_BASE, ui32Status);
       while (UARTCharsAvail(UART7_BASE))
       {

    	  // cntrRecFpga2 = counter;
    	   bufRecFpga2[cntrRecFpga2] = UARTCharGetNonBlocking(UART7_BASE);
    	//	logdata(bufRecFpga2[cntrRecFpga2]);
    	   cntrRecFpga2++;
    	   //  cntrRecFpga2=(cntrRecFpga2+1)%350;
    	      //  cntrRecFpga2=(cntrRecFpga2+1);
                //if(cntrRecFpga2==32)
                {
    	             if ( bufRecFpga2[cntrRecFpga2-1]=='Z')
                     {
                                              // bandid++;

	 	                                       logdata((char)':');
	 	 	 	 	 	   	   	   	           logdata((char)'F');
	 	 	 	 	 	                       logdata((char)'P');
	 	 	 	 	 	                       logdata((char)'G');
	 	 	 	 	 	                       logdata((char)'A');

    	        	                           logdata((char)'B');
    	        	        	               logdata((char)'A');
    	        	        	               logdata((char)'N');
    	        	        	               logdata((char)'D');
    	        	        	               //logdata((char)(48+bandid));
    	        	        	               logdata((char)'-');
    	        	        	               for(i=0;i<32;i++)
    	        	        	                   UARTCharPut(UART6_BASE,bufRecFpga2[i]);

    	        	        	               logdata((char)'\n');

    	        	        	               cntrRecFpga2=0;
                      }
                }
}
}


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
void enableTimer(){
    TimerEnable(TIMER0_BASE, TIMER_A);

}
unsigned int SPI_TRANSMIT(int32_t base_addr,uint8_t x)
{
    unsigned int y = 0;
    SSIDataPut(base_addr, x);
    //SSIDataGet(SSI3_BASE, &pui32DataRx[ui32Index]);
    while(SSIBusy(base_addr));
    SSIDataGetNonBlocking(base_addr, &y);
    return y;
}



int spi_write_then_read(struct spi_device *spidev,const unsigned char *txbuf, unsigned n_tx,unsigned char *rxbuf, unsigned n_rx){
   int  j = 0;
    uint8_t spiBuf[3];
    uint8_t rx[3];
       SysCtlDelay(100);
       for(j=0;j<n_tx;j++){
           spiBuf[j]=txbuf[j];
       }
       #ifdef REGISTERS
                               int byte;
                               for(byte = 0; byte < n_tx; byte++)
                               {
                               puthex((unsigned char)txbuf[byte]);
                               }
                               UARTCharPutNonBlocking(UART0_BASE,'\r');
                               UARTCharPutNonBlocking(UART0_BASE,'\n');
       #endif
       GPIOPinWrite(spidev->dev.select_pin_addr, spidev->dev.select_pin, ~(spidev->dev.select_pin));


       SysCtlDelay(50);
       if (n_tx == 2) {
           SPI_TRANSMIT(spidev->dev.spi_dev_addr,(unsigned char) txbuf[0]);
           SPI_TRANSMIT(spidev->dev.spi_dev_addr,(unsigned char) txbuf[1]);
           for (j = 0; j < 1; j++) {
               rx[j] = SPI_TRANSMIT(spidev->dev.spi_dev_addr,0);
           }
           *rxbuf = rx[0];

       } else if (n_tx == 3) {
           SPI_TRANSMIT(spidev->dev.spi_dev_addr,(unsigned char) txbuf[0]);
           SPI_TRANSMIT(spidev->dev.spi_dev_addr,(unsigned char) txbuf[1]);
           SPI_TRANSMIT(spidev->dev.spi_dev_addr,(unsigned char) txbuf[2]);
           SysCtlDelay(50);

       }

       GPIOPinWrite(spidev->dev.select_pin_addr, spidev->dev.select_pin, (spidev->dev.select_pin));
       return SUCCESS;
}



void   LedBlink(){
    GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_2 | GPIO_PIN_3,
       GPIO_PIN_2 | ~GPIO_PIN_3);
       SysCtlDelay(2 * 16000000);
       GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_2 | GPIO_PIN_3,
               ~GPIO_PIN_2 | GPIO_PIN_3);

}

void fpga_reset(void)
{
    //FPGA RESET DCS side
    SysCtlDelay(5000);
    GPIOPinWrite(GPIO_PORTK_BASE, GPIO_PIN_1,GPIO_PIN_1);
    SysCtlDelay(5000);
    GPIOPinWrite(GPIO_PORTK_BASE, GPIO_PIN_1, ~GPIO_PIN_1);
    SysCtlDelay(5000);
    GPIOPinWrite(GPIO_PORTK_BASE, GPIO_PIN_1, GPIO_PIN_1);
    SysCtlDelay(5000);
  //  GPIOPinWrite(GPIO_PORTN_BASE, GPIO_PIN_1, GPIO_PIN_1);
   // SysCtlDelay(5000);
   // GPIOPinWrite(GPIO_PORTN_BASE, GPIO_PIN_1, ~GPIO_PIN_1);
   // SysCtlDelay(5000);
  //  GPIOPinWrite(GPIO_PORTN_BASE, GPIO_PIN_1, GPIO_PIN_1);
  //  SysCtlDelay(5000);
}
int gblink_state=0;
//gL_currentTime=0;
void general_timer_hadler(void)
 {
   // TimerDisable(TIMER0_BASE, TIMER_A);
//  ALC_DOWNLINK(&repeter1, &COMPLETE_DATA.REPETER_1, GSM_BAND1);
//  ALC_UPLINK(&repeter1, &COMPLETE_DATA.REPETER_1, GSM_BAND1);
    TimerIntClear(TIMER0_BASE, TIMER_TIMA_TIMEOUT);
    gL_currentTime++;
    switch (gLed_State) {
    case red_green:
        if(gblink_state){
            gblink_state=0;
            GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_2, GPIO_PIN_2);
            GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_3, ~GPIO_PIN_3);
        }
        else{
        //SysCtlDelay(200);
            gblink_state=1;
            GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_2, ~GPIO_PIN_2);
            GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_3, GPIO_PIN_3);
        }
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
        if(gblink_state){
            gblink_state=0;
            GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_2, GPIO_PIN_2);
            GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_3, ~GPIO_PIN_3);
        }
        else{
        //SysCtlDelay(200);
            gblink_state=1;
            GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_2, ~GPIO_PIN_2);
            GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_3, ~GPIO_PIN_3);
        }
        break;
    case green_blink:
        if(gblink_state){
            gblink_state=0;
            GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_2, ~GPIO_PIN_2);
            GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_3, GPIO_PIN_3);
        }
        else{
            gblink_state=1;
        //SysCtlDelay(200);
            GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_2, ~GPIO_PIN_2);
            GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_3, ~GPIO_PIN_3);
        }
        break;
    case reset_board:
        HWREG(NVIC_APINT) = NVIC_APINT_VECTKEY|NVIC_APINT_SYSRESETREQ;
    }
   // TimerEnable(TIMER0_BASE, TIMER_A);
}
int calculate_best_fit(){
    //array of atta verses value input plot graph in between given att and recved adc Least Mean Squre
    int arr[10];int arr2[10];int i=0;
    int x_minus_x_bar[10]; int y_minus_y_bar[10];
    int mult_both[10]; int x_minus_x_bar_sqr[10];
    int sum_mult_both=0;int sum_x_minus_x_bar_sqr=0;
    int slop_m=0;int cof_b=0;
    //y=mx+c
    int x_bar=0;
       int y_bar=0;
    arr[0]=0; arr[1]=10; //given att and value

    for(i=0;i<10;i++)
        x_bar+=arr[i];

       for(i=0;i<10;i++)
           y_bar+=arr2[i];

       x_bar=x_bar/10;y_bar=y_bar/10;
     //  Now calculate xi−X¯¯¯ , yi−Y¯¯¯ , (xi−X¯¯¯)(yi−Y¯¯¯) , and (xi−X¯¯¯)2 for each i ;
       for(i=0;i<10;i++){
           x_minus_x_bar[i]=arr[i]-x_bar;
           y_minus_y_bar[i]=arr2[i]-y_bar;
           mult_both[i]=x_minus_x_bar[i]*y_minus_y_bar[i];
           x_minus_x_bar_sqr[i]=x_minus_x_bar[i]*x_minus_x_bar[i];
           sum_mult_both+=mult_both[i];
           sum_x_minus_x_bar_sqr+=x_minus_x_bar_sqr[i];
       }
       slop_m= sum_mult_both/sum_x_minus_x_bar_sqr;
       //y_bar-m(x_bar)
       cof_b=y_bar-(slop_m*x_bar);
       //eqn is
return 0;
}
uint8_t shiftIn(uint8_t dataPin, uint8_t clockPin, uint8_t bitOrder) {
    uint8_t value = 0;
    uint8_t i;
   // PB2 clk PB3 data
    for (i = 0; i < 8; ++i) {
     //   digitalWrite(clockPin, HIGH);
        GPIOPinWrite(GPIO_PORTP_BASE, GPIO_PIN_2, GPIO_PIN_2);
        if (bitOrder == LSBFIRST)
           // value |= digitalRead(dataPin) << i;
            value |= GPIOPinRead(GPIO_PORTP_BASE, GPIO_PIN_3)<< i;
        else
         //   value |= digitalRead(dataPin) << (7 - i);
            value |= GPIOPinRead(GPIO_PORTP_BASE, GPIO_PIN_3) << (7 - i);
        //digitalWrite(clockPin, LOW);
        GPIOPinWrite(GPIO_PORTP_BASE, GPIO_PIN_2, ~(GPIO_PIN_2));
    }
    return value;
}
void shiftOut(uint8_t bitOrder, uint8_t val)
{
    uint8_t i;
  //  PB2 clk PB3 data
    for (i = 0; i < 8; i++)  {

        if (bitOrder == LSBFIRST) {
            //digitalWrite(dataPin, val & 1);
            if(( val & 1)==1)
                GPIOPinWrite(GPIO_PORTB_BASE, GPIO_PIN_3,GPIO_PIN_3);
            else
                GPIOPinWrite(GPIO_PORTB_BASE, GPIO_PIN_3,~GPIO_PIN_3);
            val >>= 1;
        } else {
            //digitalWrite(dataPin, (val & 128) != 0);
            if(((val & 128) != 0))
                GPIOPinWrite(GPIO_PORTB_BASE, GPIO_PIN_3, GPIO_PIN_3);
            else
                GPIOPinWrite(GPIO_PORTB_BASE, GPIO_PIN_3,~GPIO_PIN_3);
            val <<= 1;
        }

        //digitalWrite(clockPin, 1);
        //digitalWrite(clockPin, 0);
        GPIOPinWrite(GPIO_PORTB_BASE, GPIO_PIN_2,  GPIO_PIN_2); //clock high
        SysCtlDelay(2000);
        GPIOPinWrite(GPIO_PORTB_BASE, GPIO_PIN_2, ~(GPIO_PIN_2)); //clock low
    }
}
void write_at_shift_reg_ul(int bandNum,  short d){

    unsigned char value=0;

    int LATCHDIOPin=0;
    int LATCHDIOPort=GPIO_PORTH_BASE;
    if(bandNum==1){
        LATCHDIOPort=GPIO_PORTH_BASE;
        LATCHDIOPin=GPIO_PIN_3;
    }
    else if(bandNum==2){
        LATCHDIOPort=GPIO_PORTM_BASE;
        LATCHDIOPin=GPIO_PIN_0;

    }
    else{
        LATCHDIOPort=GPIO_PORTF_BASE;
        LATCHDIOPin=GPIO_PIN_0;

    }
    if(d<=0)//if no attan then all 5 pins high in DCA
      value=31;
    else
        value=31-d;


//digitalWrite(LATCHDIOPin, LOW);


 // shiftOut(MSBFIRST, (0xff00 & d) >> 8);
  shiftOut(MSBFIRST, 0x00ff & value);
  //digitalWrite(LATCHDIOPin, HIGH);
  GPIOPinWrite(LATCHDIOPort, (LATCHDIOPin), (LATCHDIOPin));
  SysCtlDelay(2000);
  GPIOPinWrite(LATCHDIOPort, (LATCHDIOPin), ~(LATCHDIOPin));

}
void write_at_shift_reg_dl(int bandNum,  short d){
    //all latch pin low
    int LATCHDIOPin=0;
    int LATCHDIOPort=GPIO_PORTH_BASE;
    if(bandNum==1){
        LATCHDIOPort=GPIO_PORTM_BASE;
        LATCHDIOPin=GPIO_PIN_1;
    }
    else if(bandNum==2){
        LATCHDIOPort=GPIO_PORTN_BASE;
        LATCHDIOPin=GPIO_PIN_5;

    }
    else{
   //     LATCHDIOPort=GPIO_PORTM_BASE;
    //    LATCHDIOPin=GPIO_PIN_1;
        LATCHDIOPort=GPIO_PORTF_BASE;
        LATCHDIOPin=GPIO_PIN_3;


    }

//digitalWrite(LATCHDIOPin, LOW);

GPIOPinWrite(LATCHDIOPort, (LATCHDIOPin), ~(LATCHDIOPin));
  shiftOut(MSBFIRST, (0xff00 & d) >> 8);
  shiftOut(MSBFIRST, 0x00ff & d);
  //digitalWrite(LATCHDIOPin, HIGH);
  GPIOPinWrite(LATCHDIOPort, (LATCHDIOPin), (LATCHDIOPin));

}
void init_hardware(){
    ui32SysClock = MAP_SysCtlClockFreqSet((SYSCTL_XTAL_25MHZ |
     SYSCTL_OSC_MAIN |
     SYSCTL_USE_PLL |
     SYSCTL_CFG_VCO_480), 120000000);

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

     HWREG(GPIO_PORTB_BASE + GPIO_O_LOCK) = GPIO_LOCK_KEY;
     HWREG(GPIO_PORTB_BASE + GPIO_O_CR) = 0x80;

     /* for shift regs
      * select0 to select 4 h3,m0,m1,n5, b3 data,b2 clock
      */
     GPIOPinTypeGPIOOutput(GPIO_PORTB_BASE, (GPIO_PIN_2 | GPIO_PIN_3));

     GPIOPinTypeGPIOOutput(GPIO_PORTH_BASE, GPIO_PIN_3);
     GPIOPinTypeGPIOOutput(GPIO_PORTM_BASE, GPIO_PIN_0|GPIO_PIN_1);
     GPIOPinTypeGPIOOutput(GPIO_PORTN_BASE, GPIO_PIN_5);

     GPIOPinWrite(GPIO_PORTH_BASE, GPIO_PIN_3, ~(GPIO_PIN_3));
     GPIOPinWrite(GPIO_PORTM_BASE, GPIO_PIN_0, ~GPIO_PIN_0);
     GPIOPinWrite(GPIO_PORTM_BASE, GPIO_PIN_1, ~GPIO_PIN_1);
     GPIOPinWrite(GPIO_PORTN_BASE, GPIO_PIN_5, ~GPIO_PIN_5);

     /*              ON Board LED PINS                                               */
     GPIOPinTypeGPIOOutput(GPIO_PORTL_BASE, GPIO_PIN_2 | GPIO_PIN_3);

     /*              FPGA Reset Pins                                                 */
     GPIOPinTypeGPIOOutput(GPIO_PORTK_BASE, GPIO_PIN_1);
     GPIOPinWrite(GPIO_PORTK_BASE, (GPIO_PIN_1), ~(GPIO_PIN_1)); //put in reset
    //electricity alarm pin
     GPIOPinTypeGPIOInput(GPIO_PORTN_BASE, GPIO_PIN_1);


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
     UARTIntRegister(UART5_BASE, FPGA1IntHandler);

     //U131 35 t
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
        UARTIntRegister(UART7_BASE, FPGA2IntHandler);
#ifdef _LOG_DATA_

        SysCtlPeripheralEnable(SYSCTL_PERIPH_UART6);
         // SysCtlPeripheralEnable(UART_3_GPIO_PERIPH);
          GPIOPinConfigure(GPIO_PP0_U6RX);
          GPIOPinConfigure(GPIO_PP1_U6TX);
          GPIOPinTypeUART(GPIO_PORTP_BASE, GPIO_PIN_0 | GPIO_PIN_1);
          IntDisable(INT_UART6);
          UARTDisable(UART6_BASE);
          UARTClockSourceSet(UART6_BASE, UART_CLOCK_PIOSC);
          UARTConfigSetExpClk(UART6_BASE, 16000000, 9600,
                  UART_CONFIG_WLEN_8 | UART_CONFIG_STOP_ONE | UART_CONFIG_PAR_NONE);
          UARTFIFODisable(UART6_BASE);
          UARTEnable(UART6_BASE);
          UARTIntEnable(UART6_BASE, UART_INT_RX| UART_INT_RT );
          UARTIntRegister(UART6_BASE, LogIntHandler);

#endif
        //MODEM PINS A6 A7 UART GPIO_PA6_U2RX GPIO_PA7_U2TX
        //GPIOPinTypeGPIOOutput(GPIO_PORTP_BASE, GPIO_PIN_2);//mpowers on
        //GPIOPinTypeGPIOOutput(GPIO_PORTP_BASE, GPIO_PIN_1);//mReset on

        GPIOPinTypeGPIOOutput(GPIO_PORTL_BASE, GPIO_PIN_4);//mpowers on
        GPIOPinTypeGPIOOutput(GPIO_PORTP_BASE, GPIO_PIN_4);//mReset on
        GPIOPinWrite(GPIO_PORTL_BASE, GPIO_PIN_4, GPIO_PIN_4);
/*
        SysCtlPeripheralEnable(SYSCTL_PERIPH_UART1);
          // SysCtlPeripheralEnable(UART_3_GPIO_PERIPH);
           GPIOPinConfigure(GPIO_PB0_U1RX);
           GPIOPinConfigure(GPIO_PB1_U1TX);
           GPIOPinTypeUART(GPIO_PORTB_BASE, GPIO_PIN_0 | GPIO_PIN_1);
           IntDisable(INT_UART1);
           UARTDisable(UART1_BASE);
           UARTClockSourceSet(UART1_BASE, UART_CLOCK_PIOSC);
           UARTConfigSetExpClk(UART1_BASE, 16000000, 9600,
                   UART_CONFIG_WLEN_8 | UART_CONFIG_STOP_ONE | UART_CONFIG_PAR_NONE);
           UARTFIFODisable(UART1_BASE);
           UARTEnable(UART1_BASE);
           UARTIntEnable(UART1_BASE, UART_INT_RX | UART_INT_RT);
           UARTIntRegister(UART1_BASE, modem_uart_handler);
*/
        SysCtlPeripheralEnable(SYSCTL_PERIPH_UART2);
         // SysCtlPeripheralEnable(UART_3_GPIO_PERIPH);
          GPIOPinConfigure(GPIO_PA6_U2RX);
          GPIOPinConfigure(GPIO_PA7_U2TX);
          GPIOPinTypeUART(GPIO_PORTA_BASE, GPIO_PIN_6 | GPIO_PIN_7);
          IntDisable(INT_UART2);
          UARTDisable(UART2_BASE);
          UARTClockSourceSet(UART2_BASE, UART_CLOCK_PIOSC);
         // UARTConfigSetExpClk(UART2_BASE, 16000000, 9600,
         //        UART_CONFIG_WLEN_8 | UART_CONFIG_STOP_ONE | UART_CONFIG_PAR_NONE);
          //for 4 g modem
#ifdef _LOG_DATA_
          UARTConfigSetExpClk(UART2_BASE, 16000000, 9600,
                             UART_CONFIG_WLEN_8 | UART_CONFIG_STOP_ONE | UART_CONFIG_PAR_NONE);
#else
          UARTConfigSetExpClk(UART2_BASE, 16000000, 115200,
                             UART_CONFIG_WLEN_8 | UART_CONFIG_STOP_ONE | UART_CONFIG_PAR_NONE);
#endif


          UARTFIFODisable(UART2_BASE);
          UARTEnable(UART2_BASE);
          UARTIntEnable(UART2_BASE, UART_INT_RX | UART_INT_RT);
          UARTIntRegister(UART2_BASE, modem_uart_handler);
/*
while(1){
    GPIOPinWrite(GPIO_PORTB_BASE, GPIO_PIN_3, GPIO_PIN_3);
    GPIOPinWrite(GPIO_PORTB_BASE, GPIO_PIN_3, ~GPIO_PIN_3);
    GPIOPinWrite(GPIO_PORTB_BASE, GPIO_PIN_2, ~GPIO_PIN_2);
    GPIOPinWrite(GPIO_PORTB_BASE, GPIO_PIN_2, GPIO_PIN_2);
}
*/
//Modem Handler
        /*
        SysCtlPeripheralEnable(SYSCTL_PERIPH_UART2);
         // SysCtlPeripheralEnable(UART_3_GPIO_PERIPH);
          GPIOPinConfigure(GPIO_PA6_U2RX);
          GPIOPinConfigure(GPIO_PA7_U2TX);
          GPIOPinTypeUART(GPIO_PORTA_BASE, GPIO_PIN_6 | GPIO_PIN_7);
          IntDisable(INT_UART2);
          UARTDisable(UART2_BASE);
          UARTClockSourceSet(UART2_BASE, UART_CLOCK_PIOSC);
          UARTConfigSetExpClk(UART2_BASE, 16000000, 115200,
                  UART_CONFIG_WLEN_8 | UART_CONFIG_STOP_ONE | UART_CONFIG_PAR_NONE);
          UARTFIFODisable(UART2_BASE);
          UARTEnable(UART2_BASE);
          UARTIntEnable(UART2_BASE, UART_INT_RX | UART_INT_RT);
          UARTIntRegister(UART2_BASE, modem_uart_handler);
*/
     /*              HARD Spi Enable                                                 */
     m25p16_init2();
     m25p16_init1();

     /*              Power Amplifier                                                 */
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
  //this is for external PA irrespective of EXternal or internal configure this
     SysCtlPeripheralEnable(SYSCTL_PERIPH_ADC0);                       // AIN3 UL //AIN2 DL //AIN1 UL //AIN0 DL //AIN9 UL //AIN8 DL
      SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOE);                      //E0 //E1 //E2 //E3 //E4 //E5
      //ADCHardwareOversampleConfigure(ADC0_BASE,64);
      GPIOPinTypeADC(GPIO_PORTE_BASE, GPIO_PIN_0 | GPIO_PIN_1|GPIO_PIN_2|GPIO_PIN_3|GPIO_PIN_4|GPIO_PIN_5);
      // ADCReferenceSet(ADC0_BASE, ADC_REF_EXT_1V);////
      ADCSequenceConfigure(ADC0_BASE, 1, ADC_TRIGGER_PROCESSOR, 1);
      ADCSequenceStepConfigure(ADC0_BASE, 1, 0, ADC_CTL_CH3);
      ADCSequenceStepConfigure(ADC0_BASE, 1, 1,
              ADC_CTL_CH1 | ADC_CTL_IE | ADC_CTL_END);
      ADCSequenceEnable(ADC0_BASE, 1);
      ADCIntClear(ADC0_BASE, 1);


#ifdef TIMER_0
     SysCtlPeripheralEnable(SYSCTL_PERIPH_TIMER0);
     IntMasterEnable();
     TimerConfigure(TIMER0_BASE, TIMER_CFG_PERIODIC);
     TimerLoadSet(TIMER0_BASE, TIMER_A, ui32SysClock/2);//half second
     IntEnable(INT_TIMER0A);
     TimerIntEnable(TIMER0_BASE, TIMER_TIMA_TIMEOUT);
     TimerDisable(TIMER0_BASE, TIMER_A);
#endif
     //for modem
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
void setheader(int fpgaNum) {
    int base;
    if((fpgaNum==1)||(fpgaNum==2)){
        base= UART5_BASE;
    }
    else{
        base=UART7_BASE;
    }
    UARTCharPut(base, 'A');
    UARTCharPut(base, 'B');
    UARTCharPut(base, 'C');
    UARTCharPut(base, 'D');
    UARTCharPut(base, '0');
#ifdef _LOG_DATA_
    logdata('A');
    logdata('B');
    logdata('C');
    logdata('D');
    logdata('0');
#endif
}

void footer(int fpgaNum)
{
    int base;
    if((fpgaNum==1)||(fpgaNum==2)){
         base=UART5_BASE ;
     }
     else{
         base=UART7_BASE;
     }


    UARTCharPut(base, 'W');
    UARTCharPut(base, 'X');
    UARTCharPut(base, 'Y');
    UARTCharPut(base, 'Z');
#ifdef _LOG_DATA_
    logdata('W');
    logdata('X');
    logdata('Y');
    logdata('Z');
#endif
}
int TestToFpga(){
   // int base=UART5_BASE;
    int base=UART6_BASE;
    int hump_to_fpga=0;
    hump_to_fpga=56+1;
   // int band_num=1;
    int band_num=4;
    footer(band_num);
       setheader(band_num);
       UARTCharPut(base,(char)hump_to_fpga);
       /*if(hump_num==1)
           UARTCharPut(base,'0');
       else if(hump_num==2)
           UARTCharPut(base,'1');
           */
       UARTCharPut(base, '1');
       UARTCharPut(base,'2');
       UARTCharPut(base,'3');
       UARTCharPut(base, '4');
       UARTCharPut(base, '0');
       UARTCharPut(base, '0');
       UARTCharPut(base, '1');
       UARTCharPut(base, '1');
       UARTCharPut(base,'2');
       UARTCharPut(base, '0');
       UARTCharPut(base, '0');
       UARTCharPut(base, 0);
       UARTCharPut(base, 0);
       footer(band_num);
}

int sendToFpga(band_data *repeater_band,int band_num,int hump_num){
    int base;
    int i=0;
    int j=-1;
    int hump_to_fpga=0;
    int iIF,ibandWidth,hum_enable;
    char hump_if1[4];
    char hump_saw[3];
    int if1;

    char FPGA_GAIN_UL,FPGA_GAIN_DL;
    hump_data *hd=NULL;
    if((band_num<1)||(band_num>4))
        return -1;
    if((hump_num<1)||(hump_num>16))
        return -1;
    if((band_num==1)||(band_num==2)){
          base= UART5_BASE;
        //base= UART7_BASE;
          for(i=0;i<MAX_TOTAL_HUMP_ON_FPGA;i++)//max 16 humps for all bands
              {
              if(gHumpInfo_50t[i].hump_on_off==1)
                  j=j+1;
                  if((gHumpInfo_50t[i].band_id==band_num)&&(gHumpInfo_50t[i].hump_id==hump_num)){
                      hd=&gHumpInfo_50t[i];
                    //  hd->center_freq_downlink=9525;
                      break;
                  }
              }
      }
      else{
          base=UART7_BASE;
          //base= UART5_BASE;
          for(i=0;i<MAX_TOTAL_HUMP_ON_FPGA;i++)//max 16 humps for all bands
              {
                  if(gHumpInfo_35t[i].hump_on_off==1)
                         j=j+1;
                  if((gHumpInfo_35t[i].band_id==band_num)&&(gHumpInfo_35t[i].hump_id==hump_num)){
                      hd=&gHumpInfo_35t[i];
                      break;
                  }
              }
      }


    if(hd==NULL)
        return -1;
   if((hd->hump_on_off==0)||(hd->hump_present==0))//if hump on and configured/saved
       return -1;

    hump_to_fpga=i;
  /*  if(band_num==1){
        hump_to_fpga=58;
    }
    */
#ifdef _LOG_DATA_
    logdata((char)'B');
    logdata((char)'A');
    logdata((char)'N');
    logdata((char)'D');
    logdata((char)(48+band_num));
    logdata((char)'-');
#endif
    if((band_num==1)||(band_num==3)){
            // hump_to_fpga='0' ; //b'1000 4 th bit 0 or 1
            //hump_to_fpga='0'+(hump_num-1);//48+i;
    		hump_to_fpga='0'+j;//48+i;
            //check the logic eariler it was
            // iIF=repeater_band->ad_lo_def_frequency-hd->center_freq_downlink;
           // if (iIF < 0) {
            //hump_if1[0] = '0re';
            iIF=hd->center_freq_downlink-repeater_band->ad_lo_def_frequency;
          //  iIF=repeater_band->ad_lo_def_frequency-hd->center_freq_downlink;
            if (iIF < 0) {
                 hump_if1[0] = '1';
                 iIF *= (-1);
             } else
                 hump_if1[0] = '0';
          //  if(band_num==3)
          //      return;

        }
    else if((band_num==2)||(band_num==4)){
        // hump_to_fpga='1'; //b'1000 4 th bit 0 or 1
       // hump_to_fpga=56+(hump_num-1);//|j<<1;//56+1;
    	hump_to_fpga=56+j;
       /* if(j==0)
            hump_to_fpga=56;
        else if(j==1)
            hump_to_fpga=60;
*/
        iIF=hd->center_freq_downlink-repeater_band->ad_lo_def_frequency;
        if (iIF < 0){
             hump_if1[0] = '1';
             iIF *= (-1);
        }
          else
             hump_if1[0] = '0';
    }
    ibandWidth=hd->stop_channel -hd->start_channel;
//    iIF=repeater_band->ad_lo_def_frequency-hd->center_freq_uplink;
  //iIF=repeater_band->ad_lo_def_frequency-hd->center_freq_downlink;

//    iIF=hd->center_freq_downlink-repeater_band->ad_lo_def_frequency;//if lo is not manual

   // iIF=9475-hd->center_freq_downlink;



//if is the distance from center frequency

    int sawval=(ibandWidth+1)*0.2;
   // if1 = dnl - dnl1;
/*
    if (iIF < 0) {
        hump_if1[0] = '0';
        iIF *= (-1);
    } else
        hump_if1[0] = '1';
*/
    hump_if1[1] = ((iIF / 100) + 0x30);
    hump_if1[2] = ((((iIF) % 100) / 10) + 0x30);
    hump_if1[3] = ((((iIF) % 10)) + 0x30);

    if (sawval <= 127) {

        hump_saw[0] = ((ibandWidth / 100) + 0x30);
        hump_saw[1] = ((((ibandWidth) % 100) / 10) + 0x30);
        hump_saw[2] = ((((ibandWidth) % 10)) + 0x30);
    } else {
        hump_saw[0] = '1';
        hump_saw[1] = '2';
        hump_saw[2] = '7';
    }


    FPGA_GAIN_UL = hd->uplink_attn;
    FPGA_GAIN_UL *= 16;
    if (hd->hump_on_off == 1)                                //HUMP1 ENABLE/DISABLE
            {
// hump7[36]='1';
        FPGA_GAIN_UL = (FPGA_GAIN_UL + 1);
    }

    FPGA_GAIN_DL = hd->downlink_attn;
    FPGA_GAIN_DL *= 16;
    if (hd->hump_on_off == 1)
        FPGA_GAIN_DL = (FPGA_GAIN_DL + 1);
    footer(band_num);
    setheader(band_num);
    UARTCharPut(base,(char)hump_to_fpga);
    /*if(hump_num==1)
        UARTCharPut(base,'0');
    else if(hump_num==2)
        UARTCharPut(base,'1');
        */
   // FPGA_GAIN_UL=FPGA_GAIN_UL=0;
  //  hump_if1[0]= hump_if1[1]=hump_if1[2]=hump_if1[3]=0;
  //  hump_saw[0]= hump_saw[1]= hump_saw[2]=0;
    UARTCharPut(base, hump_if1[0]);
    UARTCharPut(base, hump_if1[1]);
    UARTCharPut(base, hump_if1[2]);
    UARTCharPut(base, hump_if1[3]);
    UARTCharPut(base, '0');
    UARTCharPut(base, '0');
    UARTCharPut(base, hump_saw[0]);
    UARTCharPut(base, hump_saw[1]);
    UARTCharPut(base, hump_saw[2]);
    UARTCharPut(base, FPGA_GAIN_UL);
    UARTCharPut(base, FPGA_GAIN_DL);
    UARTCharPut(base, 0);
    UARTCharPut(base, 0);
#ifdef _LOG_DATA_
    logdata((char)hump_to_fpga);
    logdata(hump_if1[0]);
    logdata( hump_if1[1]);
    logdata( hump_if1[2]);
    logdata( hump_if1[3]);
    logdata( '0');
    logdata( '0');
     logdata( hump_saw[0]);
    logdata( hump_saw[1]);
    logdata( hump_saw[2]);
    logdata( FPGA_GAIN_UL);
    logdata( FPGA_GAIN_DL);
    logdata( 0);
    logdata( 0);
#endif
    footer(band_num);

    SysCtlDelay(60000000);  // Change by 200 to 60000000
    return 0;
}

void bReset_board(){
    //        printf("reseting now\n");
            WatchdogResetEnable(WATCHDOG0_BASE);
            ;

}
void init_var(){

 //   bLastSuspend = false;

}

int testFPGA(int band_num){
    int base;
    int i=0;
    int j=-1;
    int hump_to_fpga=0;
    int iIF,ibandWidth,hum_enable;
    char hump_if1[4];
    char hump_saw[3];
    int if1;

    char FPGA_GAIN_UL,FPGA_GAIN_DL;
    hump_data *hd=NULL;
    base= UART5_BASE;

    hump_to_fpga=i;
    FPGA_GAIN_UL=1;
    FPGA_GAIN_DL=0;
  /*  if(band_num==1){
        hump_to_fpga=58;
    }
    */
    //hump_to_fpga='0'+j;
    hump_to_fpga=56+0;
    hump_if1[0]='0';
    hump_if1[1]='1'; hump_if1[2]='2'; hump_if1[3]='5';

    ibandWidth=15;
    hump_saw[0]='0'; hump_saw[1]='1'; hump_saw[2]='5';

    footer(band_num);
    setheader(band_num);
    UARTCharPut(base,(char)hump_to_fpga);
    /*if(hump_num==1)
        UARTCharPut(base,'0');
    else if(hump_num==2)
        UARTCharPut(base,'1');
        */
    UARTCharPut(base, hump_if1[0]);
    UARTCharPut(base, hump_if1[1]);
    UARTCharPut(base, hump_if1[2]);
    UARTCharPut(base, hump_if1[3]);
    UARTCharPut(base, '0');
    UARTCharPut(base, '0');
    UARTCharPut(base, hump_saw[0]);
    UARTCharPut(base, hump_saw[1]);
    UARTCharPut(base, hump_saw[2]);
    UARTCharPut(base, FPGA_GAIN_UL);
    UARTCharPut(base, FPGA_GAIN_DL);
    UARTCharPut(base, 0);
    UARTCharPut(base, 0);
    footer(band_num);
    SysCtlDelay(200); // change by 200 to 60000000
    return 0;
}




