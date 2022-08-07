#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdbool.h>
#include "SPI_DATA.h"
#include "inc/hw_memmap.h"
#include "driverlib/sysctl.h"
#include "driverlib/gpio.h"
#include "inc/hw_gpio.h"
#include "driverlib/rom.h"
#include "driverlib/rom_map.h"
#include "driverlib/pin_map.h"
#include "driverlib/uart.h"
//#include "configureall.h"
#include "driverlib/ssi.h"
#include "spi_flash.h"
#include "util.h"
 volatile uint32_t g_ui32Mode;
 uint32_t ui32Mode;

	char j;
	int ret;
#define SPI_ASSERT3()    GPIOPinWrite(GPIO_PORTD_BASE, GPIO_PIN_2, ~GPIO_PIN_2) // Chip Select Low
#define SPI_DEASSERT3()  GPIOPinWrite(GPIO_PORTD_BASE, GPIO_PIN_2, GPIO_PIN_2) // Chip Select high

#define SPI_ASSERT2()    GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_1, ~GPIO_PIN_1) // Chip Select Low
#define SPI_DEASSERT2()  GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_1, GPIO_PIN_1) // Chip Select high

#define SPI_ASSERT5()    GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_2, ~GPIO_PIN_2) // Chip Select Low
#define SPI_DEASSERT5()  GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_2, GPIO_PIN_2) // Chip Select high

#define SPI_ASSERT4()    GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_4, ~GPIO_PIN_4) // Chip Select Low
#define SPI_DEASSERT4()  GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_4, GPIO_PIN_4) // Chip Select high

#define SPI_ASSERT7()    GPIOPinWrite(GPIO_PORTA_BASE, GPIO_PIN_3, ~GPIO_PIN_3) // Chip Select Low
#define SPI_DEASSERT7()  GPIOPinWrite(GPIO_PORTA_BASE, GPIO_PIN_3, GPIO_PIN_3) // Chip Select high

#define SPI_ASSERT1()    GPIOPinWrite(GPIO_PORTH_BASE, GPIO_PIN_0, ~GPIO_PIN_0) // Chip Select Low
#define SPI_DEASSERT1()  GPIOPinWrite(GPIO_PORTH_BASE, GPIO_PIN_0, GPIO_PIN_0) // Chip Select high

#define SPI_ASSERT6()    GPIOPinWrite(GPIO_PORTH_BASE, GPIO_PIN_1, ~GPIO_PIN_1) // Chip Select Low
#define SPI_DEASSERT6()  GPIOPinWrite(GPIO_PORTH_BASE, GPIO_PIN_1, GPIO_PIN_1) // Chip Select high

#define SPI_ASSERT8()    GPIOPinWrite(GPIO_PORTH_BASE, GPIO_PIN_2, ~GPIO_PIN_2) // Chip Select Low
#define SPI_DEASSERT8()  GPIOPinWrite(GPIO_PORTH_BASE, GPIO_PIN_2, GPIO_PIN_2) // Chip Select high
#define SUCCESS 0

#define AD_WRITE		(1 << 15)
#define AD_CNT(x)	((((x) - 1) & 0x7) << 12)
#define AD_ADDR(x)	((x) & 0x3FF)


void puthex(unsigned char x)
{
    #define hex(A) ("0123456789ABCDEF"[(A)])
unsigned char j,k;

 j=(x &(0xF0))>>4;
 UARTCharPutNonBlocking(UART0_BASE,hex(j));
  k=(x &(0x0F));
 UARTCharPutNonBlocking(UART0_BASE,hex(k));
}
uint8_t get[12];
int K=0;
//typedef void (*pfnspi_write_then_read)(char k,const unsigned char *txbuf, unsigned n_tx,unsigned char *rxbuf, unsigned n_rx);
int spi_write_then_read(struct spi_device *spidev,const unsigned char *txbuf, unsigned n_tx,unsigned char *rxbuf, unsigned n_rx){
    j = 0;
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

       for(j=0;j<3;j++){
           SSIDataPut(spidev->dev.spi_dev_addr, spiBuf[j]);
              //SSIDataGet(SSI3_BASE, &pui32DataRx[ui32Index]);
           while(SSIBusy(spidev->dev.spi_dev_addr));
           SSIDataGetNonBlocking(spidev->dev.spi_dev_addr, rx);
           *rxbuf=rx[0];
       }
       GPIOPinWrite(spidev->dev.select_pin_addr, spidev->dev.select_pin, (spidev->dev.select_pin));
       return SUCCESS;
}
/*
int spi_write_then_read(char k,const unsigned char *txbuf, unsigned n_tx,unsigned char *rxbuf, unsigned n_rx)
{
	j = 0;
	SysCtlDelay(100);

	#ifdef REGISTERS
							int byte;
							for(byte = 0; byte < n_tx; byte++)
							{
							puthex((unsigned char)txbuf[byte]);
							}
							UARTCharPutNonBlocking(UART0_BASE,'\r');
							UARTCharPutNonBlocking(UART0_BASE,'\n');
	#endif

if(k==1)
 {
		SPI_ASSERT1();
		SysCtlDelay(50);
		if (n_tx == 2) {
			SPI_TRANSMITA((unsigned char) txbuf[0]);
			SPI_TRANSMITA((unsigned char) txbuf[1]);
			for (K = 0; K < 1; K++) {
				get[K] = SPI_TRANSMITA(0);
			}
			*rxbuf = get[0];
			SPI_DEASSERT1();
		} else if (n_tx == 3) {
			SPI_TRANSMITA((unsigned char) txbuf[0]);
			SPI_TRANSMITA((unsigned char) txbuf[1]);
			SPI_TRANSMITA((unsigned char) txbuf[2]);
			SysCtlDelay(50);
			SPI_DEASSERT1();
		}
		return SUCCESS;
}
else if(k==4)
{
				SysCtlDelay(100);
				SPI_ASSERT4();
				SysCtlDelay(50);
				if(n_tx==2)
				{
				SPI_TRANSMITD((unsigned char)txbuf[0]);
				SPI_TRANSMITD((unsigned char)txbuf[1]);
				for (K = 0; K < 1; K++)
				{
					SysCtlDelay(15);
					get[K] = SPI_TRANSMITD(0);
				}
				*rxbuf = get[0];
				SPI_DEASSERT4();
				}
				else if(n_tx==3)
				{
					SPI_TRANSMITD((unsigned char)txbuf[0]);
					SPI_TRANSMITD((unsigned char)txbuf[1]);
					SPI_TRANSMITD((unsigned char)txbuf[2]);
				SysCtlDelay(50);
				SPI_DEASSERT4();
				//GPIOPinWrite(SPI_2_GPIO_BASE_1, SPI_2_ENABLE, SPI_2_ENABLE); //ENABLE PIN HIGH
				}
				return SUCCESS;
}
else if(k==5)
 {
		SysCtlDelay(100);
		//GPIOPinWrite(SPI_2_GPIO_BASE_1, SPI_2_ENABLE, ~SPI_2_ENABLE);//ENABLE PIN LOW
		SPI_ASSERT5();
		SysCtlDelay(50);
		if (n_tx == 2) {
			SPI_TRANSMITD((unsigned char) txbuf[0]);
			SPI_TRANSMITD((unsigned char) txbuf[1]);
			for (K = 0; K < 1; K++) {
				get[K] = SPI_TRANSMITD(0);
			}
			*rxbuf = get[0];
			SPI_DEASSERT5();
		} else if (n_tx == 3) {

			SPI_TRANSMITD((unsigned char) txbuf[0]);
			SPI_TRANSMITD((unsigned char) txbuf[1]);
			SPI_TRANSMITD((unsigned char) txbuf[2]);
			SysCtlDelay(50);
			SPI_DEASSERT5();
		}
		return SUCCESS;
}
else if(k==2)
 {
		SysCtlDelay(100);
		//GPIOPinWrite(SPI_2_GPIO_BASE_1, SPI_2_ENABLE, ~SPI_2_ENABLE);//ENABLE PIN LOW
		SPI_ASSERT2();
		SysCtlDelay(50);
		if (n_tx == 2) {
			SPI_TRANSMITD((unsigned char) txbuf[0]);
			SPI_TRANSMITD((unsigned char) txbuf[1]);
			for (K = 0; K < 1; K++) {
				get[K] = SPI_TRANSMITD(0);
			}
			*rxbuf = get[0];
			SPI_DEASSERT2();
		} else if (n_tx == 3) {

			SPI_TRANSMITD((unsigned char) txbuf[0]);
			SPI_TRANSMITD((unsigned char) txbuf[1]);
			SPI_TRANSMITD((unsigned char) txbuf[2]);
			SysCtlDelay(50);
			SPI_DEASSERT2();
		}
		return SUCCESS;
	}
else if(k==3)
 {
		SysCtlDelay(100);
		//GPIOPinWrite(SPI_2_GPIO_BASE_1, SPI_2_ENABLE, ~SPI_2_ENABLE);//ENABLE PIN LOW
		SPI_ASSERT3();
		SysCtlDelay(50);
		if (n_tx == 2) {
			SPI_TRANSMITD((unsigned char) txbuf[0]);
			SPI_TRANSMITD((unsigned char) txbuf[1]);
			for (K = 0; K < 1; K++) {
				get[K] = SPI_TRANSMITD(0);
			}
			*rxbuf = get[0];
			SPI_DEASSERT3();
		} else if (n_tx == 3) {

			SPI_TRANSMITD((unsigned char) txbuf[0]);
			SPI_TRANSMITD((unsigned char) txbuf[1]);
			SPI_TRANSMITD((unsigned char) txbuf[2]);
			SysCtlDelay(50);
			SPI_DEASSERT3();
		}
		return SUCCESS;
	}
else if(k==6)
 {
		SPI_ASSERT6();
		SysCtlDelay(50);
		if (n_tx == 2) {
			SPI_TRANSMITA((unsigned char) txbuf[0]);
			SPI_TRANSMITA((unsigned char) txbuf[1]);
			for (K = 0; K < 1; K++) {
				get[K] = SPI_TRANSMITA(0);
			}
			*rxbuf = get[0];
			SPI_DEASSERT6();
		} else if (n_tx == 3) {
			SPI_TRANSMITA((unsigned char) txbuf[0]);
			SPI_TRANSMITA((unsigned char) txbuf[1]);
			SPI_TRANSMITA((unsigned char) txbuf[2]);
			SysCtlDelay(50);
			SPI_DEASSERT6();
}
return SUCCESS;
}
else if(k==7)
 {
		SPI_ASSERT7();
		SysCtlDelay(50);
		if (n_tx == 2) {
			SPI_TRANSMITA((unsigned char) txbuf[0]);
			SPI_TRANSMITA((unsigned char) txbuf[1]);
			for (K = 0; K < 1; K++) {
				get[K] = SPI_TRANSMITA(0);
			}
			*rxbuf = get[0];
			SPI_DEASSERT7();
		} else if (n_tx == 3) {
			SPI_TRANSMITA((unsigned char) txbuf[0]);
			SPI_TRANSMITA((unsigned char) txbuf[1]);
			SPI_TRANSMITA((unsigned char) txbuf[2]);
			SysCtlDelay(50);
			SPI_DEASSERT7();
		}
		return SUCCESS;
}
else if(k==8)
 {
		SPI_ASSERT8();
		SysCtlDelay(50);
		if (n_tx == 2) {
			SPI_TRANSMITA((unsigned char) txbuf[0]);
			SPI_TRANSMITA((unsigned char) txbuf[1]);
			for (K = 0; K < 1; K++) {
				get[K] = SPI_TRANSMITA(0);
			}
			*rxbuf = get[0];
			SPI_DEASSERT8();
		} else if (n_tx == 3) {
			SPI_TRANSMITA((unsigned char) txbuf[0]);
			SPI_TRANSMITA((unsigned char) txbuf[1]);
			SPI_TRANSMITA((unsigned char) txbuf[2]);
			SysCtlDelay(50);
			SPI_DEASSERT8();
		}
		return SUCCESS;
}
return SUCCESS;
}
*/
