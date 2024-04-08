objs = main.o startup_stm32f407xx.o system_stm32f4xx.o
minimal.elf : $(objs)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -TSTM32F407VGTx_FLASH.ld -specs=nosys.specs main.o startup_stm32f407xx.o system_stm32f4xx.o -o minimal.elf

startup_stm32f407xx.o : startup_stm32f407xx.s
	arm-none-eabi-gcc -c -mcpu=cortex-m4 -mthumb startup_stm32f407xx.s -o startup_stm32f407xx.o
	
main.o : main.c
	arm-none-eabi-gcc -c -g -I CMSIS/Include -I CMSIS/Device/ST/STM32F4xx/Include -DSTM32F407xx -mcpu=cortex-m4 -mthumb main.c -o main.o

system_stm32f4xx.o : system_stm32f4xx.c
	arm-none-eabi-gcc -c -g -I CMSIS/Include -I CMSIS/Device/ST/STM32F4xx/Include -DSTM32F407xx -mcpu=cortex-m4 -mthumb system_stm32f4xx.c -o system_stm32f4xx.o

clean:
	rm -f *.o *.elf
