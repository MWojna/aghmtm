from machine import Pin
from my_peri import ReadKeyboard
from time import sleep_us

buzzer_a = Pin(8, Pin.OUT)
buzzer_b = Pin(11, Pin.OUT)

def beep(f_Hz,t_s):
    T_us = 1_000_000 * (1/f_Hz)
    for i in range(2*t_s*f_Hz):
        buzzer_a.toggle()
        buzzer_b.toggle()
        sleep_us(int(T_us/2))

l = (1319, 66, 71), (1175, 66, 71), (740, 133, 138), (831,
133, 138), (1109, 66, 71), (988, 66, 71), (587, 133,
138), (659, 133, 138), (988, 66, 71), (880, 66, 71), (554, 133,
138), (659, 133, 138), (880, 266, 271)

for f,d,s in l:
    beep(f,d/1000)
    sleep_us(1000*s)
