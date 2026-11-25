from peripherals import LedSet, LedClr, ButRead
from time import sleep

def LedPoint(i):
    LedClr(0)
    LedClr(1)
    LedClr(2)
    LedClr(3)
    if i != None:
        LedSet(i)
        
def LedBar(i):
    LedClr(0)
    LedClr(1)
    LedClr(2)
    LedClr(3)
    for x in range (0,i):
        LedSet(x)
        x+=1
        
def LedDimm(pwm, time):
    LedSet(0)
    sleep(pwm/100*time)
    LedClr(0)
    sleep(time-pwm/100*time)
    
def ReadKeyboard():
    for i in range (0,4):
        if ButRead(i) == 1:
            return i
    return None