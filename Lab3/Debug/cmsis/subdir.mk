################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../cmsis/core_cm0.c \
../cmsis/system_LPC11xx.c 

OBJS += \
./cmsis/core_cm0.o \
./cmsis/system_LPC11xx.o 

C_DEPS += \
./cmsis/core_cm0.d \
./cmsis/system_LPC11xx.d 


# Each subdirectory must supply rules for building sources it contributes
cmsis/%.o: ../cmsis/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -DDEBUG -D__CODE_RED -DTARGET_SHORTCHIP=lpc13 -DTARGET_CHIP=LPC1343 -D__USE_CMSIS=1 -D__REDLIB__ -I"/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab3/cmsis" -I"/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab3/config" -I"/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab3/driver" -O0 -fno-common -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m3 -mthumb -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


