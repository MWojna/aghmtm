from my_peri import LedPoint
from time import sleep
from peripherals import LedSet, LedClr

LedSet(1)    
while(True):
    LedSet(0)    
    sleep(0.001)
    LedClr(0)
    sleep(0.019)
    
# Zmodyfikowac poprzedni program tak aby:: - dodatkowo na poczatku, tj. przed pętlą główną, zapalał diodę 1 - stosunek czasu świecenia do całego okresu pętli wynosił do 1/20Uwaga: należy zachować poprzednia częstotliwość (okres) pętli