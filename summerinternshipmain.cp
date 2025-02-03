#line 1 "F:/Projets/Projet Pic/02 Mikroc Project/motpasàpas/summerinternshipmain.c"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/built_in.h"
#line 6 "F:/Projets/Projet Pic/02 Mikroc Project/motpasàpas/summerinternshipmain.c"
sbit Axis_X_Pin at RA0_bit;
sbit Axis_Y_Pin at RA1_bit;
sbit Axis_Z_Pin at RA2_bit;


int step_delay = 10;
int steps_per_rev = 200;
float angle_per_step = 1.8;


void step_cw(int axis_pin ,int step_delay) {
 axis_pin = 1;
 Vdelay_ms( step_delay);
 axis_pin = 0;
 Vdelay_ms(step_delay);
}


void step_ccw(int axis_pin , int step_delay) {
 axis_pin =1;
 Delay_ms(10);
 axis_pin = 0;
 Delay_ms(10);
}


void rotate_angle(int axis_pin, float target_angle) {
 int steps_to_move = (int)(target_angle / angle_per_step);
 int i;

 if (steps_to_move > 0) {
 for (i = 0; i < steps_to_move; i++) { <
 step_cw(axis_pin,target_angle);
 }
 } else {
 for (i = 0; i < abs(steps_to_move); i++) {
 step_ccw(axis_pin,target_angle);
 }
 }
}

void main() {
 char command;
 float angle;
 int step_delay = 10;

 UART1_Init(9600);


 while (1) {

 if (UART1_Data_Ready()) {
 command = UART1_Read();


 if (command == 'X' || command == 'x') {
 angle = UART1_Read();
 rotate_angle(Axis_X_Pin, angle);
 } else if (command == 'Y' || command == 'y') {
 angle = UART1_Read();
 rotate_angle(Axis_Y_Pin, angle);
 } else if (command == 'Z' || command == 'z') {
 angle = UART1_Read();
 rotate_angle(Axis_Z_Pin, angle);
 }
 }
 }
}
