#line 1 "F:/Projets/Projet Pic/02 Mikroc Project/motpasàpas/stagepro.c"
short current_duty_1 = 40;
char uart_buffer[50];
char uart_rd , v ;

void set_frequency(char v )

{
 UART1_Write_Text(" ***choix de vitesse  !! *** ");
 UART1_Write(13);
 UART1_Write(10);

 if ( v =='1' )
 {
 PWM1_Init(3000) ; }
 else if ( v =='2' )
 {
 PWM1_Init(6000) ; }
 else if ( v =='3' )
 {
 PWM1_Init(8000) ; }
 else if ( v =='4' )
 {
 PWM1_Init(10000) ; }

 else if ( v =='5' )
 {
 PWM1_Init(12000) ; }

 else if ( v =='6' )
 {
 PWM1_Init(12000) ; }

 else if ( v =='7' )
 {
 PWM1_Init(15000) ; }

 else if ( v =='8' )
 {
 PWM1_Init(17000) ; }
 else if ( v =='9' )
 {
 PWM1_Init(20000) ; }

}
void main()

 {
int d , o ;
char uart_rd , n ;
PWM1_Init(20000) ;
PWM1_Set_Duty(current_duty_1);
UART1_Init(9600);

 UART1_Write_Text("begin");
 UART1_Write(13);
 UART1_Write(10);
 Delay_ms(2000);
 TRISB= 0x00 ;
 UART1_Write_Text("choix de direction ye nada ");
 UART1_Write(13);
 UART1_Write(10);
 Delay_ms(1000);

 while(1) {
 TRISB= 0x00 ;
 uart_rd= UART1_Read() ;
 if (uart_rd == 'd' )
 {

 PORTB.F0 = 1;
 UART1_Write_Text(" to the right ");
 UART1_Write(13);
 UART1_Write(10);
 Delay_ms(4000);
 UART1_Write_Text("donner un nombre d'impulsion  ");
 UART1_Write(13);
 UART1_Write(10);

 Delay_ms(1500);
 uart_rd='0';

if (UART1_Data_Ready())

 { UART1_Read_Text(uart_buffer, "q",50);
 UART1_Write_Text(uart_buffer);
 Delay_ms(500);
 d= StrToInt(uart_buffer) ;


for ( o=0 ; o<d; o++ )

 { PWM1_Start();
 Delay_ms(50);
 PWM1_Stop(); }
 } memset(uart_buffer ,'\0', 50); }

else if ( uart_rd == 'g' )
 {
 PORTB.F0 = 0;
 UART1_Write_Text(" to the left ");
 UART1_Write(13);
 UART1_Write(10);
 Delay_ms(1000);

 UART1_Write_Text("donner un nombre d'impulsion  ");
 UART1_Write(13);
 UART1_Write(10);
 Delay_ms(1000);
 uart_rd='0';


 if (UART1_Data_Ready())

 {
 UART1_Read_Text(uart_buffer, "q",50);
 UART1_Write_Text(uart_buffer);
 Delay_ms(500);
 d= StrToInt(uart_buffer) ;
 memset(uart_buffer ,'\0', 50);

for ( o=0 ; o<d; o++ )

 { PWM1_Start();
 Delay_ms(50);
 PWM1_Stop(); }
 }

 }
}
}
