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

	

	LI a0,'0'
	JAL x1,USART
	LI a0,'x'
	JAL x1,USART

	LI a0,0xB007C0DE




	.altmacro
	.macro sft1 from=1,to=8
	.print "Info:macro-sft1:\from"
	#andi s\from , s\from , 0
	srli s\from , a0 , ((\from-1)*4)	
	andi s\from , s\from , 0xf
	.if		\to-\from
	sft1	%(\from+1) , \to
	.endif
	.endm
	sft1

	#.altmacro
	.macro reg2ascii from=1,to=8
	.print "Info:macro-reg2ascii:\from"
	li t5,0x9
	bgeu t5,s\from,1f
	addi s\from,s\from,0x7
1:	
	addi s\from,s\from,0x30
	.if		\to-\from
	reg2ascii	%(\from+1) , \to
	.endif
	.endm
	reg2ascii

	ADD a0,zero,s8
	JAL x1,USART
	ADD a0,zero,s7
	JAL x1,USART
	ADD a0,zero,s6
	JAL x1,USART
	ADD a0,zero,s5
	JAL x1,USART
	ADD a0,zero,s4
	JAL x1,USART
	ADD a0,zero,s3
	JAL x1,USART
	ADD a0,zero,s2
	JAL x1,USART
	ADD a0,zero,s1
	JAL x1,USART
	LI a0,'\r'#CR
	JAL x1,USART	
	LI a0,'\n'#LF
	JAL x1,USART

	#goto main loop
	JAL x1,LOOPS


.include "usart.asm"


