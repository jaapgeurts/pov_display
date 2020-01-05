#include <pic16f676.h>
#include <stdint.h>
#include <stdbool.h>

#pragma preproc_asm-

extern __at(_CONFIG) unsigned char myconfig =
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
#define XWIDTH 138 // 691.15 / 5 ≈ 138.23

// assuming 10 rotations per second = 0.1seconds / rotation
// then each LED has an on time of 0.1 / 138 = 0.00074 of 740ns per led.
// => set timer at 1380 Hz
#define PIXEL_ON_TIME 740



// timer inc occurs at 250,000/s
// to overflow at 1380/s we count 250,000/1380 ticks
// timer start is 256 - 181 = 75
#define TIMER_START 75 // 256 - 181

uint8_t pixels[XWIDTH] = {0};
volatile uint8_t scanrow = 0;

/*
void delay(unsigned long ms)
{
    unsigned int i;

    while (ms--)
        for (i=0; i < 330; i++)
            ;
}*/

void reset_timer(void)
{
    // reset the timer
        GIE = 0; // disable global interrupts

        // setup timer0
        TMR0 = TIMER_START;
        T0CS = 0; // timer on internal clock, internal oscillator = 4 MHz
        PSA = 0; // prescaler for timer0
        PS0 = 0;
        PS1 = 1;
        PS2 = 1; // prescaler to 128 = 4,000,000 / 16 = 250,000 kHz

        GIE = 1;
}

static void isr_int(void) __interrupt(0)
{
    // read interrupt status
    if (INTF)
    {
        // we crossed the 0 position

        reset_timer();

        scanrow = 0;
        PORTC = pixels[scanrow];

        // clear interrupt
        INTF = 0;
    }
    if (T0IF)
    {
        // time to switch on or off the current LED
        if (scanrow < XWIDTH-1) {
            scanrow++;
            PORTC = pixels[scanrow];
        }

        reset_timer();

        T0IF = 0;
    }
}

void main(void)
{
    // setup pixels
    pixels[0] = 0x3f;
    pixels[34] = 0x3f;
    pixels[69] = 0x3f;
    pixels[103] = 0x3f;

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
    T0CS = 0; // timer on internal clock, internal oscillator = 4 MHz
    PSA = 0; // prescaler for timer0
    PS0 = 0;
    PS1 = 1;
    PS2 = 1; // prescaler to 128 = 4,000,000 / 16 = 250,000 kHz

    T0IF = 0;
    T0IE = 1; // enable timer0 overflow interrupt

    INTF = 0; // clear INT flag
    INTEDG = 0; //  trigger on rising edge
    INTE = 1;  // enable external interrupt on RA2
    GIE = 1;  // enable global interrupts

    while (1)
    {
      // do nothing
    }
}

