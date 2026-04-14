################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/BSP/Components/i3g4250d/i3g4250d.c 

C_DEPS += \
./Drivers/BSP/Components/i3g4250d/i3g4250d.d 

OBJS += \
./Drivers/BSP/Components/i3g4250d/i3g4250d.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/Components/i3g4250d/%.o Drivers/BSP/Components/i3g4250d/%.su Drivers/BSP/Components/i3g4250d/%.cyclo: ../Drivers/BSP/Components/i3g4250d/%.c Drivers/BSP/Components/i3g4250d/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_STM32F429I_DISCO -DSTM32F429xx -c -I"C:/Users/micha/Desktop/git/aghmtm/Semestr 4/Ppo/Discavery/DISCO/BSP/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"C:/Users/micha/Desktop/git/aghmtm/Semestr 4/Ppo/Discavery/DISCO/BSP/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/Users/micha/Desktop/git/aghmtm/Semestr 4/Ppo/Discavery/DISCO/BSP/Drivers/BSP/STM32F429I-Discovery" -I"C:/Users/micha/Desktop/git/aghmtm/Semestr 4/Ppo/Discavery/DISCO/BSP/Drivers/CMSIS/Include" -I"C:/Users/micha/Desktop/git/aghmtm/Semestr 4/Ppo/Discavery/DISCO/BSP/Drivers/User" -I"C:/Users/micha/Desktop/git/aghmtm/Semestr 4/Ppo/Discavery/DISCO/BSP/Drivers" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-BSP-2f-Components-2f-i3g4250d

clean-Drivers-2f-BSP-2f-Components-2f-i3g4250d:
	-$(RM) ./Drivers/BSP/Components/i3g4250d/i3g4250d.cyclo ./Drivers/BSP/Components/i3g4250d/i3g4250d.d ./Drivers/BSP/Components/i3g4250d/i3g4250d.o ./Drivers/BSP/Components/i3g4250d/i3g4250d.su

.PHONY: clean-Drivers-2f-BSP-2f-Components-2f-i3g4250d

