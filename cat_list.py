#!/usr/bin/python3

import sys

for arg in sys.argv[1:]:
    print(arg)
    with open(arg, 'r') as f:
        print(f.readlines())
