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
        if KeyRead(3):
            LedPoint(None)
        
        sleep(0.05)

# Dodać  do programu obsługę przycisku 3 polegającą na tym, że jeżeli przycisk jest wciśnięty todiody migają zamiast świeci. Miganie powinno odbywać się z częstotliwością 10 Hz.