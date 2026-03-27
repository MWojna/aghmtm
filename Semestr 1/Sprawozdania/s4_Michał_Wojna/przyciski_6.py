from peripherals import LedSet, LedClr, KeyRead
from time import sleep
from my_peri import LedPoint

# a) dowolna implementacja

while(True):
    n = KeyRead(0)+KeyRead(1)+KeyRead(2)+KeyRead(3)
    LedBar(n)

# b) implementacja z jednokrotnym wystapieniem w kodzie funkcji  ButRead

while(True):
    i = 0
    for n in range(4):
        i = i + KeyRead(n)
    LedBar(i)

# Napisac program który w sposób ciągły będzie zapalał tyle diod ile jest naciśniętych przycisków. Użyć najbardziej odpowiedniej ze zdefiniowanych do tąd funkcji do sterowania ledami.