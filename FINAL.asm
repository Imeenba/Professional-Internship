
_set_frequency:

;FINAL.c,6 :: 		void set_frequency(short current_duty_1 )
;FINAL.c,9 :: 		UART1_Write_Text(" ***choix de vitesse  !! *** ");
	MOVLW      ?lstr1_FINAL+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;FINAL.c,10 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;FINAL.c,11 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;FINAL.c,13 :: 		if ( current_duty_1 == 50 )
	MOVF       FARG_set_frequency_current_duty_1+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L_set_frequency0
;FINAL.c,15 :: 		PWM1_Init(3000) ; }
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      166
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
	GOTO       L_set_frequency1
L_set_frequency0:
;FINAL.c,16 :: 		else if ( current_duty_1 ==100 )
	MOVF       FARG_set_frequency_current_duty_1+0, 0
	XORLW      100
	BTFSS      STATUS+0, 2
	GOTO       L_set_frequency2
;FINAL.c,18 :: 		PWM1_Init(6000) ; }
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      83
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
	GOTO       L_set_frequency3
L_set_frequency2:
;FINAL.c,19 :: 		else if ( current_duty_1 == 150 )
	MOVLW      0
	BTFSC      FARG_set_frequency_current_duty_1+0, 7
	MOVLW      255
	MOVWF      R0+0
	MOVLW      0
	XORWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_frequency40
	MOVLW      150
	XORWF      FARG_set_frequency_current_duty_1+0, 0
L__set_frequency40:
	BTFSS      STATUS+0, 2
	GOTO       L_set_frequency4
;FINAL.c,21 :: 		PWM1_Init(8000) ; }
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
	GOTO       L_set_frequency5
L_set_frequency4:
;FINAL.c,22 :: 		else if ( current_duty_1 == 200 )
	MOVLW      0
	BTFSC      FARG_set_frequency_current_duty_1+0, 7
	MOVLW      255
	MOVWF      R0+0
	MOVLW      0
	XORWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_frequency41
	MOVLW      200
	XORWF      FARG_set_frequency_current_duty_1+0, 0
L__set_frequency41:
	BTFSS      STATUS+0, 2
	GOTO       L_set_frequency6
;FINAL.c,24 :: 		PWM1_Init(10000) ; }
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      199
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
	GOTO       L_set_frequency7
L_set_frequency6:
;FINAL.c,26 :: 		else if ( current_duty_1 == 250 )
	MOVLW      0
	BTFSC      FARG_set_frequency_current_duty_1+0, 7
	MOVLW      255
	MOVWF      R0+0
	MOVLW      0
	XORWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_frequency42
	MOVLW      250
	XORWF      FARG_set_frequency_current_duty_1+0, 0
L__set_frequency42:
	BTFSS      STATUS+0, 2
	GOTO       L_set_frequency8
;FINAL.c,28 :: 		PWM1_Init(12000) ; }
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      165
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
L_set_frequency8:
L_set_frequency7:
L_set_frequency5:
L_set_frequency3:
L_set_frequency1:
;FINAL.c,30 :: 		}void main() {
L_end_set_frequency:
	RETURN
; end of _set_frequency

_main:

;FINAL.c,35 :: 		while(1){
L_main9:
;FINAL.c,37 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;FINAL.c,38 :: 		PWM1_Set_Duty(current_duty_1);
	MOVF       _current_duty_1+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;FINAL.c,39 :: 		UART1_Init(9600);
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;FINAL.c,41 :: 		UART1_Write_Text("begin");
	MOVLW      ?lstr2_FINAL+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;FINAL.c,42 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;FINAL.c,43 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;FINAL.c,44 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	DECFSZ     R11+0, 1
	GOTO       L_main11
	NOP
	NOP
;FINAL.c,45 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;FINAL.c,47 :: 		UART1_Write_Text("donner un nombre d'impulsion ");
	MOVLW      ?lstr3_FINAL+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;FINAL.c,48 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;FINAL.c,49 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;FINAL.c,50 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	DECFSZ     R11+0, 1
	GOTO       L_main12
	NOP
	NOP
;FINAL.c,53 :: 		if (UART1_Data_Ready()) {
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main13
;FINAL.c,54 :: 		UART1_Read_Text(uart_buffer, "q", 50);
	MOVLW      _uart_buffer+0
	MOVWF      FARG_UART1_Read_Text_Output+0
	MOVLW      ?lstr4_FINAL+0
	MOVWF      FARG_UART1_Read_Text_Delimiter+0
	MOVLW      50
	MOVWF      FARG_UART1_Read_Text_Attempts+0
	CALL       _UART1_Read_Text+0
;FINAL.c,55 :: 		UART1_Write_Text(uart_buffer);
	MOVLW      _uart_buffer+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;FINAL.c,56 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	DECFSZ     R11+0, 1
	GOTO       L_main14
	NOP
	NOP
;FINAL.c,57 :: 		d = atoi(uart_buffer);
	MOVLW      _uart_buffer+0
	MOVWF      FARG_atoi_s+0
	CALL       _atoi+0
	MOVF       R0+0, 0
	MOVWF      main_d_L0+0
	MOVF       R0+1, 0
	MOVWF      main_d_L0+1
;FINAL.c,58 :: 		memset(uart_buffer, '\0', 50);
	MOVLW      _uart_buffer+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	MOVLW      50
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
;FINAL.c,59 :: 		}
L_main13:
;FINAL.c,61 :: 		UART1_Write_Text("donner la direction (d/g)");
	MOVLW      ?lstr5_FINAL+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;FINAL.c,62 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;FINAL.c,63 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;FINAL.c,64 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main15:
	DECFSZ     R13+0, 1
	GOTO       L_main15
	DECFSZ     R12+0, 1
	GOTO       L_main15
	DECFSZ     R11+0, 1
	GOTO       L_main15
	NOP
	NOP
;FINAL.c,67 :: 		while (1) {
L_main16:
;FINAL.c,68 :: 		uart_rd = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      main_uart_rd_L0+0
;FINAL.c,69 :: 		if (uart_rd == 'd' || uart_rd == 'g') {
	MOVF       R0+0, 0
	XORLW      100
	BTFSC      STATUS+0, 2
	GOTO       L__main38
	MOVF       main_uart_rd_L0+0, 0
	XORLW      103
	BTFSC      STATUS+0, 2
	GOTO       L__main38
	GOTO       L_main20
L__main38:
;FINAL.c,70 :: 		direction = uart_rd;
	MOVF       main_uart_rd_L0+0, 0
	MOVWF      main_direction_L0+0
;FINAL.c,71 :: 		break;
	GOTO       L_main17
;FINAL.c,72 :: 		}
L_main20:
;FINAL.c,73 :: 		}
	GOTO       L_main16
L_main17:
;FINAL.c,76 :: 		if (direction == 'd') {
	MOVF       main_direction_L0+0, 0
	XORLW      100
	BTFSS      STATUS+0, 2
	GOTO       L_main21
;FINAL.c,77 :: 		PORTB.F0 = 1;
	BSF        PORTB+0, 0
;FINAL.c,78 :: 		UART1_Write_Text(" to the right ");
	MOVLW      ?lstr6_FINAL+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;FINAL.c,79 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;FINAL.c,80 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;FINAL.c,81 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main22:
	DECFSZ     R13+0, 1
	GOTO       L_main22
	DECFSZ     R12+0, 1
	GOTO       L_main22
	DECFSZ     R11+0, 1
	GOTO       L_main22
	NOP
	NOP
;FINAL.c,82 :: 		} else {
	GOTO       L_main23
L_main21:
;FINAL.c,83 :: 		PORTB.F0 = 0;
	BCF        PORTB+0, 0
;FINAL.c,84 :: 		UART1_Write_Text(" to the left ");
	MOVLW      ?lstr7_FINAL+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;FINAL.c,85 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;FINAL.c,86 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;FINAL.c,87 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main24:
	DECFSZ     R13+0, 1
	GOTO       L_main24
	DECFSZ     R12+0, 1
	GOTO       L_main24
	DECFSZ     R11+0, 1
	GOTO       L_main24
	NOP
	NOP
;FINAL.c,88 :: 		}
L_main23:
;FINAL.c,90 :: 		UART1_Write_Text("donner la vitesse (1-9)");
	MOVLW      ?lstr8_FINAL+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;FINAL.c,91 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;FINAL.c,92 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;FINAL.c,93 :: 		Delay_ms(500);
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
;FINAL.c,96 :: 		while (1) {
L_main26:
;FINAL.c,97 :: 		uart_rd = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      main_uart_rd_L0+0
;FINAL.c,98 :: 		if (uart_rd >= '1' && uart_rd <= '9') {
	MOVLW      49
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main30
	MOVF       main_uart_rd_L0+0, 0
	SUBLW      57
	BTFSS      STATUS+0, 0
	GOTO       L_main30
L__main37:
;FINAL.c,99 :: 		speed = uart_rd;
	MOVF       main_uart_rd_L0+0, 0
	MOVWF      main_speed_L0+0
;FINAL.c,100 :: 		break;
	GOTO       L_main27
;FINAL.c,101 :: 		}
L_main30:
;FINAL.c,102 :: 		}
	GOTO       L_main26
L_main27:
;FINAL.c,103 :: 		set_frequency(speed);
	MOVF       main_speed_L0+0, 0
	MOVWF      FARG_set_frequency_current_duty_1+0
	CALL       _set_frequency+0
;FINAL.c,105 :: 		if (UART1_Data_Ready())
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main31
;FINAL.c,108 :: 		UART1_Read_Text(uart_buffer, "q",50);
	MOVLW      _uart_buffer+0
	MOVWF      FARG_UART1_Read_Text_Output+0
	MOVLW      ?lstr9_FINAL+0
	MOVWF      FARG_UART1_Read_Text_Delimiter+0
	MOVLW      50
	MOVWF      FARG_UART1_Read_Text_Attempts+0
	CALL       _UART1_Read_Text+0
;FINAL.c,109 :: 		UART1_Write_Text(uart_buffer);
	MOVLW      _uart_buffer+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;FINAL.c,110 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
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
;FINAL.c,111 :: 		d= atoi(uart_buffer) ;
	MOVLW      _uart_buffer+0
	MOVWF      FARG_atoi_s+0
	CALL       _atoi+0
	MOVF       R0+0, 0
	MOVWF      main_d_L0+0
	MOVF       R0+1, 0
	MOVWF      main_d_L0+1
;FINAL.c,112 :: 		memset(uart_buffer ,'\0', 50);
	MOVLW      _uart_buffer+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	MOVLW      50
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
;FINAL.c,114 :: 		for ( o=0 ; o<d; o++ )
	CLRF       main_o_L0+0
	CLRF       main_o_L0+1
L_main33:
	MOVLW      128
	XORWF      main_o_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_d_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main44
	MOVF       main_d_L0+0, 0
	SUBWF      main_o_L0+0, 0
L__main44:
	BTFSC      STATUS+0, 0
	GOTO       L_main34
;FINAL.c,116 :: 		{     PWM1_Start();
	CALL       _PWM1_Start+0
;FINAL.c,117 :: 		Delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main36:
	DECFSZ     R13+0, 1
	GOTO       L_main36
	DECFSZ     R12+0, 1
	GOTO       L_main36
	NOP
	NOP
;FINAL.c,118 :: 		PWM1_Stop();   }
	CALL       _PWM1_Stop+0
;FINAL.c,114 :: 		for ( o=0 ; o<d; o++ )
	INCF       main_o_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_o_L0+1, 1
;FINAL.c,118 :: 		PWM1_Stop();   }
	GOTO       L_main33
L_main34:
;FINAL.c,119 :: 		}
L_main31:
;FINAL.c,121 :: 		}
	GOTO       L_main9
;FINAL.c,122 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
