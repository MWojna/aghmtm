i=0
a=(i-3)%4
n=0
while(True):
    LedPoint(i)
    i=(i+1)%4
    sleep(1/50)
    if DetRead() == 0:
        break

curr_pos = 0
adc = PotRead()
pot = -((adc-192)*48)/(65535-192)
pluh = pot//1
print(pluh)
for pos in(0,pluh-1):
    des_pos = pos
    while(des_pos != curr_pos):
        if des_pos > curr_pos:
            curr_pos = curr_pos + 1
        elif des_pos < curr_pos:
            curr_pos = curr_pos - 1
        LedPoint(curr_pos % 4)
        sleep(1/50)
