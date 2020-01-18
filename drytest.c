#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#define XWIDTH 138

// the current position of the arm
uint8_t scancol = 0;
uint8_t startpos = XWIDTH - 1;
uint8_t index = 0;
uint8_t subindex = 0;

#define GLYPH_WIDTH 6

#define MESSAGE_LENGTH 10
#define MESSAGE_COL_LENGTH 60
// FONTYS ICT
//uint8_t message[3];


void showled(void)
{

    if (scancol == startpos) {
        index = subindex = 0;
    }

    uint8_t pos = startpos + index * GLYPH_WIDTH + subindex;
    if (pos >= XWIDTH) {
        pos =  pos - XWIDTH;
    }
    printf("(startpos, scancol, pos, index, subindex) = (%d,%d,%d,%d,%d) : ",startpos, scancol, pos, index, subindex);

    if (scancol == pos) {
//        uint8_t map = message[index];
//        PORTC = letters[map][subindex] & 0b00111111;
//        RA5 = (letters[map][subindex] >> GLYPH_WIDTH) & 1;
        printf("L\r\n");
        subindex++;
        if (subindex == 6) {
            subindex = 0;
            index++;
            if (index == MESSAGE_LENGTH) {
                index = 0;
                startpos--;
            }
        }
    } else {
        printf("N\r\n");
    }
}

void tick()
{

    if (scancol == 138) {
        if (startpos == 0) {
            startpos = XWIDTH;
        }



        scancol = 0;
    }

    // keep track of where the arm is
    if (scancol < 255) {

        showled();

        scancol++;
    }
}

void main()
{
    system ("/bin/stty raw");
    char c = getchar();
    while (c != 'q') {
        if (c == 't') {
            tick();
        }
        c = getchar();
    }

    system ("/bin/stty cooked");
}

