from peripherals import PotRead
from time import sleep

while(True): 
    adc = PotRead()
    pot_norm = (adc-320)/(65199-320)
    led_pos = 3-int(pot_norm*3)
    LedPoint(led_pos)
    
# Zmodyfikować poprzedni program tak aby pozwalał kontrolować pozycję zapalonej diody za pomocą potencjometru.Ustawienie minimalnej wartości napiecia powinno odpowiadać zapalenia diody 3Ustawienie maksymalnej wartości powodowało zapelenie się diody 0. Obsługiwane powinny być również wartości pośredenie. Usunąć opóźnienie