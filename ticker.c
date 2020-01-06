#include <pic16f676.h>
#include <stdint.h>
#include <stdbool.h>

#pragma preproc_asm-

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
// then each LED has an on time of 0.1 / 138 = 0.0007234 of 723ns per led.
// => set timer at 1382 Hz (1382.3007Hz)
#define PIXEL_ON_TIME 723

// timer inc occurs at 250,000/s
// to overflow at 1382/s we count 250,000/1382 ticks = 180.857 = 181
// round up. so overflow happens a bit faster, so at the end we don't overlap
// the led at pos 0, but rather have a small gap
// timer overflows at 256 so start is 256 - 181 = 75
volatile uint8_t TIMER_START = 75; // 256 - 181


volatile uint8_t scancol = 0;

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
    if (INTE && INTF) { // External Interrupt
        // we crossed the 0 position

        if (scancol > XWIDTH-1 && TIMER_START < 255)
            TIMER_START++;
        else if (scancol < XWIDTH && TIMER_START > 0)
            TIMER_START--;

        TMR0 = TIMER_START;

        scancol = 0;
        PORTC = 0x3f;

        // clear interrupt
        INTF = 0;
    }
    if (T0IE && T0IF) { // Timer Overflow
        // time to switch on or off the current LED
        scancol++;
        if (scancol < XWIDTH-1) {
            if (scancol == 34)
                PORTC = 0x3f;
            else if (scancol == 69)
                PORTC = 0x3f;
            else if (scancol == 103)
                PORTC = 0x3f;
            else
                PORTC = 0x00;
        }

        TMR0 = TIMER_START;
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
    T0CS = 0; // timer on internal clock, internal ticks (Fosc/4) = 1 MHz
    PSA = 0; // prescaler for timer0
    PS0 = 1;
    PS1 = 0;
    PS2 = 0; // prescaler to 4 = 1,000,000 / 4 = 250,000 Hz

    T0IF = 0;
    T0IE = 1; // enable timer0 overflow interrupt

    INTF = 0; // clear INT flag
    INTEDG = 0; //  trigger on rising edge
    INTE = 1;  // enable external interrupt on RA2
    GIE = 1;  // enable global interrupts

    while (1) {
        if (scancol < 69 && !isOn) {
            RA5 = 1;
            isOn = true;
        }
        else if (scancol >=69 && isOn) {
            RA5 = 0;
            isOn = false;
        }
    }
}

