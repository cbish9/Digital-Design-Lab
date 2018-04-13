/*
 * mpu6050.h
 *
 *  Created on: Oct 17, 2017
 *      Author: AA_LQ
 */

#include "driver_config.h"
#include "target_config.h"

#include "type.h"

#ifndef MPU6050_H_
#define MPU6050_H_

/*******************************************************************************
**	register
*******************************************************************************/
#define MPU6050_ADDR		0xD0
#define PWR_MGMT1			0x6B
#define WHO_AM_I			0x75
#define MPU6050_READ		0x01
#define ACC_REG				0x3B
#define GYR_REG				0x43
#define ACC_BYTES 			0x06
#define ACC_CONFIG 			0x1C
#define GYR_CONFIG			0x1B
// ACC_CONFIG = ACC_xG
#define ACC_2G				0x00 //16384 LSB/g
#define ACC_4G				0x08 //8192 LSB/g
#define ACC_8G				0x10 //4096 LSB/g
#define ACC_16G				0x18 //2048 LSB/g


#define PORT0		0
#define PORT1		1
#define PORT2		2
#define PORT3		3
static LPC_GPIO_TypeDef (* const LPC_GPIO[4]) = { LPC_GPIO0, LPC_GPIO1, LPC_GPIO2, LPC_GPIO3 };


/*******************************************************************************
**	functions
*******************************************************************************/
extern void mpu6050Read(uint8_t startRegAddr, uint8_t length, int16_t *accBuffer);
extern void mpu6050Write(uint8_t regAdd,uint8_t regValue);
extern void mpu6050CommTest(void);
extern void GPIOSetDir( uint32_t portNum, uint32_t bitPosi, uint32_t dir );
extern void GPIOSetValue( uint32_t portNum, uint32_t bitPosi, uint32_t bitVal );
extern void delay(int time);

#endif /* MPU6050_H_ */
