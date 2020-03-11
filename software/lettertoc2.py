#!/usr/bin/env python
# -*- coding: utf-8 -*-

from PIL import Image
import functools
import operator

im = Image.open('fontset.png')
pix = im.load()
print 'Image loaded: ',
print im.size;

letters = ['A','B','C','D','E','F','G','H','I','J','K','L','M',
           'N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
           'a','b','c','d','e','f','g','h','i','j','k','l','m',
           'n','o','p','q','r','s','t','u','v','w','x','y','z',
           '0','1','2','3','4','5','6','7','8','9','.',',','“',
           '”','`','\'','"','\'','?','!','@','_','*','#','$','%',
           '&','(',')','+','-','/',':',';','<','=','>','[','\\'
           ,']','^','`','{','|','}','~','❤︎','ê','ô','â','ă','€',
           '↑','↓','←','→','↖','↗','↙','↘','°','☺','☹','©','ợ',
           '?','?','?']
li = 0

print ('uint8_t letters[120][6] = { ')
for r in range(0,5):
    for c in range(0,24):

        a = [];

        for x in range(0,5):
            v = 0;
            for y in range(0,7):
                if pix[c*6+x,r*8+y] == 1:
                    v |= 1 << y
            a.append(v)
        a.append(0);

        print ('{%s}, // %s' % (reduce(lambda p,q: str(p)+','+str(q), a),letters[li]))
        li = li+1
print ('};');
