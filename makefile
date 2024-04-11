CC = arm-none-eabi-gcc
AS = arm-none-eabi-as
LD = arm-none-eabi-ld

CFLAGS = -g -mcpu=cortex-m4 -mthumb -DSTM32F407xx
CFLAGS += -I CMSIS/Include -I CMSIS/Device/ST/STM32F4xx/Include
LDFLAGS = -T STM32F407VGTx_FLASH.ld -specs=nosys.specs

OBJ_C = main.o system_stm32f4xx.o
OBJ_ASM = startup_stm32f407xx.o
OBJ = $(OBJ_C) $(OBJ_ASM)

.SECONDARY:

.PHONY: all clean
all: minimal.elf

minimal.elf : $(OBJ)
	$(CC) $(CFLAGS) $(LDFLAGS) $^ -o $@

clean:
	rm -f *.o *.elf *.hex
