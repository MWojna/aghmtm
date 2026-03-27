from my_peri import LedPoint
from time import sleep
from peripherals import LedSet, LedClr

# a) z trzema pętlami

while(True):
    for i in 0,1,2,3:
        LedPoint(i)
        sleep(0.5)
    for i in 3,2,1,0:
        LedPoint(i)
        sleep(0.5)
        
# b) z jedną pętlą

i = 0
j = 1
while(True): 
    if i == 0:
        j = 1 
    elif i == 3:
        j = -1
       
    i = i + j
    LedPoint(i)
    sleep(0.5)
    
# Ciągłe przesuwanie punktu Led (0..3,3..0,0..3 itd.)