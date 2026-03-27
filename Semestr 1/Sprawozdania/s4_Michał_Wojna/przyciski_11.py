from peripherals import LedSet, LedClr, KeyRead
from time import sleep
from my_peri import LedPoint, ReadKeyboard

while(True):
    but = ReadKeyboard()
    if but != None:
        LedPoint(3-but)

# Zmodyfikować poprzedni program tak aby zapalała się dioda o numerze przciwnym do numeru naciśniętego przycisku (0 3,  1 2,  2 1, 3->0).