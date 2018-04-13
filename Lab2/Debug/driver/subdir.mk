################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../driver/gpio.c \
../driver/timer32.c 

OBJS += \
./driver/gpio.o \
./driver/timer32.o 

C_DEPS += \
./driver/gpio.d \
./driver/timer32.d 


# Each subdirectory must supply rules for building sources it contributes
driver/%.o: ../driver/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -DDEBUG -D__CODE_RED -D__REDLIB__ -I"/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/config" -I"/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis" -I"/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/Debug" -I"/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/driver" -I"/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/src" -O0 -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -Wa,-ahlnds=$(basename $(notdir $@)).asm -mcpu=cortex-m0 -mthumb -D__REDLIB__ -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


