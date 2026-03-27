from peripherals import LedSet, LedClr, KeyRead
from time import sleep
from my_peri import LedPoint

while(True):
        if not KeyRead(0) and not KeyRead(1):
            LedPoint(0)
        elif KeyRead(1) and not KeyRead(0):
            LedPoint(2)
        elif KeyRead(0) and not KeyRead(1):
            LedPoint(1)
        elif KeyRead(0) and KeyRead(1):
            LedPoint(3)

# Zmodyfikować poprzedni program tak aby realizował transkode kodu binarnego na 1 z 4Dla uproszczenia naciśniecie\zwolnienie przycisku oraz świecenie\zgasznie diody reprezentującyfry 1\0