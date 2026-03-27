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

# Zmodyfikować poprzedni program tak aby:◦ zapalał diode 0 wtedy i tylko wtedy jeżeli wciśniete są tylko oba skrajne przyciski◦ zapalał diode 1 wtedy i tylko wtedy jeżeli wciśniete są tylko oba wewnętrzne przyciski