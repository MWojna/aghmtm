from my_peri import LedPoint
from time import sleep
from peripherals import LedSet, LedClr
        
# a) Zdefiniować funkcję  LedBar(led_nr), której zadaniem jest zapalanie liczby diód dpodanej w argumnecie.Wstawić funkcje do biblioteki my_peri

def LedBar(led_nr):
    for i in range(4):
        LedClr(i)
    for i in range(led_nr):
        LedSet(i)

# Napisać program testujący funkcję dla wszystkich sensownych wartości argumentów funkcji. Program umieścić w pętli nieskończonej.

while(True):    
    for i in 0,1,2,3,4:
        LedBar(i)
        sleep(0.5)