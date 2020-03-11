#!/usr/bin/env python

from PIL import Image
import functools
import operator

out = Image.new('1',(24*6,5*8));
outp = out.load();

im = Image.open('02-font-5x7.png')
pix = im.load()
print 'Image loaded: ',
print im.size;
for r in range(0,5):
    for c in range(0,24):

        l =  chr(ord('A')+c);
    #    print('// ' + l)
        a = [];

        for x in range(0,5):
            v = 0;
            for y in range(0,7):
                if pix[c*12.5*6+x*12.5+6,r*112+y*12.5+6][3] == 255:
                    v |= 1 << y
                    outp[c*6+x,r*8+y] = 1
            a.insert(0,v)
        print ('uint8_t %s[5] = {%s};' % (l,reduce(lambda p,q: str(p)+','+str(q), a)))

out.save('converted.png')
