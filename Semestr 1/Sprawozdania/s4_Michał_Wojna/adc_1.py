from peripherals import PotRead
from time import sleep

while(True):
    print(PotRead())
    sleep(0.5)
    
# Napisać program który będzie wyświetlał na ekranie powłoki, bez przerwy, 2 razy nasekundę wartośc odczytaną z potencjometru.