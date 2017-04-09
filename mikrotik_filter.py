#!/usr/bin/env python

import sys

for line in sys.stdin:
    if len(line) < 2:
        continue

    if ":beep" in line:
        splat = line.split(' ')
        print(splat[1][len("frequency="):], end=" ")
        length = splat[2][len("length="):]
        length = length[:-4]
        print(length, end=" ")

    if ":delay" in line:
        splat = line.split(' ')
        print("1", end=" ")
        print(splat[1][:-4], end=" ")
