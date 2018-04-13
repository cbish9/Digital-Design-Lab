/****************************************************************************
 *   $Id:: uart_main.c 4824 2010-09-07 18:47:51Z nxp21346                   $
 *   Project: NXP LPC11xx UART example
 *
 *   Description:
 *     This file contains UART test modules, main entry, to test UART APIs.
 *
 ****************************************************************************
 * Software that is described herein is for illustrative purposes only
 * which provides customers with programming information regarding the
 * products. This software is supplied "AS IS" without any warranties.
 * NXP Semiconductors assumes no responsibility or liability for the
 * use of the software, conveys no license or title under any patent,
 * copyright, or mask work right to the product. NXP Semiconductors
 * reserves the right to make changes in the software without
 * notification. NXP Semiconductors also make no representation or
 * warranty that such application will be suitable for the specified
 * use without further testing or modification.
****************************************************************************/
#include "driver_config.h"
#include "target_config.h"

#include "uart.h"
#include <stdlib.h>

#define ADC_CLK			2400000		/* set to 2.4Mhz */
#define ADC_OFFSET		0x10
#define ADC_INDEX		4
#define ADC_DONE		0x80000000
#define ADC_OVERRUN		0x40000000
#define ADC_ADINT		0x00010000

extern volatile uint32_t UARTCount;
extern volatile uint32_t prevUARTCount;
extern volatile uint8_t UARTBuffer[BUFSIZE];
extern volatile uint8_t input_rec;

volatile uint32_t ADCValue = 0;

int TimerInterval = 96000; //500 interrupts / second. (500 hz)
float period; //variable period to set various duties
int count; //current count of interupt(0-500)
int Led; //LED state 0 off 1 on
int range;//spectrum used for duty
float x;// frequency factor
float y; // duty factor

int ADC_speed = 1;		// Reporting speed for ADC
int ADC_repon = 0;


void freqSet(float freq){
	period = 1/freq;
	x = (float) 500 /  freq;
//	printf("period %f\n", period);
}


void dutySet(float(percent)){ //percent 0-100;
	y =	(percent/100)*x;
}

void GPIOInit(){
	LPC_GPIO0->DIR |= 1<<7;				// Sets up red LED as output -Port0Pin7

	//LPC_SYSCON->SYSAHBCLKCTRL |= (1<<13);	// Enables system clock for 32bit counter/timer1
	//LPC_IOCON->R_PIO0_11 |= 0x02;		// Sets up Port0Pin11 as ADC0
	//LPC_ADC->CR |= (0x01);				// Sets Port0Pin11 to be sampled and collected

	/* Disable Power down bit to the ADC block. */
	LPC_SYSCON->PDRUNCFG &= ~(0x1<<4);

	/* Enable AHB clock to the ADC. */
	LPC_SYSCON->SYSAHBCLKCTRL |= (1<<13);

	LPC_IOCON->R_PIO0_11 &= ~0x8F; /*  ADC I/O config */
	LPC_IOCON->R_PIO0_11 |= 0x02;  /* ADC IN0 */
	LPC_IOCON->R_PIO0_11  = 0x02;	// Select AD0 pin function

	LPC_ADC->CR = ((SystemCoreClock/LPC_SYSCON->SYSAHBCLKDIV)/ADC_CLK-1)<<8;

	//NVIC_EnableIRQ(ADC_IRQn);
	//LPC_ADC->INTEN = 0x1FF;		/* Enable all interrupts */

	return;
}

uint32_t ADCRead( void )
{
	uint32_t regVal, ADC_Data;
	LPC_ADC->CR &= 0xFFFFFF00;
	LPC_ADC->CR |= (1 << 24) | (1 << 0);
	/* switch channel,start A/D convert */

  while ( 1 )			/* wait until end of A/D convert */
  {
	regVal = *(volatile unsigned long *)(LPC_ADC_BASE + ADC_OFFSET + ADC_INDEX * 0);
	/* read result of A/D conversion */
	if ( regVal & ADC_DONE )
	{
		break;
	}
  }

  LPC_ADC->CR &= 0xF8FFFFFF;	/* stop ADC now */
  if ( regVal & ADC_OVERRUN )	/* save data when it's not overrun, otherwise, return zero */
  {
	return ( 0 );
  }
  ADC_Data = ( regVal >> 6 ) & 0x3FF;
  return ( ADC_Data );	/* return A/D conversion value */
}


void TIMERInit(void) {

    LPC_SYSCON->SYSAHBCLKCTRL |= (1<<9);	// Enables system clock for 32bit counter/timer0
    LPC_TMR32B0->MR0 = TimerInterval;		// Sets Match Register 0 to reset the TC, and generate interrupt when MR0 matches TC
    LPC_TMR32B0->MCR = 3;					// Interrupt and Reset on when MR0 matches TC
    LPC_TMR32B0->CCR = (0x1<<0)|(0x1<<2);   // Rising interrupts
    NVIC_EnableIRQ(TIMER_32_0_IRQn);		// Lists Timer32_0 in the NVIC table
    NVIC_SetPriority(TIMER_32_0_IRQn, 0);   // Sets priority
    LPC_TMR32B0->TCR = 1;					// Initialize Timer
    return;
}

void TIMER32_0_IRQHandler(void) {
	if ( LPC_TMR32B0->IR & 0x01 ) {
		count++;
		range =  count % (int)x;

		if(Led){
			if(range <= y){
				LPC_GPIO0->MASKED_ACCESS[(1<<7)] = (0<<7);} //on
			else{
				LPC_GPIO0->MASKED_ACCESS[(1<<7)] = (1<<7); } //off
	  	  	}
		if(count == 500){
			count = 0;
		}

		ADCValue = ADCRead();

		LPC_TMR32B0->IR = 1; 	// clear interrupt flag
	}
	return;
}

void sendPeriphMenu(void){
	LPC_UART->IER = IER_THRE | IER_RLS;			// Disable RBR
	unsigned char apcm[] =    "\nArm Peripheral Control Menu\n";
	unsigned char ctl_led[] = "1.  Control LED\n";
	unsigned char ctl_adc[] = "2.  Control ADC\n";
	UARTSend( apcm, 29 );
	UARTSend( ctl_led, 16 );
	UARTSend( ctl_adc, 16 );
	LPC_UART->IER = IER_THRE | IER_RLS | IER_RBR;	// Re-enable RBR
}

void sendLEDctlMenu(void){
	LPC_UART->IER = IER_THRE | IER_RLS;			// Disable RBR
	unsigned char ledctl[] =  "\nLED Control Menu\n";
	unsigned char led_on[] =  "1.  Blink ON\n";
	unsigned char led_off[] = "2.  Blink OFF\n";
	unsigned char sfq[] = 	  "3.  Set Frequency\n";
	unsigned char sdc[] = 	  "4.  Set Duty Cycle\n";
	unsigned char gb[] = 	  "5.  Go Back\n";
	UARTSend( ledctl, 18 );
	UARTSend( led_on, 13 );
	UARTSend( led_off, 14 );
	UARTSend( sfq, 18 );
	UARTSend( sdc, 19 );
	UARTSend( gb, 12 );
	LPC_UART->IER = IER_THRE | IER_RLS | IER_RBR;	// Re-enable RBR
}

void sendFreqMenu(void){
	LPC_UART->IER = IER_THRE | IER_RLS;			// Disable RBR
	unsigned char ledctl[] = "\nLED Frequency Menu\n";
	unsigned char slow[] = 	"1.  Slow\n";
	unsigned char med[] = 	"2.  Medium\n";
	unsigned char fast[] = 	"3.  Fast\n";
	unsigned char vfast[] =  "4.  Very Fast\n";
	unsigned char gb[] = 	"5.  Go Back\n";
	UARTSend( ledctl, 20 );
	UARTSend( slow, 9);
	UARTSend( med, 11);
	UARTSend( fast, 9);
	UARTSend( vfast, 14);
	UARTSend( gb, 12 );
	LPC_UART->IER = IER_THRE | IER_RLS | IER_RBR;	// Re-enable RBR
}

void sendDutyMenu(void){
	LPC_UART->IER = IER_THRE | IER_RLS;			// Disable RBR
	unsigned char ledctl[] = 	"\nLED Duty Cycle Menu\n";
	unsigned char ten[] = 		"1.  10%\n";
	unsigned char twofive[] = 	"2.  25%\n";
	unsigned char fiveo[] = 	"3.  50%\n";
	unsigned char sevenfive[] = "4'.  75%\n";
	unsigned char nineo[] = 	"5.  90%\n";
	unsigned char gb[] = 		"6.  Go Back\n";
	UARTSend( ledctl, 21 );
	UARTSend( ten, 8);
	UARTSend( twofive, 8);
	UARTSend( fiveo, 8);
	UARTSend( sevenfive, 8);
	UARTSend( nineo, 8);
	UARTSend( gb, 12 );
	LPC_UART->IER = IER_THRE | IER_RLS | IER_RBR;	// Re-enable RBR
}

void sendADCctlMenu(void){
	unsigned char adcmenu[] =	"\nADC Control Menu\n";
	unsigned char adcr_on[] = 	"1.  ADC Reporting ON\n";
	unsigned char adcr_off[] = 	"2.  ADC Reporting OFF\n";
	unsigned char adc_srf[] = 	"3.  Set Reporting Frequency\n";
	unsigned char gb[] = 		"4.  Go Back\n";
	UARTSend( adcmenu, 18 );
	UARTSend( adcr_on, 21 );
	UARTSend( adcr_off, 22 );
	UARTSend( adc_srf, 28 );
	UARTSend( gb, 12 );
}

void sendADCrfMenu(void){
	unsigned char adcmenu[] = "\nADC Reporting Frequency Menu\n";
	unsigned char slow[] = 	 "1.  Slow\n";
	unsigned char med[] = 	 "2.  Medium\n";
	unsigned char fast[] = 	 "3.  Fast\n";
	unsigned char vfast[] =   "4.  Very Fast\n";
	unsigned char gb[] = 	 "5.  Go Back\n";
	UARTSend( adcmenu, 30 );
	UARTSend( slow, 9);
	UARTSend( med, 11);
	UARTSend( fast, 9);
	UARTSend( vfast, 14);
	UARTSend( gb, 12 );
}

void sendInvalid(void){
	unsigned char str[] = "\nThe input is invalid, try again\n";
	UARTSend( str, 33 );
}

void sendADCval(void){
	if(ADC_repon != 0){
		char buf[5];
		char end[1] = "\n";
		itoa(ADCValue,buf,10);
		if(ADC_speed == 1){
			UARTSend( buf, strlen(buf) );
			UARTSend( end, 1);
			delay(5000000);
		}
		if(ADC_speed == 2){
			UARTSend( buf, strlen(buf) );
			UARTSend( end, 1);
			delay(2500000);
		}
		if(ADC_speed == 3){
			UARTSend( buf, strlen(buf) );
			UARTSend( end, 1);
			delay(1000000);
		}
		if(ADC_speed == 4){
			UARTSend( buf, strlen(buf) );
			UARTSend( end, 1);
			delay(500000);
		}
	}
	return;
}

void delay(int time){
	for(int i =0; i< time; i++){
		// wait
	}
	return;
}

int getInput(void){
	int input;
	while(1){
		if( input_rec == 1) {
			input_rec = 0;
			input = UARTBuffer[ prevUARTCount ];
			break;
		}
		sendADCval();
	}
	return input;
}



int main (void) {
	  /* Basic chip initialization is taken care of in SystemInit() called
	   * from the startup code. SystemInit() and chip settings are defined
	   * in the CMSIS system_<part family>.c file.
	   */

  /* NVIC is installed inside UARTInit file. */
  UARTInit(UART_BAUD);

  TIMERInit();
  GPIOInit();


#if MODEM_TEST
  ModemInit();
#endif

//  while (1)
//  {				// Loop forever
/*
	// This section of code is the echo functionality, which echos whatever
	// is sent from the Bluetooth device back to the device
	if ( UARTCount != 0 )
	{
	  LPC_UART->IER = IER_THRE | IER_RLS;			//Disable RBR
	  UARTSend( (uint8_t *)UARTBuffer, UARTCount );
	  UARTCount = 0;
	  LPC_UART->IER = IER_THRE | IER_RLS | IER_RBR;	// Re-enable RBR
	}
*/

/*
	// This section will send the string, "Hello World over and over again
	// to the Bluetooth device at a fixed interval.
	LPC_UART->IER = IER_THRE | IER_RLS;			// Disable RBR
	char str[] = "Hello world\n";
	UARTSend( str, 12 );
	//UARTCount = 0;
	LPC_UART->IER = IER_THRE | IER_RLS | IER_RBR;	// Re-enable RBR

	for (int i = 0; i < 3000000; i++){}
*/


	while(1){
		sendPeriphMenu();
		int input1 = getInput();
		if(input1 == 0x31){
			////////// LED Control Menu
			while(1){
				sendLEDctlMenu();
				int input2 = getInput();
				if(input2 == 0x31){
					// Blink on
					//Logic
					Led = 1;

					//LPC_GPIO0->MASKED_ACCESS[(1<<7)] = (0<<7); //on
					//LPC_GPIO0->MASKED_ACCESS[(1<<7)] = (1<<7); //off
				}else if(input2 == 0x32){
					// Blink off
					Led = 0;
				//	LPC_GPIO0->MASKED_ACCESS[(1<<7)] = (1<<7); //off
				}else if(input2 == 0x33){
					///////// Set Frequency Menu
					while(1){
						sendFreqMenu();
						int input3 = getInput();
						if(input3 == 0x31){
							// Slow
							freqSet((float)1);
						}else if(input3 == 0x32){
							// Medium
							freqSet((float)10);
						}else if(input3 == 0x33){
							// Fast
							freqSet((float)60);
						}else if(input3 == 0x34){
							// Very Fast
							freqSet((float)250);
						}else if(input3 == 0x35){
							// Go back
							break;
						}else{
							sendInvalid();
						}
					}
				}else if(input2 == 0x34){
					/////// Set duty cycle Menu
					while(1){
						sendDutyMenu();
						int input3 = getInput();
						if(input3 == 0x31){
							// 10%
							dutySet(10);
						}else if(input3 == 0x32){
							// 25%
							dutySet(25);
						}else if(input3 == 0x33){
							// 50%
							dutySet(50);
						}else if(input3 == 0x34){
							// 75%
							dutySet(75);
						}else if(input3 == 0x35){
							// 90%
							dutySet(90);
						}else if(input3 == 0x36){
							// Go back
							break;
						}else{
							sendInvalid();
						}
					}
				}else if(input2 == 0x35){
					// Go back
					break;
				}else{
					sendInvalid();
				}
			}
		}else if (input1 == 0x32){
			//////////////// ADC Control Menu
			while(1){
				sendADCctlMenu();
				sendADCval();
				int input2 = getInput();
				if(input2 == 0x31){
					// ADC Reporting on
					ADC_repon = 1;
				}else if(input2 == 0x32){
					// ADC Reporting off
					ADC_repon = 0;
				}else if(input2 == 0x33){
					// Set Reporting Frequency
					while(1){
						sendADCrfMenu();
						int input3 = getInput();
						if(input3 == 0x31){
							// Slow
							ADC_speed = 1;
						}else if(input3 == 0x32){
							// Medium
							ADC_speed = 2;
						}else if(input3 == 0x33){
							// Fast
							ADC_speed = 3;
						}else if(input3 == 0x34){
							// Very Fast
							ADC_speed = 4;
						}else if(input3 == 0x35){
							// Go back
							break;
						}else{
							sendInvalid();
						}
					}
				}else if(input2 == 0x34){
					// Go back
					break;
				}else{
					sendInvalid();
				}
			}
		}else{
			sendInvalid();
		}
	}
}

