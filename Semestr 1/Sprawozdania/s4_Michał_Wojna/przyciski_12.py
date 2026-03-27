from peripherals import LedSet, LedClr, KeyRead
from time import sleep
from my_peri import LedPoint, ReadKeyboard

while(True):
    but_current = ReadKeyboard()
    if (but_current != None) and (but_prev == None):
        print('but', but_current)
    but_prev = but_current
    sleep(0.1)

#  Napisać program, który każde naciśnieciu dowolnego przycisku spowoduje pojedyncze wydrukowanie na konsoli napisu  a) „but”.b) „but [numer przycisku]”, czyli przykłądowo „but 3”Program powinie posiadać dwie zmienne, służące do przechowywania obecnego (zmienna but_current) i poprzedniego (but_previous) stanu klawiatury.Wydruk na konsolę pownien mieć miejsce jeżeli aktualnie przycisk jest naciśnięty a poprzednio był zwolniinyOdczyt przycisków powinien odbywac się z częstotliwością 10 Hz.