from peripherals import LedSet, LedClr
from time import sleep

LedSet(0)
sleep(1)
LedClr(0)

print('Done')

# Wstawić po wywołaniu funkcji LedSet opóźnienie jednosekundowe opóżnienieW tym celu użyć funkcji sleep, która jako argument wywołania przyjmuje czas wyrażony w sekundach.