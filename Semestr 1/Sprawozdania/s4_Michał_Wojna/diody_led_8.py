from peripherals import LedSet, LedClr
from time import sleep
from my_peri import LedPoint
        
i = 0
while(i<4):    
    LedPoint(i)
    i += 1
    sleep(1)
    LedPoint(None)

# Stworzyć moduł my_peri i przenieść do niego funkcję LedPoint. W tym celu:◦ stworzyć plik o nazwie my_peri.py◦ wstawić do niego kod funkcji LedPoint oraz importy funkcji niezbędnych do jej działania◦ zapisać plik na dysku mikrokontrolera2. W pliku main.py zastąpić definicję funkcji LedPoint jej importem