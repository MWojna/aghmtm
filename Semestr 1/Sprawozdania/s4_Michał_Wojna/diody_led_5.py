from peripherals import LedSet, LedClr
from time import sleep

LedSet(1)
while(True):
    LedSet(2)
    sleep(0.01)
    LedClr(2)
    sleep(0.09)
    
# Zmodyfikować poprzedni program tak aby:• zapalił diodę 1• zapalał i gasił diodę 2 w nieskończoność (pętla nieskończona), przy czym dioda powinna pozostać:◦ zostać zapalona przez 10 milisekund ◦ zgaszona przez 90 milisekund