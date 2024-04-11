CC = arm-none-eabi-gcc
AS = arm-none-eabi-as
LD = arm-none-eabi-ld

CFLAGS = -g -mcpu=cortex-m4 -mthumb -DARMCM4
CFLAGS += -I CMSIS/Core/Include -I Device/ARM/ARMCM4/Include
LDFLAGS = -T gcc_arm.ld -specs=nosys.specs

OBJ_C = main.o system_ARMCM4.o
OBJ_ASM = startup_ARMCM4.o
OBJ = $(OBJ_C) $(OBJ_ASM)

.SECONDARY:

.PHONY: all clean
all: minimal.elf

minimal.elf : $(OBJ)
	$(CC) $(CFLAGS) $(LDFLAGS) $^ -o $@

clean:
	rm -f *.o *.elf *.hex
