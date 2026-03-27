from peripherals import LedSet, LedClr
from time import sleep

i = 0
while(i<3):
    sleep(1)
    LedSet(2)
    sleep(1)
    LedClr(2)
    i = i+1
    
# Zmodyfikować poprzedni program tak aby zamigał diodą o numerze 2 trzy razy a następnie zgasił diodę (_*_*_*_)W tym celu użyć pętli while