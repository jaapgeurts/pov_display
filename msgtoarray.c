#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>

// this table maps the ASCII table to the
// rotating ticker glyph table
const uint8_t mapping_table[127] = {
    // first 32 are unprintable ASCII chars
    // ignore space efficiency and keep it here
    // index 69 is glyph for an unprintable char
    69,69,69,69,69,69,69,69,
    69,69,69,69,69,69,69,69,
    69,69,69,69,69,69,69,69,
    69,69,69,69,69,69,69,69,
    36, // space
    37, // !
    38, // "
    39, // #
    40, // $
    41, // %
    42, // &
    43, // '
    44, // (
    45, // )
    46, // *
    47, // +
    48, // ,
    49, // -
    50, // .
    51, // /
    26, // 0
    27, // 1
    28, // 2
    29, // 3
    30, // 4
    31, // 5
    32, // 6
    33, // 7
    34, // 8
    35, // 9

    52, // :
    53, // ;
    54, // <
    55, // =
    56, // >
    57, // ?
    58, // @
    0, // A
    1, // B
    2, // C
    3, // D
    4, // E
    5, // F
    6, // G
    7, // H
    8, // I
    9, // J
    10, // K
    11, // L
    12, // M
    13, // N
    14, // O
    15, // P
    16, // Q
    17, // R
    18, // S
    19, // T
    20, // U
    21, // V
    22, // W
    23, // X
    24, // Y
    25, // Z
    59, // [
    60, // \
    61, // ]
    62, // ^
    63, // _
    64, // `
    69, // a
    69, // b
    69, // c
    69, // d
    69, // e
    69, // f
    69, // g
    69, // h
    69, // i
    69, // j
    69, // k
    69, // l
    69, // m
    69, // n
    69, // o
    69, // p
    69, // q
    69, // r
    69, // s
    69, // t
    69, // u
    69, // v
    69, // w
    69, // x
    69, // y
    69, // z
    65, // {
    66, // |
    67, // }
    68, // ~
    69, //  DELETE
};



int main(int argc, char* argv[])
{
    bool show_decimal = false;
    if (argc == 1 )
    {
        fprintf(stderr,"USAGE: %s [-d] <message>\n\n\tBy prints hex values. -d enables decimal values.\n",argv[0]);
        return -1;
    }


    int start = 1;
    if (argv[1][0] == '-' && argv[1][1] == 'd') {
        show_decimal = true;
        start++;
    }

    char* p = argv[1];
    int size = 0;
    for (int i=start;i<argc;i++)
        size += strlen(argv[i]) +1;
    size--;

    printf("#define MESSAGE_LENGTH %d\n",size);
    printf("#define MESSAGE_COL_LENGTH_ %d\n",size*6);
    printf("// ");
    for (int i=start;i<argc;i++)
        printf("%s ",argv[i]);
    printf("\n");
    printf("const uint8_t message[MESSAGE_LENGTH] = { ");
    for (int i=start;i<argc;i++) {
        p = argv[i];
        while (*p != 0)
        {
            if (show_decimal)
                printf("%d",mapping_table[*p]);
            else
                printf("0x%.2x",mapping_table[*p]);
            if (i < argc-1 || *(p+1) != 0)
                printf(", ");
            p++;
        }
        if (i < argc-1) {
            if (show_decimal)
                printf("%d, ",mapping_table[' ']);
            else
                printf("0x%.2x, ",mapping_table[' ']);
        }
    }
    printf(" };\n");


}
