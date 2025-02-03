
_set_frequency:

;summerinternship.c,6 :: 		void set_frequency(char v )
;summerinternship.c,9 :: 		UART1_Write_Text(" ***choix de vitesse  !! *** ");
	MOVLW      ?lstr1_summerinternship+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;summerinternship.c,10 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;summerinternship.c,11 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;summerinternship.c,13 :: 		if ( v =='1' )
	MOVF       FARG_set_frequency_v+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L_set_frequency0
;summerinternship.c,15 :: 		PWM1_Init(3000) ; }
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      166
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
	GOTO       L_set_frequency1
L_set_frequency0:
;summerinternship.c,16 :: 		else if ( v =='2' )
	MOVF       FARG_set_frequency_v+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L_set_frequency2
;summerinternship.c,18 :: 		PWM1_Init(6000) ; }
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      83
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
	GOTO       L_set_frequency3
L_set_frequency2:
;summerinternship.c,19 :: 		else if ( v =='3' )
	MOVF       FARG_set_frequency_v+0, 0
	XORLW      51
	BTFSS      STATUS+0, 2
	GOTO       L_set_frequency4
;summerinternship.c,21 :: 		PWM1_Init(8000) ; }
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
	GOTO       L_set_frequency5
L_set_frequency4:
;summerinternship.c,22 :: 		else if ( v =='4' )
	MOVF       FARG_set_frequency_v+0, 0
	XORLW      52
	BTFSS      STATUS+0, 2
	GOTO       L_set_frequency6
;summerinternship.c,24 :: 		PWM1_Init(10000) ; }
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      199
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
	GOTO       L_set_frequency7
L_set_frequency6:
;summerinternship.c,26 :: 		else if ( v =='5' )
	MOVF       FARG_set_frequency_v+0, 0
	XORLW      53
	BTFSS      STATUS+0, 2
	GOTO       L_set_frequency8
;summerinternship.c,28 :: 		PWM1_Init(12000) ; }
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      165
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
	GOTO       L_set_frequency9
L_set_frequency8:
;summerinternship.c,30 :: 		else if ( v =='6' )
	MOVF       FARG_set_frequency_v+0, 0
	XORLW      54
	BTFSS      STATUS+0, 2
	GOTO       L_set_frequency10
;summerinternship.c,32 :: 		PWM1_Init(12000) ; }
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      165
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
	GOTO       L_set_frequency11
L_set_frequency10:
;summerinternship.c,34 :: 		else if ( v =='7' )
	MOVF       FARG_set_frequency_v+0, 0
	XORLW      55
	BTFSS      STATUS+0, 2
	GOTO       L_set_frequency12
;summerinternship.c,36 :: 		PWM1_Init(15000) ; }
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      132
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
	GOTO       L_set_frequency13
L_set_frequency12:
;summerinternship.c,38 :: 		else if ( v =='8' )
	MOVF       FARG_set_frequency_v+0, 0
	XORLW      56
	BTFSS      STATUS+0, 2
	GOTO       L_set_frequency14
;summerinternship.c,40 :: 		{  PWM1_Init(17000) ; }
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      116
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
	GOTO       L_set_frequency15
L_set_frequency14:
;summerinternship.c,41 :: 		else if ( v =='9' )
	MOVF       FARG_set_frequency_v+0, 0
	XORLW      57
	BTFSS      STATUS+0, 2
	GOTO       L_set_frequency16
;summerinternship.c,43 :: 		PWM1_Init(20000) ; }
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      99
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
L_set_frequency16:
L_set_frequency15:
L_set_frequency13:
L_set_frequency11:
L_set_frequency9:
L_set_frequency7:
L_set_frequency5:
L_set_frequency3:
L_set_frequency1:
;summerinternship.c,45 :: 		}
L_end_set_frequency:
	RETURN
; end of _set_frequency

_main:

;summerinternship.c,46 :: 		void main()
;summerinternship.c,51 :: 		PWM1_Init(20000) ;
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      99
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;summerinternship.c,52 :: 		PWM1_Set_Duty(current_duty_1);
	MOVF       _current_duty_1+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;summerinternship.c,53 :: 		UART1_Init(9600);
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;summerinternship.c,55 :: 		UART1_Write_Text("begin");
	MOVLW      ?lstr2_summerinternship+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;summerinternship.c,56 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;summerinternship.c,57 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;summerinternship.c,58 :: 		Delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main17:
	DECFSZ     R13+0, 1
	GOTO       L_main17
	DECFSZ     R12+0, 1
	GOTO       L_main17
	DECFSZ     R11+0, 1
	GOTO       L_main17
	NOP
;summerinternship.c,59 :: 		TRISB= 0x00 ;
	CLRF       TRISB+0
;summerinternship.c,60 :: 		UART1_Write_Text("choix de direction");
	MOVLW      ?lstr3_summerinternship+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;summerinternship.c,61 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;summerinternship.c,62 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;summerinternship.c,63 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
	DECFSZ     R11+0, 1
	GOTO       L_main18
	NOP
	NOP
;summerinternship.c,65 :: 		while(1) {
L_main19:
;summerinternship.c,66 :: 		TRISB= 0x00 ;
	CLRF       TRISB+0
;summerinternship.c,67 :: 		uart_rd= UART1_Read() ;
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      main_uart_rd_L0+0
;summerinternship.c,68 :: 		if (uart_rd == 'd' )
	MOVF       R0+0, 0
	XORLW      100
	BTFSS      STATUS+0, 2
	GOTO       L_main21
;summerinternship.c,71 :: 		PORTB.F0 = 1;
	BSF        PORTB+0, 0
;summerinternship.c,72 :: 		UART1_Write_Text(" to the right ");
	MOVLW      ?lstr4_summerinternship+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;summerinternship.c,73 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;summerinternship.c,74 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;summerinternship.c,75 :: 		Delay_ms(4000);
	MOVLW      41
	MOVWF      R11+0
	MOVLW      150
	MOVWF      R12+0
	MOVLW      127
	MOVWF      R13+0
L_main22:
	DECFSZ     R13+0, 1
	GOTO       L_main22
	DECFSZ     R12+0, 1
	GOTO       L_main22
	DECFSZ     R11+0, 1
	GOTO       L_main22
;summerinternship.c,76 :: 		UART1_Write_Text("donner un nombre d'impulsion  ");
	MOVLW      ?lstr5_summerinternship+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;summerinternship.c,77 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;summerinternship.c,78 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;summerinternship.c,80 :: 		Delay_ms(1500);
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_main23:
	DECFSZ     R13+0, 1
	GOTO       L_main23
	DECFSZ     R12+0, 1
	GOTO       L_main23
	DECFSZ     R11+0, 1
	GOTO       L_main23
	NOP
	NOP
;summerinternship.c,81 :: 		uart_rd='0';
	MOVLW      48
	MOVWF      main_uart_rd_L0+0
;summerinternship.c,83 :: 		if (UART1_Data_Ready())
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main24
;summerinternship.c,85 :: 		{        UART1_Read_Text(uart_buffer, "q",50);
	MOVLW      _uart_buffer+0
	MOVWF      FARG_UART1_Read_Text_Output+0
	MOVLW      ?lstr6_summerinternship+0
	MOVWF      FARG_UART1_Read_Text_Delimiter+0
	MOVLW      50
	MOVWF      FARG_UART1_Read_Text_Attempts+0
	CALL       _UART1_Read_Text+0
;summerinternship.c,86 :: 		UART1_Write_Text(uart_buffer);
	MOVLW      _uart_buffer+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;summerinternship.c,87 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main25:
	DECFSZ     R13+0, 1
	GOTO       L_main25
	DECFSZ     R12+0, 1
	GOTO       L_main25
	DECFSZ     R11+0, 1
	GOTO       L_main25
	NOP
	NOP
;summerinternship.c,88 :: 		d= atoi(uart_buffer) ;
	MOVLW      _uart_buffer+0
	MOVWF      FARG_atoi_s+0
	CALL       _atoi+0
	MOVF       R0+0, 0
	MOVWF      main_d_L0+0
	MOVF       R0+1, 0
	MOVWF      main_d_L0+1
;summerinternship.c,91 :: 		for ( o=0 ; o<d; o++ )
	CLRF       main_o_L0+0
	CLRF       main_o_L0+1
L_main26:
	MOVLW      128
	XORWF      main_o_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_d_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main42
	MOVF       main_d_L0+0, 0
	SUBWF      main_o_L0+0, 0
L__main42:
	BTFSC      STATUS+0, 0
	GOTO       L_main27
;summerinternship.c,93 :: 		{     PWM1_Start();
	CALL       _PWM1_Start+0
;summerinternship.c,94 :: 		Delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main29:
	DECFSZ     R13+0, 1
	GOTO       L_main29
	DECFSZ     R12+0, 1
	GOTO       L_main29
	NOP
	NOP
;summerinternship.c,95 :: 		PWM1_Stop();   }
	CALL       _PWM1_Stop+0
;summerinternship.c,91 :: 		for ( o=0 ; o<d; o++ )
	INCF       main_o_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_o_L0+1, 1
;summerinternship.c,95 :: 		PWM1_Stop();   }
	GOTO       L_main26
L_main27:
;summerinternship.c,96 :: 		}     memset(uart_buffer ,'\0', 50);  }
L_main24:
	MOVLW      _uart_buffer+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	MOVLW      50
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
	GOTO       L_main30
L_main21:
;summerinternship.c,98 :: 		else if ( uart_rd == 'g' )
	MOVF       main_uart_rd_L0+0, 0
	XORLW      103
	BTFSS      STATUS+0, 2
	GOTO       L_main31
;summerinternship.c,100 :: 		PORTB.F0 = 0;
	BCF        PORTB+0, 0
;summerinternship.c,101 :: 		UART1_Write_Text(" to the left ");
	MOVLW      ?lstr7_summerinternship+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;summerinternship.c,102 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;summerinternship.c,103 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;summerinternship.c,104 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main32:
	DECFSZ     R13+0, 1
	GOTO       L_main32
	DECFSZ     R12+0, 1
	GOTO       L_main32
	DECFSZ     R11+0, 1
	GOTO       L_main32
	NOP
	NOP
;summerinternship.c,106 :: 		UART1_Write_Text("donner un nombre d'impulsion  ");
	MOVLW      ?lstr8_summerinternship+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;summerinternship.c,107 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;summerinternship.c,108 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;summerinternship.c,109 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main33:
	DECFSZ     R13+0, 1
	GOTO       L_main33
	DECFSZ     R12+0, 1
	GOTO       L_main33
	DECFSZ     R11+0, 1
	GOTO       L_main33
	NOP
	NOP
;summerinternship.c,110 :: 		uart_rd='0';
	MOVLW      48
	MOVWF      main_uart_rd_L0+0
;summerinternship.c,113 :: 		if (UART1_Data_Ready())
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main34
;summerinternship.c,116 :: 		UART1_Read_Text(uart_buffer, "q",50);
	MOVLW      _uart_buffer+0
	MOVWF      FARG_UART1_Read_Text_Output+0
	MOVLW      ?lstr9_summerinternship+0
	MOVWF      FARG_UART1_Read_Text_Delimiter+0
	MOVLW      50
	MOVWF      FARG_UART1_Read_Text_Attempts+0
	CALL       _UART1_Read_Text+0
;summerinternship.c,117 :: 		UART1_Write_Text(uart_buffer);
	MOVLW      _uart_buffer+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;summerinternship.c,118 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main35:
	DECFSZ     R13+0, 1
	GOTO       L_main35
	DECFSZ     R12+0, 1
	GOTO       L_main35
	DECFSZ     R11+0, 1
	GOTO       L_main35
	NOP
	NOP
;summerinternship.c,119 :: 		d= atoi(uart_buffer) ;
	MOVLW      _uart_buffer+0
	MOVWF      FARG_atoi_s+0
	CALL       _atoi+0
	MOVF       R0+0, 0
	MOVWF      main_d_L0+0
	MOVF       R0+1, 0
	MOVWF      main_d_L0+1
;summerinternship.c,120 :: 		memset(uart_buffer ,'\0', 50);
	MOVLW      _uart_buffer+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	MOVLW      50
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
;summerinternship.c,122 :: 		for ( o=0 ; o<d; o++ )
	CLRF       main_o_L0+0
	CLRF       main_o_L0+1
L_main36:
	MOVLW      128
	XORWF      main_o_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_d_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main43
	MOVF       main_d_L0+0, 0
	SUBWF      main_o_L0+0, 0
L__main43:
	BTFSC      STATUS+0, 0
	GOTO       L_main37
;summerinternship.c,124 :: 		{     PWM1_Start();
	CALL       _PWM1_Start+0
;summerinternship.c,125 :: 		Delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main39:
	DECFSZ     R13+0, 1
	GOTO       L_main39
	DECFSZ     R12+0, 1
	GOTO       L_main39
	NOP
	NOP
;summerinternship.c,126 :: 		PWM1_Stop();   }
	CALL       _PWM1_Stop+0
;summerinternship.c,122 :: 		for ( o=0 ; o<d; o++ )
	INCF       main_o_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_o_L0+1, 1
;summerinternship.c,126 :: 		PWM1_Stop();   }
	GOTO       L_main36
L_main37:
;summerinternship.c,127 :: 		}
L_main34:
;summerinternship.c,129 :: 		}
L_main31:
L_main30:
;summerinternship.c,130 :: 		}
	GOTO       L_main19
;summerinternship.c,131 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
