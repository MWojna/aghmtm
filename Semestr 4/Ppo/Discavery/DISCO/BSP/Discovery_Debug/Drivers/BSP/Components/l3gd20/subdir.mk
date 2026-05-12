################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/BSP/Components/l3gd20/l3gd20.c 

C_DEPS += \
./Drivers/BSP/Components/l3gd20/l3gd20.d 

OBJS += \
./Drivers/BSP/Components/l3gd20/l3gd20.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/Components/l3gd20/%.o Drivers/BSP/Components/l3gd20/%.su Drivers/BSP/Components/l3gd20/%.cyclo: ../Drivers/BSP/Components/l3gd20/%.c Drivers/BSP/Components/l3gd20/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_STM32F429I_DISCO -DSTM32F429xx -c -I"C:/Users/micha/Desktop/aghmtm/Semestr 4/Ppo/Discavery/DISCO/BSP/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"C:/Users/micha/Desktop/aghmtm/Semestr 4/Ppo/Discavery/DISCO/BSP/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/Users/micha/Desktop/aghmtm/Semestr 4/Ppo/Discavery/DISCO/BSP/Drivers/BSP/STM32F429I-Discovery" -I"C:/Users/micha/Desktop/aghmtm/Semestr 4/Ppo/Discavery/DISCO/BSP/Drivers/CMSIS/Include" -I"C:/Users/micha/Desktop/aghmtm/Semestr 4/Ppo/Discavery/DISCO/BSP/Drivers/User" -I"C:/Users/micha/Desktop/aghmtm/Semestr 4/Ppo/Discavery/DISCO/BSP/Drivers" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-BSP-2f-Components-2f-l3gd20

clean-Drivers-2f-BSP-2f-Components-2f-l3gd20:
	-$(RM) ./Drivers/BSP/Components/l3gd20/l3gd20.cyclo ./Drivers/BSP/Components/l3gd20/l3gd20.d ./Drivers/BSP/Components/l3gd20/l3gd20.o ./Drivers/BSP/Components/l3gd20/l3gd20.su

.PHONY: clean-Drivers-2f-BSP-2f-Components-2f-l3gd20

