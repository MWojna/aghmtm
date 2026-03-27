#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Uruchom w tle wyszukiwanie w całym systemie plików o nazwach pasujących do wzorca “*user*”, błędy przekieruj na urządzenie puste (/dev/null), wyniki do pliku wyniki.txt. Uruchamiając, obniż priorytet tego polecenia do najniższego."
}

function wyswietlroz(){
echo '$ nice -n 19 find -type f -name '*user*' | 2>/dev/null | 1>wyniki.txt'
}

function uruchomroz(){
nice -n 19 find -type f -name '*user*' | 2>/dev/null | 1>wyniki.txt
}

function komentarz(){
echo "remice pozwala zmienić priorytet procesu"
}

logika $@
