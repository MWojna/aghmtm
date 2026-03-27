i=0
a=(i-3)%4
n=0
while(True):
    LedPoint(i)
    i=(i+1)%4
    sleep(1/50)
    if DetRead() == 0:
        while(n<13):
            LedPoint(a)
            a=(a-1)%4
            sleep(1/50)
            n=n+1
        break
