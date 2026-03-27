from peripherals import LedSet, LedClr
from time import sleep

LedSet(0)
sleep(1)

LedSet(1)
sleep(1)

LedSet(2)
sleep(1)

LedSet(3)
sleep(1)

LedClr(3)
sleep(1)

LedClr(2)
sleep(1)

LedClr(1)
sleep(1)

LedClr(0)
sleep(1)

print('Done')

# Zmodyfikować poprzedni program tak aby zapalał diody po kolei od 0 do 3 a następnie gasił od 3  do 0.Zachować 1 sekundowe opóźnienia.