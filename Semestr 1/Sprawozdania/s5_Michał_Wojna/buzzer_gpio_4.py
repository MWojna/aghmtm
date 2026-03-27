from machine import Pin
from time import sleep_us

buzzer_a = Pin(8, Pin.OUT)
buzzer_b = Pin(11, Pin.OUT)

buzzer_b.value(0)
buzzer_a.value(1)
while(True):
    buzzer_a.toggle()
    buzzer_b.toggle()
    sleep_us(500)
