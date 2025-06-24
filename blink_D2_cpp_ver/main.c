
#define register32(address) *((volatile unsigned long*)(address))
#define R32_RCC_APB2PCENR register32(0x40021018)
#define R32_GPIOA_CFGLR register32(0x40010800)
#define R32_GPIOA_OUTDR register32(0x4001080C)



int main(void);
void delay(int value);

__attribute__ ((section("vector_table")))
void (*const vector_table2[])(void) = {
    (void(*)(void))0x20000137,
    (void(*)(void))0x70010113,
    (void(*)(void))0x200001b7,
    (void(*)(void))0x50018193
};


int main(void){
    R32_RCC_APB2PCENR = 0x7D;
    R32_GPIOA_CFGLR = 0x44344444;
    while(1){
        R32_GPIOA_OUTDR = 0x00;
        delay(100000);
        R32_GPIOA_OUTDR = 0x20;
        delay(100000);
    }

    return 0;
}

void delay(int value){
    for(int i = 0; i < value ; i++){
        asm volatile("nop");
    }
}