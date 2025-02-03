   #include <built_in.h>
                  short current_duty_1 = 100;
char uart_buffer[50];
char uart_rd , v ;

void set_frequency(short current_duty_1 )

{
   UART1_Write_Text(" ***choix de vitesse  !! *** ");
   UART1_Write(13);
   UART1_Write(10);

  if ( current_duty_1 == 50 )
       {
          PWM1_Init(3000) ; }
      else if ( current_duty_1 ==100 )
       {
          PWM1_Init(6000) ; }
       else if ( current_duty_1 == 150 )
       {
          PWM1_Init(8000) ; }
       else if ( current_duty_1 == 200 )
       {
          PWM1_Init(10000) ; }

         else if ( current_duty_1 == 250 )
       {
          PWM1_Init(12000) ; }

  }void main() {
    int d, o;
    char uart_rd, n;
    char direction;
    char speed;
     while(1){
   // PWM1_Init(20000);
      PWM1_Start();
    PWM1_Set_Duty(current_duty_1);
    UART1_Init(9600);

    UART1_Write_Text("begin");
    UART1_Write(13);
    UART1_Write(10);
    Delay_ms(500);
    TRISB = 0x00;

    UART1_Write_Text("donner un nombre d'impulsion ");
    UART1_Write(13);
    UART1_Write(10);
    Delay_ms(500);

    // Read the number of steps (impulsions)
    if (UART1_Data_Ready()) {
        UART1_Read_Text(uart_buffer, "q", 50);
        UART1_Write_Text(uart_buffer);
        Delay_ms(500);
        d = atoi(uart_buffer);
        memset(uart_buffer, '\0', 50);
    }

    UART1_Write_Text("donner la direction (d/g)");
    UART1_Write(13);
    UART1_Write(10);
    Delay_ms(500);

    // Wait for direction input
    while (1) {
        uart_rd = UART1_Read();
        if (uart_rd == 'd' || uart_rd == 'g') {
            direction = uart_rd;
            break;
        }
    }

    // Set the motor direction based on user input
    if (direction == 'd') {
        PORTB.F0 = 1;
        UART1_Write_Text(" to the right ");
        UART1_Write(13);
        UART1_Write(10);
        Delay_ms(500);
    } else {
        PORTB.F0 = 0;
        UART1_Write_Text(" to the left ");
        UART1_Write(13);
        UART1_Write(10);
        Delay_ms(500);
    }

    UART1_Write_Text("donner la vitesse (1-9)");
    UART1_Write(13);
    UART1_Write(10);
    Delay_ms(500);

    // Wait for speed input
    while (1) {
        uart_rd = UART1_Read();
        if (uart_rd >= '1' && uart_rd <= '9') {
            speed = uart_rd;
            break;
        }
    }
    set_frequency(speed);

     if (UART1_Data_Ready())

      {
                UART1_Read_Text(uart_buffer, "q",50);
                UART1_Write_Text(uart_buffer);
                Delay_ms(500);
                d= atoi(uart_buffer) ;
                memset(uart_buffer ,'\0', 50);

for ( o=0 ; o<d; o++ )

          {     PWM1_Start();
                Delay_ms(50);
                PWM1_Stop();   }
                  }

         }
         }