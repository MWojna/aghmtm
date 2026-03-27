from peripherals import PotRead
from time import sleep

while(True):
    adc = PotRead()
    pot_norm = (adc-320)/(65199-320)    
    print(pot_norm)
    sleep(0.5)
    
# Zmodyfikować poprzedni program tak aby zamiast wartości z przetwornika analog\cyfra wyświetlał wartośc z przedziąłu od 0 do 1. Wartośc zera powinna odpowiadać najniższej wartości z przetwornika a wartośc 1 najwyższej.Obsłogiwane powinny być także wartości pośrednie.