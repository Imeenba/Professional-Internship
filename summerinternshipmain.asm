
_step_cw:

;summerinternshipmain.c,16 :: 		void step_cw(int axis_pin ,int  step_delay) {
;summerinternshipmain.c,17 :: 		axis_pin = 1;
	MOVLW      1
	MOVWF      FARG_step_cw_axis_pin+0
	MOVLW      0
	MOVWF      FARG_step_cw_axis_pin+1
;summerinternshipmain.c,18 :: 		Vdelay_ms( step_delay);
	MOVF       FARG_step_cw_step_delay+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_step_cw_step_delay+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;summerinternshipmain.c,19 :: 		axis_pin = 0;
	CLRF       FARG_step_cw_axis_pin+0
	CLRF       FARG_step_cw_axis_pin+1
;summerinternshipmain.c,20 :: 		Vdelay_ms(step_delay);
	MOVF       FARG_step_cw_step_delay+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_step_cw_step_delay+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;summerinternshipmain.c,21 :: 		}
L_end_step_cw:
	RETURN
; end of _step_cw

_step_ccw:

;summerinternshipmain.c,24 :: 		void step_ccw(int axis_pin , int step_delay) {
;summerinternshipmain.c,25 :: 		axis_pin =1;
	MOVLW      1
	MOVWF      FARG_step_ccw_axis_pin+0
	MOVLW      0
	MOVWF      FARG_step_ccw_axis_pin+1
;summerinternshipmain.c,26 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_step_ccw0:
	DECFSZ     R13+0, 1
	GOTO       L_step_ccw0
	DECFSZ     R12+0, 1
	GOTO       L_step_ccw0
	NOP
;summerinternshipmain.c,27 :: 		axis_pin = 0;
	CLRF       FARG_step_ccw_axis_pin+0
	CLRF       FARG_step_ccw_axis_pin+1
;summerinternshipmain.c,28 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_step_ccw1:
	DECFSZ     R13+0, 1
	GOTO       L_step_ccw1
	DECFSZ     R12+0, 1
	GOTO       L_step_ccw1
	NOP
;summerinternshipmain.c,29 :: 		}
L_end_step_ccw:
	RETURN
; end of _step_ccw

_rotate_angle:

;summerinternshipmain.c,32 :: 		void rotate_angle(int axis_pin, float target_angle) {
;summerinternshipmain.c,33 :: 		int steps_to_move = (int)(target_angle / angle_per_step);
	MOVF       _angle_per_step+0, 0
	MOVWF      R4+0
	MOVF       _angle_per_step+1, 0
	MOVWF      R4+1
	MOVF       _angle_per_step+2, 0
	MOVWF      R4+2
	MOVF       _angle_per_step+3, 0
	MOVWF      R4+3
	MOVF       FARG_rotate_angle_target_angle+0, 0
	MOVWF      R0+0
	MOVF       FARG_rotate_angle_target_angle+1, 0
	MOVWF      R0+1
	MOVF       FARG_rotate_angle_target_angle+2, 0
	MOVWF      R0+2
	MOVF       FARG_rotate_angle_target_angle+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_FP+0
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      rotate_angle_steps_to_move_L0+0
	MOVF       R0+1, 0
	MOVWF      rotate_angle_steps_to_move_L0+1
;summerinternshipmain.c,36 :: 		if (steps_to_move > 0) {
	MOVLW      128
	MOVWF      R2+0
	MOVLW      128
	XORWF      R0+1, 0
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__rotate_angle30
	MOVF       R0+0, 0
	SUBLW      0
L__rotate_angle30:
	BTFSC      STATUS+0, 0
	GOTO       L_rotate_angle2
;summerinternshipmain.c,37 :: 		for (i = 0; i < steps_to_move; i++) {
	CLRF       rotate_angle_i_L0+0
	CLRF       rotate_angle_i_L0+1
L_rotate_angle3:
	MOVLW      128
	XORWF      rotate_angle_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      rotate_angle_steps_to_move_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__rotate_angle31
	MOVF       rotate_angle_steps_to_move_L0+0, 0
	SUBWF      rotate_angle_i_L0+0, 0
L__rotate_angle31:
	BTFSC      STATUS+0, 0
	GOTO       L_rotate_angle4
;summerinternshipmain.c,38 :: 		step_cw(axis_pin,target_angle);
	MOVF       FARG_rotate_angle_axis_pin+0, 0
	MOVWF      FARG_step_cw_axis_pin+0
	MOVF       FARG_rotate_angle_axis_pin+1, 0
	MOVWF      FARG_step_cw_axis_pin+1
	MOVF       FARG_rotate_angle_target_angle+0, 0
	MOVWF      R0+0
	MOVF       FARG_rotate_angle_target_angle+1, 0
	MOVWF      R0+1
	MOVF       FARG_rotate_angle_target_angle+2, 0
	MOVWF      R0+2
	MOVF       FARG_rotate_angle_target_angle+3, 0
	MOVWF      R0+3
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      FARG_step_cw_step_delay+0
	MOVF       R0+1, 0
	MOVWF      FARG_step_cw_step_delay+1
	CALL       _step_cw+0
;summerinternshipmain.c,37 :: 		for (i = 0; i < steps_to_move; i++) {
	INCF       rotate_angle_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       rotate_angle_i_L0+1, 1
;summerinternshipmain.c,39 :: 		}
	GOTO       L_rotate_angle3
L_rotate_angle4:
;summerinternshipmain.c,40 :: 		} else {
	GOTO       L_rotate_angle6
L_rotate_angle2:
;summerinternshipmain.c,41 :: 		for (i = 0; i < abs(steps_to_move); i++) {
	CLRF       rotate_angle_i_L0+0
	CLRF       rotate_angle_i_L0+1
L_rotate_angle7:
	MOVF       rotate_angle_steps_to_move_L0+0, 0
	MOVWF      FARG_abs_a+0
	MOVF       rotate_angle_steps_to_move_L0+1, 0
	MOVWF      FARG_abs_a+1
	CALL       _abs+0
	MOVLW      128
	XORWF      rotate_angle_i_L0+1, 0
	MOVWF      R2+0
	MOVLW      128
	XORWF      R0+1, 0
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__rotate_angle32
	MOVF       R0+0, 0
	SUBWF      rotate_angle_i_L0+0, 0
L__rotate_angle32:
	BTFSC      STATUS+0, 0
	GOTO       L_rotate_angle8
;summerinternshipmain.c,42 :: 		step_ccw(axis_pin,target_angle);
	MOVF       FARG_rotate_angle_axis_pin+0, 0
	MOVWF      FARG_step_ccw_axis_pin+0
	MOVF       FARG_rotate_angle_axis_pin+1, 0
	MOVWF      FARG_step_ccw_axis_pin+1
	MOVF       FARG_rotate_angle_target_angle+0, 0
	MOVWF      R0+0
	MOVF       FARG_rotate_angle_target_angle+1, 0
	MOVWF      R0+1
	MOVF       FARG_rotate_angle_target_angle+2, 0
	MOVWF      R0+2
	MOVF       FARG_rotate_angle_target_angle+3, 0
	MOVWF      R0+3
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      FARG_step_ccw_step_delay+0
	MOVF       R0+1, 0
	MOVWF      FARG_step_ccw_step_delay+1
	CALL       _step_ccw+0
;summerinternshipmain.c,41 :: 		for (i = 0; i < abs(steps_to_move); i++) {
	INCF       rotate_angle_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       rotate_angle_i_L0+1, 1
;summerinternshipmain.c,43 :: 		}
	GOTO       L_rotate_angle7
L_rotate_angle8:
;summerinternshipmain.c,44 :: 		}
L_rotate_angle6:
;summerinternshipmain.c,45 :: 		}
L_end_rotate_angle:
	RETURN
; end of _rotate_angle

_main:

;summerinternshipmain.c,47 :: 		void main() {
;summerinternshipmain.c,50 :: 		int step_delay = 10;
;summerinternshipmain.c,52 :: 		UART1_Init(9600);
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;summerinternshipmain.c,55 :: 		while (1) {
L_main10:
;summerinternshipmain.c,57 :: 		if (UART1_Data_Ready()) {
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main12
;summerinternshipmain.c,58 :: 		command = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      main_command_L0+0
;summerinternshipmain.c,61 :: 		if (command == 'X' || command == 'x') {
	MOVF       R0+0, 0
	XORLW      88
	BTFSC      STATUS+0, 2
	GOTO       L__main26
	MOVF       main_command_L0+0, 0
	XORLW      120
	BTFSC      STATUS+0, 2
	GOTO       L__main26
	GOTO       L_main15
L__main26:
;summerinternshipmain.c,62 :: 		angle = UART1_Read();
	CALL       _UART1_Read+0
	CALL       _byte2double+0
;summerinternshipmain.c,63 :: 		rotate_angle(Axis_X_Pin, angle);
	MOVLW      0
	BTFSC      RA0_bit+0, BitPos(RA0_bit+0)
	MOVLW      1
	MOVWF      FARG_rotate_angle_axis_pin+0
	CLRF       FARG_rotate_angle_axis_pin+1
	MOVF       R0+0, 0
	MOVWF      FARG_rotate_angle_target_angle+0
	MOVF       R0+1, 0
	MOVWF      FARG_rotate_angle_target_angle+1
	MOVF       R0+2, 0
	MOVWF      FARG_rotate_angle_target_angle+2
	MOVF       R0+3, 0
	MOVWF      FARG_rotate_angle_target_angle+3
	CALL       _rotate_angle+0
;summerinternshipmain.c,64 :: 		} else if (command == 'Y' || command == 'y') {
	GOTO       L_main16
L_main15:
	MOVF       main_command_L0+0, 0
	XORLW      89
	BTFSC      STATUS+0, 2
	GOTO       L__main25
	MOVF       main_command_L0+0, 0
	XORLW      121
	BTFSC      STATUS+0, 2
	GOTO       L__main25
	GOTO       L_main19
L__main25:
;summerinternshipmain.c,65 :: 		angle = UART1_Read();
	CALL       _UART1_Read+0
	CALL       _byte2double+0
;summerinternshipmain.c,66 :: 		rotate_angle(Axis_Y_Pin, angle);
	MOVLW      0
	BTFSC      RA1_bit+0, BitPos(RA1_bit+0)
	MOVLW      1
	MOVWF      FARG_rotate_angle_axis_pin+0
	CLRF       FARG_rotate_angle_axis_pin+1
	MOVF       R0+0, 0
	MOVWF      FARG_rotate_angle_target_angle+0
	MOVF       R0+1, 0
	MOVWF      FARG_rotate_angle_target_angle+1
	MOVF       R0+2, 0
	MOVWF      FARG_rotate_angle_target_angle+2
	MOVF       R0+3, 0
	MOVWF      FARG_rotate_angle_target_angle+3
	CALL       _rotate_angle+0
;summerinternshipmain.c,67 :: 		} else if (command == 'Z' || command == 'z') {
	GOTO       L_main20
L_main19:
	MOVF       main_command_L0+0, 0
	XORLW      90
	BTFSC      STATUS+0, 2
	GOTO       L__main24
	MOVF       main_command_L0+0, 0
	XORLW      122
	BTFSC      STATUS+0, 2
	GOTO       L__main24
	GOTO       L_main23
L__main24:
;summerinternshipmain.c,68 :: 		angle = UART1_Read();
	CALL       _UART1_Read+0
	CALL       _byte2double+0
;summerinternshipmain.c,69 :: 		rotate_angle(Axis_Z_Pin, angle);
	MOVLW      0
	BTFSC      RA2_bit+0, BitPos(RA2_bit+0)
	MOVLW      1
	MOVWF      FARG_rotate_angle_axis_pin+0
	CLRF       FARG_rotate_angle_axis_pin+1
	MOVF       R0+0, 0
	MOVWF      FARG_rotate_angle_target_angle+0
	MOVF       R0+1, 0
	MOVWF      FARG_rotate_angle_target_angle+1
	MOVF       R0+2, 0
	MOVWF      FARG_rotate_angle_target_angle+2
	MOVF       R0+3, 0
	MOVWF      FARG_rotate_angle_target_angle+3
	CALL       _rotate_angle+0
;summerinternshipmain.c,70 :: 		}
L_main23:
L_main20:
L_main16:
;summerinternshipmain.c,71 :: 		}
L_main12:
;summerinternshipmain.c,72 :: 		}
	GOTO       L_main10
;summerinternshipmain.c,73 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
