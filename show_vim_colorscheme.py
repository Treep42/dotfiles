#!/usr/bin/python2.7

import argparse
import re

parser = argparse.ArgumentParser()
parser.add_argument("file", help="vim color file", type=file)

argv = parser.parse_args()

colors = {}

colorpat = re.compile(r'cterm[fb]g=(\d+)')

pat = re.compile(r'^\s*hi\s+(\w+)(?:\s+ctermfg=(\d+))?(?:\s+ctermbg=(\d+))?(?:\s+cterm=(\w+))?\s*$')

for line in argv.file:
    if not re.match(r'^\s*"', line):
        m = pat.findall(line)
        if m:
            colors[m[0][0]] = {'fg' : m[0][1], 'bg' : m[0][2], 'f' : m[0][3]}

#go throug all and set missing fg or bg to entries for 'Normal'

for group, setting in colors.iteritems():
    if not setting['fg']:
        setting['fg'] = colors['Normal']['fg']
    if not setting['bg']:
        setting['bg'] = colors['Normal']['bg']
    if not setting['f']:
        setting['f'] = colors['Normal']['f']

fg = '\033[38;5;'
bg = '\033[48;5;'
reset = '\033[0m'

formats = {
    'bold' : '\033[1m',
    'underline' : '\033[4m',
    'reset' : reset
    }

for group, setting in colors.iteritems():
    grpstr = '{: <20}'.format(group)
    fgstr = ''
    bgstr = ''
    fstr = ''
    if setting['fg']:
        fgstr = fg + setting['fg'] + 'm'
    if setting['bg']:
        bgstr = bg + setting['bg'] + 'm'
    if setting['f']:
        if not setting['f']:
            fstr = formats['reset']
        else:
            fstr = formats.get(setting['f'],reset)
    print fstr, fgstr, bgstr, grpstr, '\033[0m', '   {}'.format(group)

