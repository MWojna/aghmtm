from my_peri import LedPoint
from time import sleep
from peripherals import LedSet, LedClr

# a) w dowolny sposób

for i in 0,1,2,3:    
    LedPoint(i)
    sleep(1)
for i in 3,2,1,0:  
    LedPoint(i)
    sleep(1)

# b)• z użciem  jednej pętli i z jednym wystąpieniami funkcji Led* w kodzie• pętla  powinna być typu while • bez użycia listy

i = 0
while(i<8):
    if i < 4:
        j = i
    else:
        j = 3-i    
    LedPoint(j)
    i = i+1
    sleep(0.5)
    
# Jednokrotne przesuniecie punktu od Led 0..3,3..0 i zgaszenie