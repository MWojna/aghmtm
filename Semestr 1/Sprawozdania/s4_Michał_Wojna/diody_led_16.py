from my_peri import LedPoint
from time import sleep
from peripherals import LedSet, LedClr

def LedDimm(pwm,time):
    time_on = (pwm/100)*0.020
    time_off = 0.020-time_on
    for i in range(50*time):
        LedSet(0)    
        sleep(time_on)
        LedClr(0)
        sleep(time_off)
        
while(True):
    for pwm in 5,10,15,20,15,10:
        LedDimm(pwm,0.5)
        
# Zdefinować funkcję LedDimm(pwm,time), która zaswieci diodę zero z wypełnieniem podanym w pierwszym argumencie (pwm) przez czas podany w drugim argumencie (time). Wypełnienie powinno byc wyrażone w procentach a czas w sekundach.Należy uzyć pętli for.Program testowy powiniem w nieskończoność zmieniać wypełnienie świecenia leda w sposób podany poniżej: 5,10,15,20,15,10.Zmiana powinna nastepować co 0.5 sekundy Nalezy użyc po jedej pętli while i for.