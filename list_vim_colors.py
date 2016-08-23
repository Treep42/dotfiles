#!/usr/bin/python2.7

import argparse
import re

parser = argparse.ArgumentParser()
parser.add_argument("file", help="vim color file", type=file)

argv = parser.parse_args()

colors = {}

colorpat = re.compile(r'cterm[fb]g=(\d+)')

for line in argv.file:
    if not re.match(r'^\s*"', line):
        m = colorpat.findall(line)
        for col in m:
            if col: colors[col] = 1

colorlist = colors.keys()
colorlist.sort(key=int)

fg = '\033[38;5;'
bg = '\033[48;5;'

for i in colorlist:
    n = str(i)
    fgstr = fg + n + 'm' + n
    bgstr = bg + n + 'm' 'XXXXX'
    print fgstr, bgstr, '\033[0m', n

