#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Wyświetl zawartość podstawowych katalogów w systemie (np. /etc, /home, /usr, /dev)."
}

function wyswietlroz(){
echo '$ ls /usr'
}

function uruchomroz(){
ls /usr
}

function komentarz(){
echo "Komenda ta wyświetla listę plików i podkatalogów w ścieżce systemowej /usr, która, zgodnie z opisem hier(7), zawiera pliki systemowe użytkownika."
}

logika $@
