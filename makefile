CC = arm-none-eabi-gcc
AS = arm-none-eabi-as
LD = arm-none-eabi-ld

CFLAGS = -g -mcpu=cortex-m4 -mthumb
CFLAGS += -I CMSIS/Include
LDFLAGS = -T cm4_flash.ld -specs=nosys.specs -Wl,-Map=minimal.map

OBJ_C = main.o system_cm4.o startup_cm4.o
#OBJ_ASM = startup_cm4.o
#OBJ = $(OBJ_C) $(OBJ_ASM)
OBJ = $(OBJ_C)

.SECONDARY:

.PHONY: all clean
all: minimal.elf

minimal.elf : $(OBJ)
	$(CC) $(CFLAGS) $(LDFLAGS) $^ -o $@

clean:
	rm -f *.o *.elf *.hex *.map
