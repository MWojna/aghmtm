from peripherals import LedSet, LedClr, KeyRead
from time import sleep
from my_peri import LedPoint, ReadKeyboard

# a) Zawartośc licznika powinna być przentowana na konsoli przy każdym naciśnięciu

counter = 0
while(True):
    but_current = ReadKeyboard()
    if (but_current != None) and (but_prev == None):
        counter = (counter + 1)
        print('but', but_current, ',', counter)
    but_prev = but_current
    sleep(0.1)

# b) Zawartość licznika powinn być prezentowana na ledach z użyciem funkcji LedBar, przy czym 
liczba w liczniku pownna być ograniczona funkcją modulo 5

counter = 0
while(True):
    but_current = ReadKeyboard()
    if (but_current != None) and (but_prev == None):
        counter = (counter + 1)%5
        print('but', but_current)
        LedBar(counter)
    but_prev = but_current
    sleep(0.1)

# c) Zmodyfikować podpunkt b) tak aby ◦ przycisk 0 powodował dekrementację licznika a przycisk 1 jego inkrementację◦ wartość licznika nie wychodziła poza zakres 0-4

counter = 0
while(True):
    but_current = ReadKeyboard()
    if (but_current != None) and (but_prev == None):
        if but_current == 0:
            counter = counter - 1
        if but_current == 1:
            counter = counter + 1
        if counter < 0:
            counter = 0
        elif counter > 4:
            counter = 4
        print(counter)
        LedBar(counter)
    but_prev = but_current
    sleep(0.1)

# Zmodyfikować poprzedni program tak aby zliczał liczbę naciśnieć przycisków.