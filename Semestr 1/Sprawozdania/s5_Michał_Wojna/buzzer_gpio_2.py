from machine import Pin
from time import sleep_us

buzzer_a = Pin(8, Pin.OUT)
buzzer_b = Pin(11, Pin.OUT)

while(True):
    buzzer_a.value(1)
    buzzer_b.value(0)
    sleep_us(500)
    buzzer_a.value(0)
    buzzer_b.value(1)
    sleep_us(500)
