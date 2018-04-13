#include "driver_config.h"
#include "target_config.h"
#include "timer32.h"
#include "gpio.h"
#include <math.h>
#include <string.h>

/* Main Program */

extern int fibonacci_asm(int z);
int digit; // number of digits
int value; //for switch table
int dig1;
int dig2;
int dig3;
int dig4;

int size;
int size1;
int size2;
int size3;
int size4;

volatile static int loop = 0;

void delay(int time){
        timer32_0_counter = 0;
        while(timer32_0_counter < time){
                loop++;
        }
        timer32_0_counter = 0;
}

void display(int number[], int digits_hex){
        for(int m=0; m < digits_hex; m++){
                GPIOSetValue(LED_PORT_R, LED_BIT_R, LED_OFF );
                if(number[m] == 0){
                        delay(5);
                        GPIOSetValue(LED_PORT_R, LED_BIT_R, LED_ON );
                        delay(10);
                        GPIOSetValue(LED_PORT_R, LED_BIT_R, LED_OFF );
                }else{
                        delay(5);
                        GPIOSetValue(LED_PORT_R, LED_BIT_R, LED_ON );
                        delay(30);
                        GPIOSetValue(LED_PORT_R, LED_BIT_R, LED_OFF );
                }
                //Delay in between digits
                m++;
                delay(5);
        }
        GPIOSetValue(LED_PORT_R, LED_BIT_R, LED_OFF );
        GPIOSetValue( LED_PORT_B, LED_BIT_B, LED_ON );
        // Slight Delay
        delay(5);
        GPIOSetValue( LED_PORT_B, LED_BIT_B, LED_OFF );
}



void translateFib(int fibNum){
	//switch table
	switch(value){
			case 0: {value = 0b11111;
				size = 5;}
			case 1: {value = 0b01111;
				size =5;}
			case 2: {value = 0b00111;
				size =5;}
			case 3: {value = 0b00011;
				size =5;}
			case 4: {value = 0b00001;
				size =5;}
			case 5: {value = 0b00000;
				size =5;}
			case 6: {value = 0b10000;
				size =5;}
			case 7: {value = 0b11000;
				size =5;}
			case 8: {value = 0b11100;
				size =5;}
			case 9: {value =0b11110;
				size = 5;}
			case 10: {value =0b01;
				size = 2;}
			case 11: {value = 0b1000;
				size = 4;}
			case 12: {value = 0b1010;
				size = 4;}
			case 13: {value = 0b100;
				size = 3;}
			case 14: {value = 0b0;
				size = 1;}
			case 15: {value = 0b0010;
				size = 4;}
			}

	if(fibNum < 0x1000) digit = 4;
	if(fibNum < 0x100) digit = 3;
	if (fibNum < 0x10) digit = 2;
	if (fibNum < 0x1) digit = 1;
	if(digit == 1){
		switch(fibNum);
		dig1 = value;
		size1 = size;
	}
	if(digit == 2){
		switch(((fibNum && 0xF0) >> 4));
		dig2 = value;
		size2 = size;
		switch(((fibNum && 0x0F)));
		dig1 = value;
		size1 = size;
	}
	if(digit == 3){
		switch(((fibNum && 0xF00)>> 8));
		dig3 = value;
		size3 = size;
		switch(((fibNum && 0x0F0) >> 4));
		dig2 = value;
		size2 = size;
		switch(((fibNum && 0x0F)));
		dig1 = value;
		size1=size;
		}
	if(digit == 4){
		switch(((fibNum && 0xF000)>>12));
		dig4 = value;
		size4 = size;
		switch(((fibNum && 0xF00)>> 8));
		dig3 = value;
		size3 = size;
		switch(((fibNum && 0x0F0) >> 4));
		dig2 = value;
		size2 = size;
		switch(((fibNum && 0x0F)));
		dig1 = value;
		size1 = size;
	}
	return;
}
//Alright so one bug that might be here^  hexadicemila # is base 16 but other numbers are base 10?

int printarray[5];

void array(int smallSize, int bin){
	if(smallSize == 5){
		printarray[0] = ((0b00001) && bin);
		printarray[1] = ((0b00010) && bin);
		printarray[2] = ((0b00100) && bin);
		printarray[3] = ((0b01000) && bin);
		printarray[4] = ((0b10000) && bin);
}
	if(smallSize == 4){
		printarray[0] = ((0b00001) && bin);
		printarray[1] = ((0b00010) && bin);
		printarray[2] = ((0b00100) && bin);
		printarray[3] = ((0b01000) && bin);
	}
	if(smallSize == 3){
		printarray[0] = ((0b00001) && bin);
		printarray[1] = ((0b00010) && bin);
		printarray[2] = ((0b00100) && bin);
	}
	if(smallSize == 2){
		printarray[0] = ((0b00001) && bin);
		printarray[1] = ((0b00010) && bin);
	}
	if(smallSize == 1){
		printarray[0] = ((0b00001) && bin);
	}
}

int main(void) {
	////////////////////////////////////////
	int i = 0, on = 0;

	/* Initialize 32-bit timer 0. TIME_INTERVAL is defined as 10mS */
	/* You may also want to use the Cortex SysTick timer to do this */
	init_timer32(0, TIME_INTERVAL);
	/* Enable timer 0. Our interrupt handler will begin incrementing
	 * the TimeTick global each time timer 0 matches and resets.
	 */
	enable_timer32(0);
	/* Initialize GPIO (sets up clock) */
	GPIOInit();
	/* Set LED port pin to output */
	GPIOSetDir(LED_PORT_R, LED_BIT_R, 1 );
	GPIOSetDir(LED_PORT_B, LED_BIT_B, 1);

	GPIOSetValue( LED_PORT_R, LED_BIT_R, LED_OFF );
	GPIOSetValue( LED_PORT_B, LED_BIT_B, LED_OFF );
	////////////////////////////////////////





	int j, k;

//	i = sum(1, 2);
//	j = asm_sum(5, 6);

	//k = fib(8);
	j = fibonacci_asm(20);
	printf("%d\n", j);


	translateFib(j);

	//printf("Hex is %d%d%d%d\n" ,dig4, dig3, dig2, dig1);
	printf("Digits: %d\n", digit);
	printf("Dig4: %X\n",dig4);
	printf("Dig3: %X\n",dig3);
	printf("Dig2: %X\n",dig2);
	printf("Dig1: %X\n",dig1);


	if(digit==1){
		array(size1, dig1);
		display(printarray, size1);
	}
	if(digit==2){
		array(size2, dig2);
		display(printarray, size2);

		array(size1, dig1);
		display(printarray, size1);
	}
	if(digit==3){
		array(size3, dig3);
		display(printarray, size3);

		array(size2, dig2);
		display(printarray, size2);

		array(size1, dig1);
		display(printarray, size1);
	}
	if(digit==4){
		array(size4, dig4);
		display(printarray, size4);

		array(size3, dig3);
		display(printarray, size3);

		array(size2, dig2);
		display(printarray, size2);

		array(size1, dig1);
		display(printarray, size1);
	}





	//printf("%d", k);
	// Enter an infinite loop, just incrementing a counter
	volatile static int loop = 0;
	while (1) {
		loop++;
	}
}


