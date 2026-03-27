from peripherals import LedSet, LedClr
from time import sleep

def LedPoint(pos):
    for i in range(4):
        LedClr(i)
    if pos != None:
        LedSet(pos)
        
i = 0
while(i<4):    
    LedPoint(i)
    i += 1
    sleep(1)
    LedPoint(None)
# Zdefiniować funkcję  LedPoint(), której zadaniem jest zapalać diodę o numerze podanym w argumencie wywołania funkcji. Pozostałe diody powinny zostać zagaszne.Podanie jako argument wywołania wartości None powinno gasić wszystkie diody.