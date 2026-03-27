from peripherals import PotRead
from time import sleep

while(True): 
    adc = PotRead()
    pot_norm = (adc-320)/(65199-320)
    voltage = pot_norm*3.3
    print(voltage)
    sleep(0.5)
    
# Zmodyfikować poprzedni program tak aby zamiast wartości z przetwornika analog\cyfra wyświetlał wartośc napięcia z potencjometru