from machine import Pin
from my_peri import ReadKeyboard
from time import sleep_us

buzzer_a = Pin(8, Pin.OUT)
buzzer_b = Pin(11, Pin.OUT)

while(True):
    key = ReadKeyboard()
    if key!= None:
        buzzer_a.toggle()
        buzzer_b.toggle()
    if key==0:
        sleep_us(2000)
    elif key==1:
        sleep_us(1000)
    elif key==2:
        sleep_us(500)
    elif key==3:
        sleep_us(250)
