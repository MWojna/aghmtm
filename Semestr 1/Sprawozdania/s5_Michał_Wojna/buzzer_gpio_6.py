from machine import Pin
from my_peri import ReadKeyboard
from time import sleep_us

buzzer_a = Pin(14, Pin.OUT)
buzzer_b = Pin(22, Pin.OUT)

buzzer_a.value(0)
buzzer_b.value(1)

def beep(f_Hz,t_s):
    T_us = 1_000_000 * (1/f_Hz)
    for i in range(2*t_s*f_Hz):
        buzzer_a.toggle()
        buzzer_b.toggle()
        sleep_us(int(T_us/2))

    while(True):
        beep(500,0.5)
        beep(2000,0.2)