################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/User/stm32f4xx_it.c \
../Drivers/User/syscalls.c \
../Drivers/User/sysmem.c \
../Drivers/User/system_stm32f4xx.c 

C_DEPS += \
./Drivers/User/stm32f4xx_it.d \
./Drivers/User/syscalls.d \
./Drivers/User/sysmem.d \
./Drivers/User/system_stm32f4xx.d 

OBJS += \
./Drivers/User/stm32f4xx_it.o \
./Drivers/User/syscalls.o \
./Drivers/User/sysmem.o \
./Drivers/User/system_stm32f4xx.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/User/%.o Drivers/User/%.su Drivers/User/%.cyclo: ../Drivers/User/%.c Drivers/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_STM32F429I_DISCO -DSTM32F429xx -c -I"C:/Users/micha/Desktop/git/aghmtm/Semestr 4/Ppo/Discavery/DISCO/BSP/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"C:/Users/micha/Desktop/git/aghmtm/Semestr 4/Ppo/Discavery/DISCO/BSP/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/Users/micha/Desktop/git/aghmtm/Semestr 4/Ppo/Discavery/DISCO/BSP/Drivers/BSP/STM32F429I-Discovery" -I"C:/Users/micha/Desktop/git/aghmtm/Semestr 4/Ppo/Discavery/DISCO/BSP/Drivers/CMSIS/Include" -I"C:/Users/micha/Desktop/git/aghmtm/Semestr 4/Ppo/Discavery/DISCO/BSP/Drivers/User" -I"C:/Users/micha/Desktop/git/aghmtm/Semestr 4/Ppo/Discavery/DISCO/BSP/Drivers" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-User

clean-Drivers-2f-User:
	-$(RM) ./Drivers/User/stm32f4xx_it.cyclo ./Drivers/User/stm32f4xx_it.d ./Drivers/User/stm32f4xx_it.o ./Drivers/User/stm32f4xx_it.su ./Drivers/User/syscalls.cyclo ./Drivers/User/syscalls.d ./Drivers/User/syscalls.o ./Drivers/User/syscalls.su ./Drivers/User/sysmem.cyclo ./Drivers/User/sysmem.d ./Drivers/User/sysmem.o ./Drivers/User/sysmem.su ./Drivers/User/system_stm32f4xx.cyclo ./Drivers/User/system_stm32f4xx.d ./Drivers/User/system_stm32f4xx.o ./Drivers/User/system_stm32f4xx.su

.PHONY: clean-Drivers-2f-User

