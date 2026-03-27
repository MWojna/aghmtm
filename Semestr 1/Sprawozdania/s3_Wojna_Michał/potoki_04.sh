#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Wyświetl linie o numerach 3, 4 i 5 z pliku /etc/passwd."
}

function wyswietlroz(){
echo '$ head -n 5 /etc/passwd | tail -n3'
}

function uruchomroz(){
head -n 5 /etc/passwd | tail -n3
}

function komentarz(){
echo "Komenda head pozwala nam zmniejszyć ilość wyświetlanych wyników -n oznacza że ograniczamy wyniki do pierwszych x linijek."
}

logika $@
