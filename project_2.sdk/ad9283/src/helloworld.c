#include <stdio.h>
#include <stdlib.h> // for random number function
#include <unistd.h> // for sleep function
#include "platform.h"
#include "xil_printf.h"
#include "xil_io.h"

#define ADDER_b 0x43C00000
#define REG_0_o 0x0
#define REG_1_o 0x4
#define REG_2_o 0x8
#define REG_3_o 0xC


#define ADDR_GPIO		0x41200000


unsigned char reverse(unsigned char b) {
   b = (b & 0xF0) >> 4 | (b & 0x0F) << 4;
   b = (b & 0xCC) >> 2 | (b & 0x33) << 2;
   b = (b & 0xAA) >> 1 | (b & 0x55) << 1;
   return b;
}

uint32_t yy[4];
uint8_t *datas_adc[300];

int main()
{
    init_platform();
    xil_printf("\nps7_uart_1 @ 115200 baud\n\n\r");


    Xil_Out32(ADDER_b + REG_0_o, 1);


	while(1)
	{
	    //yy[0] = Xil_In32(ADDER_b + REG_0_o);
	    //yy[1] = Xil_In32(ADDER_b + REG_1_o);
	    yy[2] = Xil_In32(ADDER_b + REG_2_o);
	    yy[3] = Xil_In32(ADDER_b + REG_3_o);

	    for(uint16_t x = 0; x < 300; x++)
	    {
	    	datas_adc[x] = (uint8_t*)Xil_In32(ADDER_b + REG_3_o);

	    }

	    asm("nop");
	    //sleep(2);
	}
}
