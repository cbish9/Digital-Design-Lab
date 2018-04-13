################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../driver/crp.c \
../driver/gpio.c \
../driver/timer32.c 

OBJS += \
./driver/crp.o \
./driver/gpio.o \
./driver/timer32.o 

C_DEPS += \
./driver/crp.d \
./driver/gpio.d \
./driver/timer32.d 


# Each subdirectory must supply rules for building sources it contributes
driver/%.o: ../driver/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -DDEBUG -D__CODE_RED -DTARGET_SHORTCHIP=lpc13 -DTARGET_CHIP=LPC1343 -D__USE_CMSIS=1 -D__REDLIB__ -I"/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab3/cmsis" -I"/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab3/config" -I"/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab3/driver" -O0 -fno-common -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m3 -mthumb -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


