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
volatile uint8_t pos = XWIDTH-1;
volatile uint8_t index = 0;
volatile uint8_t subindex = 0;

#define MAX_MESSAGE 14
#define MAX_MESSAGE_LENGTH 84
// ❤︎ ANH YEU EM ❤︎
const uint8_t message[MAX_MESSAGE] = { 37, 36, 0, 13, 7, 36, 24, 4, 20, 36, 4, 12, 36, 37 };

// use my own encoding. ASCII wastes too much space
const uint8_t letters[38][6] = {
{124,18,17,18,124,0}, // A // 0
{54,73,73,127,65,0}, // B
{34,65,65,34,28,0}, // C
{28,34,65,127,65,0}, // D
{127,73,73,73,65,0}, // E
{1,9,9,9,127,0}, // F   // 5
{58,73,73,65,62,0}, // G
{127,8,8,8,127,0}, // H
{0,65,127,65,0,0}, // I
{1,63,65,64,48,0}, // J
{65,34,20,8,127,0}, // K // 10
{64,64,64,64,127,0}, // L
{127,2,12,2,127,0}, // M
{127,6,8,48,127,0}, // N
{62,65,65,65,62,0}, // O
{6,9,9,9,127,0}, // P  // 15
{94,33,81,65,62,0}, // Q
{70,41,25,9,127,0}, // R
{50,73,73,73,38,0}, // S
{1,1,127,1,1,0}, // T
{63,64,64,64,63,0}, // U  // 20
{15,48,64,48,15,0}, // V
{127,32,24,32,127,0}, // W
{99,20,8,20,99,0}, // X
{7,8,120,8,7,0}, // Y
{67,69,73,81,97,0}, // Z  // 25

{62,69,73,81,62,0}, // 0
{64,64,127,66,68,0}, // 1
{70,73,73,81,98,0}, // 2
{54,73,73,65,34,0}, // 3
{16,127,18,20,24,0}, // 4   // 30
{17,41,69,69,71,0}, // 5
{48,73,73,74,60,0}, // 6
{3,5,121,1,3,0}, // 7
{54,73,73,73,54,0}, // 8
{30,41,73,73,6,0}, // 9  // 35

{0,0,0,0,0,0,}, // space
{12,30,60,30,12,0}, // ❤︎
/*
{0,0,95,0,0,0}, // !
{0,3,0,3,0,0}, // "
{20,127,20,127,20,0}, // #
{18,42,127,42,36,0}, // $ // 40
{98,100,8,19,35,0}, // %
{40,48,74,69,58,0}, // &
{0,1,2,4,0,0}, // '
{0,65,34,28,0,0}, // (
{0,28,34,65,0,0}, // )   // 45
{34,20,127,20,34,0}, // *
{8,8,62,8,8,0}, // +
{0,0,48,64,0,0}, // ,
{8,8,8,8,0,0}, // -
{0,0,96,96,0,0}, // .  // 50
{3,4,8,16,96,0}, // /

{0,0,20,0,0,0}, // :
{0,0,52,64,0,0}, // ;
{65,99,54,28,8,0}, // <
{20,20,20,20,20,0}, // =  // 55
{8,28,54,99,65,0}, // >
{6,9,81,1,6,0}, // ?
{62,65,121,73,50,0}, // @

{0,65,65,127,0,0}, // [
{96,16,8,4,3,0}, // \   // 60
{0,127,65,65,0,0}, // ]
{4,2,1,2,4,0}, // ^
{64,64,64,64,64,0}, // _
{0,4,2,1,0,0}, // `
{65,65,54,8,0,0}, // {  // 65
{0,0,119,0,0,0}, // |
{0,8,54,65,65,0}, // }
{2,4,2,1,2,0}, // ~

{58,85,85,85,26,0}, // ê  // 70
{58,69,69,69,58,0}, // ô
{122,85,85,85,34,0}, // â
{121,86,86,85,32,0}, // ă
{65,85,85,62,20,0}, // €
{6,9,9,6,0,0}, // °    // 75
{60,106,94,106,60,0}, // ☺
{60,90,110,90,60,0}, // ☹
{62,65,85,73,62,0}, // ©  //78
*/
};




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

        if (pos == 0) {
            pos = XWIDTH;
        }

        pos--;

        scancol = 0;
        index = 0;
        subindex = 0;

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

            uint8_t t = pos + MAX_MESSAGE_LENGTH;
            if (scancol >= pos && scancol < t) {
                uint8_t map = message[index];
                PORTC = letters[map][subindex] & 0b00111111;
                RA5 = (letters[map][subindex] >> 6) & 1;
                subindex++;
                if (subindex == 6)
                {
                    subindex = 0;
                    index++;
                }
            }
            else {
                PORTC = 0x00;
                RA5 = 0;
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
        // do nothing.
        // everything happens in the interrupt handler
    }
}

