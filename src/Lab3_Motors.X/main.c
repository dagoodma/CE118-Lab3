/*
 * File:   main.c
 * Author: dagoodma & hahernan
 *
 * Created on February 4, 2012
 */

#include <p32xxxx.h>
#include <serial.h>
//#include <timers.h>
//#include <pwm.h>
//#include <AD.h>
#include <PORTS.h>


int main(void) {
    //AD_Init();

    // Configure ports as inputs or output (output = 0, input = 1)
    //PORTS_SetPortDirection(PORTV,  PORTV05_BIT)
    while (1) {
        printf("Port binary %b", PORTV05_BIT);
        while (!IsTransmitEmpty()); // bad, this is blocking code
    }
    return 0;
}