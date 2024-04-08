#include "stm32f407xx.h" 

int a;
int b;

//void SystemInit(void){
//}

void delay(int steps){
	for(int i = 0; i<steps; i++);
}

void main(){
	a = 15;
	b = 11;
	// __STRT(value, register)
	// peripheral clock enable in low power mode register (RCC_AHB1LPENR)
	__STRT((1<<3), (volatile uint32_t *)(0x40023800+0x00000030)); // write in register
	// configure the I/O direction mode (GPIOx_MODER)
	__STRT((1<<24), (volatile uint32_t *)(0x40020C00+0x00000000));
	// output data register (GPIOx_ODR)
	__STRT((1<<12), (volatile uint32_t *)(0x40020C00+0x00000014));
	
	while(1){
		__STRT(0x00, (volatile uint32_t *)(0x40020C14));
		delay(1000000);
		__STRT((1<<12), (volatile uint32_t *)(0x40020C14));
		delay(1000000);
	}
}
