from peripherals import LedSet, LedClr, KeyRead
from time import sleep
from my_peri import LedPoint

while(True):
        if KeyRead(0) and KeyRead(3):
            LedSet(0)
        elif KeyRead(1) and KeyRead(2):
            LedSet(1)
        else:
            LedClr(0), LedClr(1)

# Napisać program, który będzie zapalał\gasił diode 0 jeżeli przycisk 0 jest naciśnięty\zwolniony.Usunąć opóźnienie z kodu