/*
===============================================================================
 Name        : Lab3.c
 Author      : $ Christopher Bishop / John Gadbois
 Version     :
 Copyright   : $ February 19, 2018
 Description : main definition
===============================================================================
*/

//#ifdef __USE_CMSIS
#include "LPC11xx.h"
//#endif

#include <cr_section_macros.h>


uint32_t duty = 0;
uint32_t duty25 = 0;
uint32_t duty75 = 0;
uint32_t toggle_duty = 0;
uint32_t counter = 0;
uint32_t counter10sec = 0;


/* GPIO and GPIO Interrupt Initialization */
void GPIOInit(void) {
	LPC_GPIO0->DIR |= 1<<7;				// Sets up red LED as output
	//LPC_GPIO0->DIR |= 1<<9;				// Sets up blue LED as output

	LPC_GPIO2->DIR &= ~(1<<1);			// Sets Port2Pin1 as input
	LPC_GPIO2->IS &= ~(1<<1);				// Sets Port2Pin1 as edge sensitive
	LPC_GPIO2->IBE &= ~(1<<1);			// Sets interrupt to be controlled by IEV (rising edge)
	LPC_GPIO2->IEV |= (0x02);				// Sets Port2Pin1 as rising edge sensitive
	LPC_GPIO2->IE = ~(0xFFF);				// Turn off all interrupts by setting bits [11:0] to zero
	LPC_GPIO2->IE |= (0x02);				// Turn on interrupts for Port2Pin1

	NVIC_EnableIRQ(EINT2_IRQn);				// Lists port2 in the NVIC table
	NVIC_SetPriority(EINT2_IRQn, 0);		// Sets priority
	return;
}

/* TIMER320 and TIMER321 Interrupt Initialization */
void TIMERInit(void) {

    LPC_SYSCON->SYSAHBCLKCTRL |= (1<<9);	// Enables system clock for 32bit counter/timer0
    LPC_TMR32B0->MR0 = 25000;				// Sets Match Register 0 to reset the TC, and generate interrupt when MR0 matches TC
    LPC_TMR32B0->MCR = 3;					// Interrupt and Reset on when MR0 matches TC
    LPC_TMR32B0->CCR = (0x1<<0)|(0x1<<2);   // Rising interrupts
    NVIC_EnableIRQ(TIMER_32_0_IRQn);		// Lists Timer32_0 in the NVIC table
    NVIC_SetPriority(TIMER_32_0_IRQn, 0);   // Sets priority
    LPC_TMR32B0->TCR = 1;					// Initialize Timer

    return;
}


//GPIO Interrupt Handler
void PIOINT2_IRQHandler(void) {

	//Checks to make sure this is interrupt for Port2Pin1
  if ( LPC_GPIO2->MIS & (0x2) )	{

	duty = counter;
	counter = 0;

	//Turn the LED on
	LPC_GPIO0->MASKED_ACCESS[(1<<7)] &= (0<<7);

	LPC_GPIO2->IC |= (0x1<<1);				// Clear the interrupt flag on Port2Pin1
  }
  return;
}


/* TIMER320 Interrupt Handler */
void TIMER32_0_IRQHandler(void) {
	if ( LPC_TMR32B0->IR & 0x01 ) {

		duty25 = .25 * duty;
		duty75 = .75 * duty;

		counter++;
		counter10sec++;

		// Turn off LED based on which duty cycle its in
		if(toggle_duty == 1){
			if(counter > duty75){
				LPC_GPIO0->MASKED_ACCESS[(1<<7)] = (1<<7);
			}
		}else{
			if(counter > duty25){
				LPC_GPIO0->MASKED_ACCESS[(1<<7)] = (1<<7);
			}
		}

		// Check the counter10sec to see if its time to toggle duty cycle
		// See notebook for calculations
		if(counter10sec > 19200){
			if(toggle_duty == 1){
				toggle_duty = 0;
			}else{
				toggle_duty = 1;
			}
			counter10sec = 0;
		}

		LPC_TMR32B0->IR = 1;				// clear interrupt flag
	}
	return;
}


int main(void) {

    /* Initialization code */
	GPIOInit();                   // Initialize GPIO ports for both Interrupts and LED control
    TIMERInit();              	  // Initialize Timer and Generate a 1ms interrupt

    /* Infinite looping */
    while(1){

    }

    return 0;
}


/*

uint32_t TIMERINTERVAL = 0x1C9C3800;		// Defines 10 second period

volatile uint32_t timer32_0_flag = 0;
volatile uint32_t timer32_1_flag = 0;
volatile uint32_t p2_1_counter  = 0;
uint32_t regVal = 0; 						//This is the GPIO2 pin 1 FLAG
uint32_t toggle = 0;
int period = 48000000;
volatile uint32_t freq = 0;
uint32_t dutyflag = 0;

volatile uint32_t timer32_0_counter = 0;
volatile uint32_t timer32_1_counter = 0;

volatile uint32_t time_check1 = 0;
volatile uint32_t time_check2 = 0;
volatile float delta_time = 0;
volatile int freq_calc = 0;
*/


/*
// TIMER321 Interrupt Handler
void TIMER32_1_IRQHandler(void) {
	if ( LPC_TMR32B1->IR & 0x01 ) {
		LPC_TMR32B1->IR = 1;				// clear interrupt flag
		timer32_1_counter++;
		timer32_1_flag = 1;

		if(timer32_1_counter % 2 == 1){
			LPC_GPIO0->MASKED_ACCESS[(1<<9)] = (0<<9);
		}else{
			LPC_GPIO0->MASKED_ACCESS[(1<<9)] = (1<<9);
		}
	}
	return;
}
*/

/*
void ToggleProcess(void){
	if(toggle){
	freq = p2_1_counter / 10;
	period = 1/freq;
	//printf("Freq is calc to : %d\n",freq);
	period = period*48000000;
	//adjust for cpu period/ clock cylces
	p2_1_counter = 0;
	//toggle = 0;

	LPC_TMR32B1->MR0 = period;
	LPC_TMR32B1->IR = 1;  //clear timer1
	}
	toggle = 0;
		if(toggle == 0){
			//while(!(LPC_TMR32B1->IR & 0x01)){
			if(((LPC_TMR32B1->TC) < (period * 3 / 4)) && (dutyflag == 0)){
				//turn on 75 % duty cycle
				LPC_GPIO0->MASKED_ACCESS[(1<<7)] &= (0<<7);
			}
			else if(((LPC_TMR32B1->TC) > (period * 3 / 4)) && (dutyflag == 0)){
				LPC_GPIO0->MASKED_ACCESS[(1<<7)] = (1<<7);
				dutyflag++;}

			else if(((LPC_TMR32B1->TC) < (period * 3 / 4)) && (dutyflag == 1)){
							//turn on 25 % duty cycle
				LPC_GPIO0->MASKED_ACCESS[(1<<7)] = (0<<7);
						}
			else if(((LPC_TMR32B1->TC) > (period * 3 / 4)) && (dutyflag == 1)){


				LPC_GPIO0->MASKED_ACCESS[(1<<7)] = (1<<7);
				dutyflag--;
						}
		//	}
			return;

		}
}
*/

/*
	// Timer31_1 Initialization. Every five seconds, an interrupt is generated, since TC matches
	//  the value loaded into TMR32B1, which is the number of system clock cycles in five seconds.
  	//  When this interrupt occurs, the interrupt flag is reset, and timer32_1_counter is
	//  incremented by one. A blue LED is toggled on and off.
	//
    LPC_SYSCON->SYSAHBCLKCTRL |= (1<<10);	// Enables system clock for 32bit counter/timer1
    LPC_TMR32B1->MR0 = TIMERINTERVAL_TEST;
    LPC_TMR32B1->MCR = 3;					// Interrupt and Reset on when MR0 matches TC
    NVIC_EnableIRQ(TIMER_32_1_IRQn);		// Lists Timer32_1 in the NVIC table
    NVIC_SetPriority(TIMER_32_1_IRQn, 0x0);// Sets priority
    LPC_TMR32B1->TCR = 1;					// Initialize Timer
*/

/*
	time_check1 = time_check2;
	time_check2 = LPC_TMR32B0->TC;
	delta_time = time_check2-time_check1;
	delta_time = delta_time * (.000000021);
	freq_calc = 1/delta_time;
*/
