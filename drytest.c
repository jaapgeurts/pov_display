#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#define XWIDTH 138

// the current position of the arm
uint8_t scancol = 0;
uint16_t startpos = XWIDTH - 1;
uint16_t index = 0;
uint8_t subindex = 0;
uint16_t indexM = 0;
uint8_t subindexM = 0;

#define GLYPH_WIDTH 6

// FONTYS ICT : EMBEDDED SYSTEMS - APPLICATION DEVELOPMENT - EXPERIENCE DESIGN
// - INFRASTRUCTURE ENGINEERING - DATA DESIGN
#define MESSAGE_BANNER_LENGTH 118
#define MESSAGE_BANNER_COL_LENGTH 708
const uint8_t message_banner[MESSAGE_BANNER_LENGTH] = {0x05, 0x0e, 0x0d, 0x13, 0x18, 0x12, 0x24,
  0x08, 0x02, 0x13, 0x24, 0x34, 0x24, 0x04, 0x0c, 0x01, 0x04, 0x03, 0x03, 0x04,
  0x03, 0x24, 0x12, 0x18, 0x12, 0x13, 0x04, 0x0c, 0x12, 0x24, 0x31, 0x24, 0x00,
  0x0f, 0x0f, 0x0b, 0x08, 0x02, 0x00, 0x13, 0x08, 0x0e, 0x0d, 0x24, 0x03, 0x04,
  0x15, 0x04, 0x0b, 0x0e, 0x0f, 0x0c, 0x04, 0x0d, 0x13, 0x24, 0x31, 0x24, 0x04,
  0x17, 0x0f, 0x04, 0x11, 0x08, 0x04, 0x0d, 0x02, 0x04, 0x24, 0x03, 0x04, 0x12,
  0x08, 0x06, 0x0d, 0x24, 0x31, 0x24, 0x08, 0x0d, 0x05, 0x11, 0x00, 0x12, 0x13,
  0x11, 0x14, 0x02, 0x13, 0x14, 0x11, 0x04, 0x24, 0x04, 0x0d, 0x06, 0x08, 0x0d,
  0x04, 0x04, 0x11, 0x08, 0x0d, 0x06, 0x24, 0x31, 0x24, 0x03, 0x00, 0x13, 0x00,
  0x24, 0x03, 0x04, 0x12, 0x08, 0x06, 0x0d};

// WELCOME TO FONTYS
#define MESSAGE_ROTATING_LENGTH 17
const uint8_t message_rotating[MESSAGE_ROTATING_LENGTH] = {0x16, 0x04, 0x0b, 0x02, 0x0e, 0x0c,
  0x04, 0x24, 0x13, 0x0e, 0x24, 0x05, 0x0e, 0x0d, 0x13, 0x18, 0x12};


// use my own encoding. ASCII wastes too much space
const uint8_t letters[][GLYPH_WIDTH] = {
  {124, 18, 17, 18, 124, 0}, // A  // 0
  {65, 127, 73, 73, 54, 0}, // B
  {28, 34, 65, 65, 34, 0}, // C
  {65, 127, 65, 34, 28, 0}, // D
  {127, 73, 73, 73, 65, 0}, // E
  {127, 9, 9, 9, 1, 0}, // F  // 5
  {62, 65, 73, 73, 58, 0}, // G
  {127, 8, 8, 8, 127, 0}, // H
  {0, 65, 127, 65, 0, 0}, // I
  {48, 64, 65, 63, 1, 0}, // J
  {127, 8, 20, 34, 65, 0}, // K   // 10
  {127, 64, 64, 64, 64, 0}, // L
  {127, 2, 12, 2, 127, 0}, // M
  {127, 6, 8, 48, 127, 0}, // N
  {62, 65, 65, 65, 62, 0}, // O
  {127, 9, 9, 9, 6, 0}, // P     // 15
  {62, 65, 81, 33, 94, 0}, // Q
  {127, 9, 25, 41, 70, 0}, // R
  {38, 73, 73, 73, 50, 0}, // S
  {1, 1, 127, 1, 1, 0}, // T
  {63, 64, 64, 64, 63, 0}, // U  // 20
  {15, 48, 64, 48, 15, 0}, // V
  {127, 32, 24, 32, 127, 0}, // W
  {99, 20, 8, 20, 99, 0}, // X
  {7, 8, 120, 8, 7, 0}, // Y
  {97, 81, 73, 69, 67, 0}, // Z   // 25


  {62, 81, 73, 69, 62, 0}, // 0
  {68, 66, 127, 64, 64, 0}, // 1
  {98, 81, 73, 73, 70, 0}, // 2
  {34, 65, 73, 73, 54, 0}, // 3
  {24, 20, 18, 127, 16, 0}, // 4  // 30
  {71, 69, 69, 41, 17, 0}, // 5
  {60, 74, 73, 73, 48, 0}, // 6
  {3, 1, 121, 5, 3, 0}, // 7
  {54, 73, 73, 73, 54, 0}, // 8
  {6, 73, 73, 41, 30, 0}, // 9  // 35

  {0, 0, 0, 0, 0, 0,}, // space
  //  {12, 30, 60, 30, 12, 0}, // ❤︎

  {0, 0, 95, 0, 0, 0}, // !
  {0, 3, 0, 3, 0, 0}, // "
  {20, 127, 20, 127, 20, 0}, // #
  {18, 42, 127, 42, 36, 0}, // $ // 40
  {98, 100, 8, 19, 35, 0}, // %
  {40, 48, 74, 69, 58, 0}, // &
  {0, 1, 2, 4, 0, 0}, // '
  {0, 65, 34, 28, 0, 0}, // (
  {0, 28, 34, 65, 0, 0}, // )   // 45
  {34, 20, 127, 20, 34, 0}, // *
  {8, 8, 62, 8, 8, 0}, // +
  {0, 0, 48, 64, 0, 0}, // ,
  {8, 8, 8, 8, 0, 0}, // -
  {0, 0, 96, 96, 0, 0}, // .  // 50
  {3, 4, 8, 16, 96, 0}, // /

  {0, 0, 20, 0, 0, 0}, // :

  {0, 0, 52, 64, 0, 0}, // ;
  {65, 99, 54, 28, 8, 0}, // <
  {20, 20, 20, 20, 20, 0}, // =  // 55
  {8, 28, 54, 99, 65, 0}, // >
  {6, 9, 81, 1, 6, 0}, // ?
  {62, 65, 121, 73, 50, 0}, // @

  {0, 65, 65, 127, 0, 0}, // [
  {96, 16, 8, 4, 3, 0}, // \   // 60
  {0, 127, 65, 65, 0, 0}, // ]
  {4, 2, 1, 2, 4, 0}, // ^
  {64, 64, 64, 64, 64, 0}, // _
  {0, 4, 2, 1, 0, 0}, // `
  {65, 65, 54, 8, 0, 0}, // {  // 65
  {0, 0, 119, 0, 0, 0}, // |
  {0, 8, 54, 65, 65, 0}, // }
  {2, 4, 2, 1, 2, 0}, // ~
  /*
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

static void show_banner_led(void)
{
  // prepare for the next cycle
    if (scancol == 0) {
        subindexM++;
        if (subindexM == 6) {
            subindexM = 0;
            indexM++;
            if (indexM == MESSAGE_BANNER_LENGTH)
            indexM = 0;
        }

        index = indexM;
        subindex = subindexM;
    }

  uint16_t pos = index * GLYPH_WIDTH + subindex;

  printf("scancol=%.3d,startpos=%.3d,pos=%.3d,index=%.2d,subindex=%1d:\t",scancol, startpos, pos, index, subindex);

  if (pos < MESSAGE_BANNER_COL_LENGTH) {
    uint8_t map = message_banner[index];
    uint8_t val = letters[map][subindex];
    for (int i=0;i<7;i++) {
        printf("%c",val & 1 ? 'X':' ');
        val >>= 1;
    }
    subindex++;
    if (subindex == 6) {
      subindex = 0;
      index++;
      if (index == MESSAGE_BANNER_COL_LENGTH) {
        index = 0;
      }
    }
  }
  printf("\r\n");

}


void showled(void)
{

    if (scancol == startpos) {
        index = subindex = 0;
    }

    uint8_t pos = startpos + index * GLYPH_WIDTH + subindex;
    if (pos >= XWIDTH) {
        pos =  pos - XWIDTH;
    }
    printf("(startpos, scancol, pos, index, subindex) = (%.3d,%.3d,%.3d,%d,%d) : ",startpos, scancol, pos, index, subindex);

    if (scancol == pos) {
        uint8_t map = message_rotating[index];
        uint8_t val = letters[map][subindex];
        for (int i=0;i<7;i++) {
            printf("%c",val & 1 ? 'X':' ');
            val >>= 1;
        }
        subindex++;
        if (subindex == 6) {
            subindex = 0;
            index++;
            if (index == MESSAGE_ROTATING_LENGTH) {
                index = 0;
                startpos--;
            }
        }


    }
 printf("\r\n");
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

        show_banner_led();

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

