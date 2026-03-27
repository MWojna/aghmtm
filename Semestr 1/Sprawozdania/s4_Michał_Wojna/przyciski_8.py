from peripherals import LedSet, LedClr, KeyRead
from time import sleep
from my_peri import LedPoint

def ReadKeyboard():
    for i in range(4):
        if KeyRead(i):
            return i
    return None

from peripherals import LedSet, LedClr
from time import sleep
def LedPoint(pos):
    for i in range(4):
        LedClr(i)
    if pos != None:
        LedSet(pos)
        
def LedBar(led_nr):
    for n in range(4):
        LedClr(n)
    for n in range(led_nr):
        LedSet(n)
        
def ReadKeyboard():
    for i in range(4):
        if ButRead(i):
            return i
    return None

# Ograniczyć powtarzanie się kodu w funkcji ReadKeyboard()używając pętli for oraz funkcjirange()