from peripherals import LedSet, LedClr, KeyRead
from time import sleep
from my_peri import LedPoint, ReadKeyboard

while(True):
    but = ReadKeyboard()
    if but != None:
        LedPoint(but)

# Zmodyfikować poprzedni program tak aby zwolnienie przycisku nie powodowało żadnej akcji. Innymi słowy zawsze powinien się świecić ten led którego przycisk ostatnio nacisnieto.