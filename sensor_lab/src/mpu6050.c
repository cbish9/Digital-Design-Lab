/*
 * mpu6050.c
 *
 *  Created on: Oct 17, 2017
 *      Author: AA_LQ
 */
#include "mpu6050.h"
#include "i2c.h"
#include "driver_config.h"
#include "target_config.h"

#include "type.h"

extern volatile uint32_t I2CCount;
extern volatile uint8_t I2CMasterBuffer[BUFSIZE];
extern volatile uint8_t I2CSlaveBuffer[BUFSIZE];
extern volatile uint32_t I2CMasterState;
extern volatile uint32_t I2CReadLength, I2CWriteLength;


/* MPU6050 read data, can be used to grab data from sensor*/
void mpu6050Read(uint8_t startRegAddr, uint8_t length, int16_t *accBuffer) {

	// Clear buffers
	uint32_t i;
	for (i = 0; i < BUFSIZE; i++) {
		I2CMasterBuffer[i] = 0x00;
		I2CSlaveBuffer[i] = 0x00;
	}

	// Write to MPU6050 sensor: start to read from which sensor
	I2CWriteLength = 2;
	I2CReadLength = 0;
	I2CMasterBuffer[0] = MPU6050_ADDR;
	I2CMasterBuffer[1] = startRegAddr;				/* address */
	I2CEngine();
	for ( i = 0; i < 0x2000; i++ );	/* Delay after write */

	// Clear buffers
	for (i = 0; i < BUFSIZE; i++) {
		I2CMasterBuffer[i] = 0x00;
		I2CSlaveBuffer[i] = 0x00;
	}

	// Write to MPU6050 sensor: start to read and tell the sensor how many bytes you want to read from
	I2CWriteLength = 1;
	I2CReadLength = length;
	I2CMasterBuffer[0] = MPU6050_ADDR | MPU6050_READ;
	I2CEngine();
	for ( i = 0; i < 0x20000; i++ );	/* Delay after write */

	// Store data to acc buffers
	int j = 0;
	for ( i = 0; i < length; i++){
		int high = I2CSlaveBuffer[i];
		i++;
		int low = I2CSlaveBuffer[i];
		accBuffer[j] = (high<<8) | low;
		j++;
	}
}


/* MPU6050 write data, can be used to configure register*/
void mpu6050Write(uint8_t regAdd,uint8_t regValue) {
	// Clear buffers
	uint32_t i;
	for (i = 0; i < BUFSIZE; i++) {
		I2CMasterBuffer[i] = 0x00;
		I2CSlaveBuffer[i] = 0x00;
	}

	// Write to MPU6050: set a value to a register
	I2CWriteLength = 3;
	I2CReadLength = 0;
	I2CMasterBuffer[0] = MPU6050_ADDR;
	I2CMasterBuffer[1] = regAdd;				/* address */
	I2CMasterBuffer[2] = regValue;
	I2CEngine();
	for ( i = 0; i < 0x20000; i++ );	/* Delay after write */
}


/* MPU6050 read who_am_i register, can be used to test I2C communication*/
void mpu6050CommTest(void) {

	// Clear buffers
	uint32_t i;
	for (i = 0; i < BUFSIZE; i++) {
		I2CMasterBuffer[i] = 0x00;
		I2CSlaveBuffer[i] = 0x00;
	}

	I2CWriteLength = 2;
	I2CReadLength = 0;
	I2CMasterBuffer[0] = MPU6050_ADDR;
	I2CMasterBuffer[1] = WHO_AM_I;				/* address */
	I2CEngine();
	for ( i = 0; i < 0x20000; i++ );	/* Delay after write */

	// Clear buffers
	for (i = 0; i < BUFSIZE; i++) {
		I2CMasterBuffer[i] = 0x00;
		I2CSlaveBuffer[i] = 0x00;
	}

	/* Read who am i register for testing */
	// Tell MPU6050 sensor: what is your name? -- Read the WHO_AM_I register
	I2CWriteLength = 1;
	I2CReadLength = 1;
	I2CMasterBuffer[0] = MPU6050_ADDR | MPU6050_READ;
	I2CEngine();
	for ( i = 0; i < 0x20000; i++ );	/* Delay after write */

	// Print the value stored in WHO_AM_I register
	printf("Who_am_I = 0x%X ?\n", I2CSlaveBuffer[0]);
}


/*****************************************************************************
** Function name:		GPIOSetValue
**
** Descriptions:		Set/clear a bitvalue in a specific bit position
**						in GPIO portX(X is the port number.)
**
** parameters:			port num, bit position, bit value
** Returned value:		None
**
*****************************************************************************/
void GPIOSetValue( uint32_t portNum, uint32_t bitPosi, uint32_t bitVal )
{
  LPC_GPIO[portNum]->MASKED_ACCESS[(1<<bitPosi)] = (bitVal<<bitPosi);
}


/*****************************************************************************
** Function name:		GPIOSetDir
**
** Descriptions:		Set the direction in GPIO port
**
** parameters:			port num, bit position, direction (1 out, 0 input)
** Returned value:		None
**
*****************************************************************************/
void GPIOSetDir( uint32_t portNum, uint32_t bitPosi, uint32_t dir )
{
  if(dir)
	LPC_GPIO[portNum]->DIR |= 1<<bitPosi;
  else
	LPC_GPIO[portNum]->DIR &= ~(1<<bitPosi);
}



void delay(int time){
	for(int i =0; i< time; i++){
		// wait
	}
	return;
}
