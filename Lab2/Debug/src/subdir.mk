################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../src/asm_fib_cm0.s 

C_SRCS += \
../src/cr_startup_lpc11.c \
../src/main.c 

OBJS += \
./src/asm_fib_cm0.o \
./src/cr_startup_lpc11.o \
./src/main.o 

C_DEPS += \
./src/cr_startup_lpc11.d \
./src/main.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.s
	@echo 'Building file: $<'
	@echo 'Invoking: MCU Assembler'
	arm-none-eabi-gcc -c -x assembler-with-cpp -DDEBUG -D__CODE_RED -D__REDLIB__ -g3 -mcpu=cortex-m0 -mthumb -D__REDLIB__ -specs=redlib.specs -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -DDEBUG -D__CODE_RED -D__REDLIB__ -I"/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/config" -I"/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/cmsis" -I"/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/Debug" -I"/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/driver" -I"/home/chris/Dropbox/Spring 2018/DDL/Workspace/Lab2/src" -O0 -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -Wa,-ahlnds=$(basename $(notdir $@)).asm -mcpu=cortex-m0 -mthumb -D__REDLIB__ -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


