from peripherals import LedSet, LedClr, KeyRead
from time import sleep
from myperi import LedPoint
from machine import Pin

det = Pin(21,Pin.IN)

i=0
while(True):
    LedPoint(i)
    i=(i+1)%4
    sleep(1/50)
    if det.value() == 0:
        break
