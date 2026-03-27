from peripherals import LedSet, LedClr, KeyRead
from time import sleep
from my_peri import LedPoint, ReadKeyboard

while(True):
    LedPoint(ReadKeyboard())

# Napisać program, który będzie zapalał diodę o numerze takim jak numer naciśniętego przyciskuJeżeli nie nacisnięto żadnego przycisku wszystkie diody powiny być zgaszone.