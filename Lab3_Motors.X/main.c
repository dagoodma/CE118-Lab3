/*
 * File:   main.c
 * Author: hahernan & dagoodma
 *
 * Created on February 4, 2012, 8:54 PM
 */

#include <p32xxxx.h>
#include <serial.h>
#include <PORTS.h>
#include <timers.h>
#include <AD.h>
#include <pwm.h>
#include <SES.H>
#include <Stepper.h>
//#include <stdio.h>
//include <LED.h>

#define POT_INPUT AD_PORTV5
#define A_PWM    PWM_PORTZ06
#define FREQ_PWM 25

// Duty cycle bounds
#define DUTY_MAX MAX_PWM
#define DUTY_MIN MIN_PWM

#define uint unsigned int

#define ADC_PAUSE

// ---------------- Prototypes ------------------
uint ReadPotentiometer(void);

uint min(uint a, uint b);
uint max(uint a, uint b);

/*
int main(void) {

    // ----------------- Initialization --------------
    SERIAL_Init();
    TIMERS_Init();
    //SES_Init(SES_ROUND_ROBIN | SES_PRIORITY);

    // Initialize channel A to 200 Hz from PWM
    PWM_Init(A_PWM, FREQ_PWM);

    // Initialize AD pot input
    AD_Init(POT_INPUT);

    // Initialize interrupts
    INTEnableSystemMultiVectoredInt();

    // Set Ch A PWM duty cycle to 50%
    SetDutyCycle(A_PWM, 500);

    char firstRun = 1;
    printf("\nHello, I am working...");

    while (1) {

        // Read and print potentiometer
        uint potValue = ReadPotentiometer();
        //printf("\nPot. reading: %x", potValue);

        // Pause if desired
        #ifdef ADC_PAUSE
        uint wait = 0;
        for (wait = 0; wait <= 100000; wait++)
            asm("nop");
        #endif
        
        // Set motor speed with PWM from pot reading
        uint newSpeed = potValue;
        // bound it
        newSpeed = max(newSpeed,DUTY_MIN);
        newSpeed = min(newSpeed,DUTY_MAX);
        // effect the motor
        if (SetDutyCycle(A_PWM, newSpeed) == SUCCESS) {
            printf("\nSuccessfully set PWM to %x", newSpeed);
        }
        else {
            printf("\nFailed to set PWM to %x", newSpeed);
        }
        /*
        // Read char from stdin
        //char keyPressed = GetChar();
        //printf("\nTesting...");
        if (IsTransmitEmpty()) {
            printf("\nReceive buffer: %x",IsReceiveEmpty());
            printf("\nChar: %x",GetChar());

        }

 
        
        char keyPressed = GetChar();
        if (keyPressed != 0 && ! firstRun) {
            printf("\nGoodbye! %x",keyPressed);
            SetDutyCycle(A_PWM, 0);
            break;
        }
        firstRun = 0;
        while (!IsTransmitEmpty()); // bad, this is blocking code
    }

    //SES_Register(&ChangedPotentiometer())

    AD_End();
    return 0;
}
*/

/**
 * Function: min
 * @param a, integer a
 * @param b, integer b
 * @return Lowest value, either a or b
 * @remark
 */
uint min(uint a, uint b) {
    if (a < b)
        return a;
    else
        return b;
}

/**
 * Function: max
 * @param a, integer a
 * @param b, integer b
 * @return Highest value, either a or b
 * @remark
 */
uint max(uint a, uint b) {
    if (a > b)
        return a;
    else
        return b;
}


/**
 * Function: ReadPotentiometer
 * @return Voltage at the wiper of the potentiometer
 * @remark Voltage is sampled from the ADC where 0V -> 0, and
 *         3.3V -> 1023
 */
uint ReadPotentiometer(void) {
    return ReadADPin(POT_INPUT);
}
