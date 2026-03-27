from peripherals import LedSet, LedClr, KeyRead
from time import sleep

while(True):
    print(KeyRead(3),KeyRead(2),KeyRead(1),KeyRead(0))
    sleep(0.20)
    
# Napisać program, który będzie 5 razy na sekundę wyświetlał stan wszystkich przycisków.