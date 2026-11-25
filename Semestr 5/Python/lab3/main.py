from my_peri import LedPoint, LedBar, LedDimm, ReadKeyboard
from time import sleep
from peripherals import LedSet, LedClr, ButRead

while(1):
    print(ReadKeyboard())
    sleep(0.2)