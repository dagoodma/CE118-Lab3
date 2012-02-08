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
//#include <string.h>
//#include <stdlib.h>

//#include <stdio.h>
//include <LED.h>

#define PORT_PWM PWM_PORTZ06
#define FREQ_PWM 200
#define USE_PWM

#define STEP_TIMER 1

#define STEP_TIMER_DELAY 2
#define STEPHI_TIMER_DELAY 2

#define STEP_TRIS       PORTZ03_TRIS
#define DIRECTION_TRIS  PORTZ04_TRIS
#define ENABLE_TRIS     PORTZ05_TRIS

#define STEP            PORTZ03_LAT
#define DIRECTION       PORTZ04_LAT
#define ENABLE          PORTZ05_LAT

#define FORWARD 0 // CW
#define REVERSE 1 // CCW


#define COIL_B_ENABLE PORTZ08_LAT

//--
static char enable = 0;
static enum {idle, cw, ccw, step} state = idle;



// ---------------- Prototypes ------------------
unsigned int min(unsigned int a, unsigned int b);
unsigned int max(unsigned int a, unsigned int b);
void StartIdle();
void StartStep();
void StartCw();
void StartCcw();

int main(void) {

    // ----------------- Initialization --------------
    SERIAL_Init();
    TIMERS_Init();
    InitTimer(STEP_TIMER,1);

#ifdef USE_PWM
    PWM_Init(PORT_PWM, FREQ_PWM);
    SetDutyCycle(PORT_PWM, 500);
#endif

    // Initialize interrupts
    INTEnableSystemMultiVectoredInt();

    // Initialize hardware
    STEP_TRIS = 0;
    DIRECTION_TRIS = 0;
    ENABLE_TRIS = 0;


    StartIdle();

 
    printf("\nHello, I am idling...");

    while (1) {


        switch (state) {
            case idle:
                // do nothing
                break;
            case cw:
                #ifndef USE_PWM
                if (IsTimerExpired(STEP_TIMER)) {
                    StartStep();
                // else do nothing
                }
                #endif
                break;
            case ccw:
                #ifndef USE_PWM
                if (IsTimerExpired(STEP_TIMER)) {
                    StartStep();
                    // else do nothing
                }
                #endif
                break;
            case step:
                #ifdef USE_PWM
                printf("\nError: shouldn't be stepping!");
                #endif
                if (IsTimerExpired(STEP_TIMER)) {
                    if (DIRECTION == FORWARD){
                        StartCw();
                        //printf("forward");
                    } else{
                        StartCcw();
                        //printf("reverse");
                    }
                }
        }

   
        
        char keyPressed = GetChar();
        if (keyPressed != 0) {
            if (keyPressed == 'f') {
                // forward
                printf("\nforward");
                StartCw();
            }
            else if(keyPressed == 'r') {
                 // reverse
                printf("\nreverse");
                StartCcw();
            }
            else if(keyPressed == 's') {
                StartIdle();
            }
            else if(keyPressed == 'q') {
                printf("\nGoodbye!");
                PWM_End();
                return 0;
            }
#ifdef USE_PWM
            else if(keyPressed == 't') {
                unsigned short int stringMax = 7;
                unsigned short int i = 0;
                char charNumber[1];
                charNumber[0] = 0;
                char stringNumber[stringMax+1];
                printf("\nPlease enter a frequency:");

                while(charNumber[0] != 46) {
                        charNumber[0] = GetChar();
                        //printf("\nGot %s", charNumber);
                        if ((charNumber[0] <= 57 && charNumber[0] >= 48)) {
                            stringNumber[i] = charNumber[0];
                            stringNumber[i+1] = '\0';
                            //printf("\nAppended %c to '%s'",charNumber[0],stringNumber);
                            //stringNumber = strcat(stringNumber, charNumber);
                            i++;
                        }

                        if (i >= stringMax)
                            break;
                        
                }
                //printf("\ni=%u stmax=%u", i, stringMax);
                printf("\nDone");
                unsigned int newFreq = atoi(stringNumber);
                printf("\nFrequency set to %u",newFreq);
                PWM_End();
                PWM_Init(PORT_PWM, newFreq);
                SetDutyCycle(PORT_PWM, 500);
            }
#endif
        } // end of keyPressed
 
        //while (!IsTransmitEmpty()); // bad, this is blocking code
    } // end of while loop

    return 0;
}

void StartIdle() {
     //printf("\nIdling...");
    state = idle;
    ENABLE = 0;
    STEP = 0;
}

void StartCw() {
    //printf("\nClockwising...");
    if (!ENABLE)
        ENABLE = 1;
    STEP = 0;
    if (DIRECTION != FORWARD)
        DIRECTION = FORWARD;
    state = cw;
    InitTimer(STEP_TIMER,STEP_TIMER_DELAY);
}

void StartCcw() {
    //printf("\nCounter-Clockwising...");
    if (!ENABLE)
        ENABLE = 1;
    STEP = 0;
    if (DIRECTION != REVERSE)
        DIRECTION = REVERSE;
    state = ccw;
    InitTimer(STEP_TIMER,STEP_TIMER_DELAY);
}

void StartStep() {
    // Sent a logical high to the step input on the DRV8811
    // and never transition states
    //printf("\nStepping...");
    STEP = 1;
    state = step;
    InitTimer(STEP_TIMER,STEPHI_TIMER_DELAY);
}


/**
 * Function: min
 * @param a, integer a
 * @param b, integer b
 * @return Lowest value, either a or b
 * @remark
 */
unsigned int min(unsigned int a, unsigned int b) {
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
unsigned int max(unsigned int a, unsigned int b) {
    if (a > b)
        return a;
    else
        return b;
}

