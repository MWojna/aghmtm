import machine
from time import sleep

pin12 = machine.Pin(12, machine.Pin.OUT)
machine.mem[0x4001c034] = 0x3 << 4
pwm = machine.PWM(pin12)
pwm.freq(100)
pwm.duty_u16(int(0.5*65536))



pin26 = machine.Pin(26, machine.Pin.IN)
adc_Vin = machine.ADC(pin26)

samples = [adc_Vin.read_u16()
    for i in range(1000)]

with open('samples.txt', 'w') as f:
    for sample in samples:
        s = str(sample)
        f.write(s + '\n')
        print(s)