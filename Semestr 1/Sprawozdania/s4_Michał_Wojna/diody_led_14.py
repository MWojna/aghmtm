from time import sleep
from peripherals import LedSet, LedClr

while(True):
    sleep(0.01)
    LedSet(0)    
    sleep(0.01)
    LedClr(0)
    
# Napisać program który bedzie cyklicznie gasił i zapalał diodę 0. Nalezy używyć funkcji LedSet i LedClr.Częstotliwość pętli głownej powinna wynośić 50 Hz.Dioda powinna byc zapalona i zgaszona przez taki sam okres czasu.