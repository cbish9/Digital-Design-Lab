################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/Lab3_main.c \
../src/cr_startup_lpc11.c \
../src/crp.c 

OBJS += \
./src/Lab3_main.o \
./src/cr_startup_lpc11.o \
./src/crp.o 

C_DEPS += \
./src/Lab3_main.d \
./src/cr_startup_lpc11.d \
./src/crp.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -DDEBUG -D__CODE_RED -DCORE_M0 -D__USE_CMSIS=CMSIS_CORE_LPC11xx -D__LPC11XX__ -D__REDLIB__ -I"/home/chris/Dropbox/Spring 2018/DDL/Workspace/CMSIS_CORE_LPC11xx/inc" -O0 -fno-common -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m0 -mthumb -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


