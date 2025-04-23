.equ R32_RCC_APB2PCENR, 0x40021018
.equ R32_GPIOA_CFGHR, 0x40010804
.equ R32_GPIOB_CFGHR, 0x40011004
.equ R32_AFIO_PCFR1, 0x40010004
.equ R32_USART1, 0x40013800 #p172
.equ R32_USART1_STATR, 0x00
.equ R32_USART1_DATAR, 0x04
.equ R32_USART1_BRR, 0x08
.equ R32_USART1_CTLR1, 0x0C


main:
	LUI sp,0x20000
	ADDI sp,sp,0x700
	LUI gp,0x20000
	ADDI gp,gp,0x500

	

	LI t0,R32_RCC_APB2PCENR
	LI t1,0x00004005 #p17,p23
	SW t1,0(t0)	

	LI t0,R32_GPIOA_CFGHR
	LI t1,0x444444B4 #
	SW t1,0(t0)	

	LI t0,R32_AFIO_PCFR1
	LI t1,0 #Ux
	SW t1,0(t0)	

	LI t0,R32_USART1
	#115200bps
	LI t1,0x0045 
	SW t1,R32_USART1_BRR(t0)


	LI t0,R32_USART1
	SW zero,R32_USART1_DATAR(t0)



	LOOPS:

	LI a0,'m'
	JAL x1,USART
	LI a0,'o'
	JAL x1,USART
	LI a0,'p'
	JAL x1,USART
	LI a0,'u'
	JAL x1,USART
	LI a0,'r'
	JAL x1,USART
	LI a0,'u'
	JAL x1,USART
	LI a0,'n'
	JAL x1,USART
	LI a0,'_'
	JAL x1,USART
	LI a0,'e'
	JAL x1,USART
	LI a0,'l'
	JAL x1,USART
	LI a0,'e'
	JAL x1,USART
	LI a0,'c'
	JAL x1,USART
	LI a0,0x0d
	JAL x1,USART
	LI a0,0x0a
	JAL x1,USART




	#set ctlr1 receive
	LI t0,R32_USART1
	LI t1,0x00002004 #USART enable
	SW t1,R32_USART1_CTLR1(t0)

	#clear data 
	SW zero,R32_USART1_DATAR(t0)

	# receive check

	#LI t0,R32_USART1	
	LI t1,0x00000020
	1:	
	LW t2,R32_USART1_STATR(t0)
	AND t2,t2,t1
	BNE t1,t2,1b

	#receive data
	LI t0,R32_USART1 
	LW a0,R32_USART1_DATAR(t0)

	ADDI a0,a0,0x01 # ascii add 1 

	# unset received flag
	LW t2,R32_USART1_STATR(t0)	
	XOR t2,t1,t2 #unset
	SW t2,R32_USART1_STATR(t0)


	JAL x1,USART

2:

	LI a0,0x0d #CR
	JAL x1,USART
	LI a0,0x0a #LF
	JAL x1,USART

	#goto main loop
	JAL x1,LOOPS


.include "usart.asm"


