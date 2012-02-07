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

#define STEP_TIMER 1
#define STEP_TIMER_DELAY 10
#define STEPHI_TIMER_DELAY 10

#define uint unsigned int

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
uint min(uint a, uint b);
uint max(uint a, uint b);
void StartIdle();
void StartStep();
void StartCw();
void StartCcw();

int main(void) {

    // ----------------- Initialization --------------
    SERIAL_Init();
    TIMERS_Init();
    InitTimer(STEP_TIMER,1);

    // Initialize interrupts
    INTEnableSystemMultiVectoredInt();

    // Initialize hardware
    STEP_TRIS = 0;
    DIRECTION_TRIS = 0;
    ENABLE_TRIS = 0;


    StartIdle();

 
    printf("\nHello, I am working...");

    while (1) {


        switch (state) {
            case idle:
                // do nothing
                break;
            case cw:
                if (IsTimerExpired(STEP_TIMER)) {
                    StartStep();
                }
                break;
            case ccw:
                if (IsTimerExpired(STEP_TIMER)) {
                    StartStep();
                }
                break;
            case step:
                if (IsTimerExpired(STEP_TIMER)) {
                    STEP = 0;
                    if (DIRECTION == FORWARD){
                        StartCw();
                        printf("forward");
                    } else{
                        StartCcw();
                        printf("reverse");
                    }
                }
        }

   
        
        char keyPressed = GetChar();
        if (keyPressed != 0) {
            if (keyPressed == 'f') {
                // forward
                StartCw();
            }
            else if(keyPressed == 'r') {
                 // reverse
                StartCcw();
            }
            else if(keyPressed == 's') {
                StartIdle();
            }
        }
 
        while (!IsTransmitEmpty()); // bad, this is blocking code
    }

    return 0;
}

void StartIdle() {
     printf("\nIdling...");
    state = idle;
    ENABLE = 0;
    STEP = 0;
}

void StartCw() {
    printf("\nClockwising...");
    ENABLE = 1;
    STEP = 0;
    DIRECTION = FORWARD;
    state = cw;
    InitTimer(STEP_TIMER,STEP_TIMER_DELAY);
}

void StartCcw() {
    printf("\nCounter-Clockwising...");
    ENABLE = 1;
    STEP = 0;
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

