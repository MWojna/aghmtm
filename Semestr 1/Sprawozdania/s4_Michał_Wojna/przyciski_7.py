from peripherals import LedSet, LedClr, KeyRead
from time import sleep
from my_peri import LedPoint

def ReadKeyboard():
    if KeyRead(0):
        return 0
    elif KeyRead(1):
        return 1
    elif KeyRead(2):
        return 2
    elif KeyRead(3):
        return 3
    else:
        return None

# 1. Zdefiniować funkcję ReadKeyboard(), która będzie zwracać numer naciśniętego przycisku wmomencie wywołania funkcji.Jeżeli żaden przycisk nie jest naciśnięty funkcaj powinna zwracać  NoneJeżeli naciśnieych jest więcej niż jeden przycisk funkcja powinna zwracać numer pierwszegonaciśnietego przycisku licząc od zerowego.2. Funkcja powinna:• używać sekwencji if-elif-elif ...• być zdefiniowana w pliku main.c