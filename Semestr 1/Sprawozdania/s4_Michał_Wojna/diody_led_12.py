from my_peri import LedPoint
from time import sleep
from peripherals import LedSet, LedClr

while(True):    
    for i in 0,3,1,2,None:
        LedPoint(i)
        sleep(0.5)

# Ciągłe ustawianie punktu Led na pozycje: 0,3,1,2,zgaszonea) z dwoma pętlami