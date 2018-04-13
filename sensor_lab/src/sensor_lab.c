/****************************************************************************
 *   $Id:: i2c_main.c 4785 2010-09-03 22:39:27Z nxp21346                    $
 *   Project: NXP LPC11xx I2C example
 *
 *   Description:
 *     This file contains I2C test modules, main entry, to test I2C APIs.
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

#include "type.h"
#include "i2c.h"
#include "mpu6050.h"

/* Data Buffer */
int16_t accBuffer[3];
int16_t prevBuff[3];

volatile uint32_t I2CCount;
volatile uint8_t I2CMasterBuffer[BUFSIZE];
volatile uint8_t I2CSlaveBuffer[BUFSIZE];
volatile uint32_t I2CMasterState;
volatile uint32_t I2CReadLength, I2CWriteLength;

int X_avg;
int Y_avg;
int Z_avg;

/*******************************************************************************
**  Main Function  main()
*******************************************************************************/
int main (void)
{
	  /* Basic chip initialization is taken care of in SystemInit() called
	   * from the startup code. SystemInit() and chip settings are defined
	   * in the CMSIS system_<part family>.c file.
	   */

	int X_delta;
	int Y_delta;
	int Z_delta;
	int X_Ravg;
	int X_Lavg;
	int Y_Uavg;
	int Y_Davg;

	uint32_t i;

	if ( I2CInit( (uint32_t)I2CMASTER ) == FALSE ) {	// initialize I2c
		while ( 1 );				// Fatal error
	}

    // power up MPU6050 and use X axis Gyro reference clock
	I2CWriteLength = 3;
	I2CReadLength = 0;
	I2CMasterBuffer[0] = MPU6050_ADDR; 	//WRITE ADDRESS
	I2CMasterBuffer[1] = PWR_MGMT1; 	//PWR MGMT ADDRESS		/* address */
	I2CMasterBuffer[2] = 0b00001001; 	//DATA to send to power		/* Data0 */
	I2CEngine();
	for ( i = 0; i < 0x20000; i++ );	/* Delay after write */

	// configure gyr measurement range
	I2CWriteLength = 3;
	I2CReadLength = 0;
	I2CMasterBuffer[0] = MPU6050_ADDR; 	//WRITE ADDRESS
	//I2CMasterBuffer[1] = ACC_CONFIG;
	I2CMasterBuffer[1] = GYR_CONFIG;
	I2CMasterBuffer[2] = 0b00000000;
	I2CEngine();
	for ( i = 0; i < 0x20000; i++ );	/* Delay after write */

	/* Read and Print WHO_AM_I register */
	mpu6050CommTest();

	/* Set LED port pin to output */
	GPIOSetDir(LED_PORT_R, LED_BIT_R, 1 );
	GPIOSetDir(LED_PORT_G, LED_BIT_G, 1 );
	GPIOSetDir(LED_PORT_B, LED_BIT_B, 1 );

	// Continuously reading acc data
	while (1) {
		// Read acceleration 3 axis data
		//mpu6050Read(ACC_REG, ACC_BYTES, accBuffer);

		// Read gyroscope 3 axis data
		mpu6050Read(GYR_REG, ACC_BYTES, accBuffer);
		// GPIOSetValue( LED_PORT_R, LED_BIT_R, LED_OFF );
		// GPIOSetValue( LED_PORT_G, LED_BIT_G, LED_ON );

		X_delta = (accBuffer[0] - prevBuff[0]);
		Y_delta = (accBuffer[1] - prevBuff[1]);
		//Z_delta =abs((accBuffer[2] - prevBuff[2]));

		// printf("\n %d, %d, %d \n",(X_delta, Y_delta, Z_delta));

		if(abs(X_delta) >= 2000 || abs(Y_delta) >= 2000){
			if(abs(X_delta) > abs(Y_delta)){
			  X_avg++;
			  if(X_delta > 0)
				  X_Ravg++;
			  if(X_delta <0)
				  X_Lavg++;
			  //if(X_delta > 0) right++;
			  //if(X_delta < 0) left++;
			}

			if(abs(Y_delta) > abs(X_delta)){
				 Y_avg++;
			 if(Y_delta > 0)
				 Y_Uavg++; //up
			 if(Y_delta <0)
				 Y_Davg++; // down
				// if(X_delta > 0) right++;
				// if(X_delta < 0) left++;
			}
			// if(Z_delta > Y_delta && Z_delta > X_delta)
			//	Z_avg++;
		}

		prevBuff[0] = accBuffer[0];
		prevBuff[1] = accBuffer[1];
		prevBuff[2] = accBuffer[2];

		if(X_avg > 6 || Y_avg > 6){
			if( (X_avg > Y_avg) &&  (X_Ravg > X_Lavg) ) {
				printf("X Right WON\n");
				GPIOSetValue( LED_PORT_G, LED_BIT_G, LED_ON );
				delay(750000);
				GPIOSetValue( LED_PORT_G, LED_BIT_G, LED_OFF );
			}
			if((X_avg > Y_avg) && (X_Lavg > X_Ravg)) {
				printf("X Left WON\n");
				GPIOSetValue( LED_PORT_B, LED_BIT_B, LED_ON );
				delay(750000);
				GPIOSetValue( LED_PORT_B, LED_BIT_B, LED_OFF );
			}
			if((Y_avg > X_avg) && ( Y_Uavg > Y_Davg)) {
				printf("Y Down WON\n");
				GPIOSetValue( LED_PORT_R, LED_BIT_R, LED_ON );
				delay(500000);
				GPIOSetValue( LED_PORT_R, LED_BIT_R, LED_OFF );
				delay(500000);
				GPIOSetValue( LED_PORT_R, LED_BIT_R, LED_ON );
				delay(500000);
				GPIOSetValue( LED_PORT_R, LED_BIT_R, LED_OFF );
			}
			if((Y_avg > X_avg) && (Y_Davg > Y_Uavg )) {
				printf("Y Up WON\n");
				GPIOSetValue( LED_PORT_R, LED_BIT_R, LED_ON );
				delay(750000);
				GPIOSetValue( LED_PORT_R, LED_BIT_R, LED_OFF );
			}
			// if((Z_avg > Y_avg) && (Z_avg > X_avg))
			// 	  printf("Z WON\n");
			Z_avg = 0;
			X_avg = 0;
			Y_avg = 0;
			X_Ravg = 0;
			X_Lavg = 0;
			Y_Uavg = 0;
			Y_Davg = 0;
		}
	}
	return 0;
}

/******************************************************************************
**                            End Of File
******************************************************************************/
