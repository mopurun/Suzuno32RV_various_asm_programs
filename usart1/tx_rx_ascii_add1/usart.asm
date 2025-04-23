    # a0 = input an ASCII code
    # ret 0 = 0
    
    USART:

    #LI t0,R32_USART1	
	#LI t1,0x00000080
	#LW t2,R32_USART1_STATR(t0)
	#AND t2,t2,t1
	#BNE t1,t2,USART


	LI t0,R32_USART1
	LI t1,0x00002008 #USART enable
	SW t1,R32_USART1_CTLR1(t0)#p292


	SW a0,R32_USART1_DATAR(t0)

	1:

	LI t1,0x000000C0
	LW t2,R32_USART1_STATR(t0)
	AND t2,t2,t1
	BNE t1,t2,1b

    LI a0 , 0   #return 0
	RET
