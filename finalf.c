  #include <built_in.h>
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
}void main() {
    int d, o;
    char uart_rd, n;
    char direction;
    char speed;

    PWM1_Init(20000);
    PWM1_Set_Duty(current_duty_1);
    UART1_Init(9600);

    while (1) { // Boucle infinie
        UART1_Write_Text("begin");
        UART1_Write(13);
        UART1_Write(10);
        Delay_ms(2000);
        TRISB = 0x00;

        UART1_Write_Text("donner un nombre d'impulsion ");
        UART1_Write(13);
        UART1_Write(10);
        Delay_ms(1500);
        uart_rd='0';

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
        Delay_ms(1000);

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
            Delay_ms(4000);
        } else {
            PORTB.F0 = 0;
            UART1_Write_Text(" to the left ");
            UART1_Write(13);
            UART1_Write(10);
            Delay_ms(1000);
        }

        UART1_Write_Text("donner la vitesse (1-9)");
        UART1_Write(13);
        UART1_Write(10);
        Delay_ms(1000);

        // Wait for speed input
        while (1) {
            uart_rd = UART1_Read();
            if (uart_rd >= '1' && uart_rd <= '9') {
                speed = uart_rd;
                break;
            }
        }

    // Configure the motor speed based on the user's choice
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