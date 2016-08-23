#!/usr/bin/python2.7

import argparse

parser = argparse.ArgumentParser()
parser.add_argument("colors", type=int, nargs='+')

argv = parser.parse_args()

fg = '\033[38;5;'
bg = '\033[48;5;'

for i in argv.colors:
    n = str(i)
    fgstr = fg + n + 'm' + n
    bgstr = bg + n + 'm' 'XXXXX'
    print fgstr, bgstr, '\033[0m', n
