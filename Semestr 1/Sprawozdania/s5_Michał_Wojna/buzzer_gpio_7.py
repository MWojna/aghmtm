buzzer_a = Pin(8, Pin.OUT)
buzzer_b = Pin(11, Pin.OUT)
        
for f in 1319,1175,740 ,831 ,1109,988 ,587 ,659 ,988 ,880 ,554 ,659 ,880:
    beep(f,0.1)
    sleep_us(100_000)