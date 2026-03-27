from peripherals import LedSet, LedClr
from time import sleep
from myperi import LedPoint

i=3
while(True):
    LedPoint(i)
    i=i-1
    if i==-1:
        i=3
    sleep(1/50)
