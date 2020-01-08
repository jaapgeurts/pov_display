#include <pic16f676.h>
#include <stdint.h>
#include <stdbool.h>

#pragma preproc_asm-

#define forever while(true)

static __code uint16_t __at(_CONFIG) configword1 =
    _CP_OFF & // code mem protection
    _CPD_OFF & // data mem protection
    _WDT_OFF & // watch dog timer
    _BODEN_OFF & // brownout off
    _PWRTE_OFF & // power timer enable off
    _INTRC_OSC_NOCLKOUT & // internal oscillator
    _MCLRE_ON; // don't use MCLRE as IO

// calculate maximum display resolution

// led size = 5mm
// circle radius = 110mm

// Diameter = 2.0 * PI * RADIUS = 691.15mm
// total leds(=pixels) that fit in one circle
#define XWIDTH 138 // 691.15 / 5 = 138.23

// assuming 10 rotations per second = 0.1seconds / rotation
// then each LED has an on time of 0.1 / 138 = 0.0007234 or 723μs per led.
// => set timer at 1382 Hz (1382.3008 Hz)
#define PIXEL_ON_TIME 723
//#define PIXEL_ON_TIME 1449 // 1.449ms

// timer inc occurs at 250,000/s
// to overflow 1382/s we count 250,000/1382 ticks = 180.858 = 181
// round up. so overflow happens a bit faster, so at the end we don't overlap
// the led at pos 0, but rather have a small gap
// timer overflows at 256 so start is 256 - 181 = 75
volatile uint8_t TIMER_START = 75; // 256 - 181

// the current position of the arm
volatile uint8_t scancol = 0;
volatile uint8_t pos = XWIDTH;
volatile uint8_t index = 0;

uint8_t A[6] = {124,18,17,18,124,0};
uint8_t M[6] = {127,2,12,2,127,0};
uint8_t Y[6] = {7,8,120,8,7,0};
uint8_t HART[6] = {12,30,60,30,12,0};


/*
void delay(unsigned long ms)
{
    unsigned int i;

    while (ms--)
        for (i=0; i < 330; i++)
            ;
}*/


static void isr_int(void) __interrupt(0)
{

    // read interrupt status
    if (INTE && INTF) // External Interrupt
    {
        // we crossed the 0 position
        if (scancol < XWIDTH && TIMER_START < 255)
            TIMER_START++;
        else if (scancol > XWIDTH && TIMER_START > 0)
            TIMER_START--;

        scancol = 0;
        if (pos == 0)
            pos = XWIDTH;
        else
            pos--;

        index = 0;

        // reinitialize timer
        TMR0 = TIMER_START; // writing to TMR0 clears the prescaler counter

        INTF = 0; // clear interrupt flag
        T0IF = 0; // also clear timer flag in case it occurred
    }
    else if (T0IE && T0IF) // Timer Overflow
    {
        // turn off current led & display next led
        if (scancol < 255) {
            scancol++;

            if (scancol > pos && scancol <= pos + 24) {
                PORTC = A[index] & 0b00111111;
                RA5 = (A[index] >> 6) & 1;
                index++;
            }
            else {
                PORTC = 0x00;
            }
        }

        // reinitialize timer
        TMR0 = TIMER_START; // writing to TMR0 clears the prescaler counter

        // clear interrupt flag
        T0IF = 0;
    }
}

void main(void)
{
    bool isOn = false;

    // set all port values to LOW so leds are off
    PORTA = 0x00;
    PORTC = 0x00;

    // set analog off
    ANSEL = 0;

    // set data direction
    TRISA = 0x00; // portA as output
    TRISA2 = 1; // except RA2
    TRISC = 0x00; // portC as output

    GIE = 0; // disable global interrupts

    // setup timer0
    TMR0 = TIMER_START;
    T0CS = 0; // timer clock source to internal clock,
              // internal ticks (Fosc/4) = 1 MHz
    PSA = 0; // assign prescaler to timer0
    PS0 = 1;
    PS1 = 0;
    PS2 = 0; // prescaler to 4 = 1,000,000 / 4 = 250,000 Hz

    T0IF = 0; // clear timer0 overflow flag
    T0IE = 1; // enable timer0 overflow interrupt

    INTF = 0; // clear INT flag
    INTEDG = 0; //  trigger on rising edge
    INTE = 1;  // enable external interrupt on RA2
    GIE = 1;  // enable global interrupts

    forever {
      /*  if (scancol < 69 && !isOn) {
            RA5 = 1;
            isOn = true;
        }
        else if (scancol >=69 && isOn) {
            RA5 = 0;
            isOn = false;
        }*/
    }
}

