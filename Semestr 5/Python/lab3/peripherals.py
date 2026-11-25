import machine
 
# leds

def LedsInit():   
    leds=[machine.Pin(gpio,machine.Pin.OUT) for gpio in (16,17,18,19)]
    [led.value(0) for led in leds]
    return leds
    
def LedSet(pos):
    global leds
    leds[pos].value(1);
    
def LedClr(pos):
    global leds
    leds[pos].value(0);

# buttons
    
def ButtonsInit():   
    return [machine.Pin(gpio,machine.Pin.IN,machine.Pin.PULL_UP) for gpio in (9,8,7,6)]
    
def ButRead(pos):
    global buttons    
    return not buttons[pos].value()

# potentiometr

def PotInit():   
    return machine.ADC(26)
    
def PotRead():
    global potentiometer    
    return potentiometer.read_u16()

# init

leds = LedsInit()
buttons = ButtonsInit()
potentiometer = PotInit()
