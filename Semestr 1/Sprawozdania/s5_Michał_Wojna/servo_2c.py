det = Pin(21,Pin.IN)

def DetRead():
    return det.value()

i=0
while(True):
    LedPoint(i)
    i=(i+1)%4
    sleep(1/50)
    if DetRead() == 0:
        break
