#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Uruchom w tle wyszukiwanie w /usr plików z rozszerzeniem .py i obniż priorytet tego polecenia do najniższego."
}

function wyswietlroz(){
echo '$ find /usr -type f -name "*.py" & renice +19 -p'
}

function uruchomroz(){
find /usr -type f -name "*.py" & renice +19 -p
}

function komentarz(){
echo "Komenda renice pozwala nam obniżyć lub zwiększyć priorytet danego procesu, renice ma zakres od -20 do 19, im mniejszy numer, tym większy priorytet ma dany proces."
}

logika $@
