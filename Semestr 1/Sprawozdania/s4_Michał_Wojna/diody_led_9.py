from my_peri import LedPoint
from time import sleep
from peripherals import LedSet, LedClr

# a) w dowolny sposób

LedPoint(0)
sleep(1)
LedPoint(1)
sleep(1)
LedPoint(2)
sleep(1)
LedPoint(3)
sleep(1)
LedPoint(None)

# b) z dokładnie dwoma wystąpieniami funkcji Led* w kodzie (użyć pętli while)

i = 0
while(i<4):    
    LedPoint(i)
    i += 1
    sleep(1)
LedPoint(None)

# c) podpunkt b) ale z użyciem: pętli for i listy

for i in 0,1,2,3:    
    LedPoint(i)
    sleep(1)
LedPoint(None)

# d) podpunkt c) ale z jednym wystąpieniami funkcji Led* w kodzie

for i in 0,1,2,3:    
    LedPoint(i)
    sleep(1)
LedPoint(None)

#  Jednokrotnie przesuniecie punktu od Led0 do Led3 i zagaszenie