
// Inclure les biblioth�ques requises
#include <built_in.h>

// Configuration des broches pour les axes du bras robotique
sbit Axis_X_Pin at RA0_bit;
sbit Axis_Y_Pin at RA1_bit;
sbit Axis_Z_Pin at RA2_bit;

// Variables de contr�le pour chaque axe
int step_delay = 10; // D�lai entre les �tapes du moteur (en ms)
int steps_per_rev = 200; // Nombre d'�tapes pour une r�volution compl�te du moteur pas � pas
float angle_per_step = 1.8; // Angle de rotation par �tape (en degr�s)

// Fonction pour faire une �tape dans le sens horaire pour un axe donn�
void step_cw(int axis_pin ,int  step_delay) {
    axis_pin = 1;
    Vdelay_ms( step_delay);
    axis_pin = 0;
    Vdelay_ms(step_delay);
}

// Fonction pour faire une �tape dans le sens antihoraire pour un axe donn�
void step_ccw(int axis_pin , int step_delay) {
    axis_pin =1;
    Delay_ms(10);
    axis_pin = 0;
    Delay_ms(10);
}

// Fonction pour effectuer une rotation angulaire sur un axe
void rotate_angle(int axis_pin, float target_angle) {
    int steps_to_move = (int)(target_angle / angle_per_step);
    int i;

    if (steps_to_move > 0) {
        for (i = 0; i < steps_to_move; i++) {                          <
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
    // Initialisation de la communication s�rie (UART)
    UART1_Init(9600);

    // Boucle principale
    while (1) {
        // V�rifier s'il y a des donn�es disponibles sur le port s�rie
        if (UART1_Data_Ready()) {
            command = UART1_Read();

            // Recevoir l'angle de rotation pour l'axe correspondant
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