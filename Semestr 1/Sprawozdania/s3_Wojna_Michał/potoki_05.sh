#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Wyświetl linie o numerach 7, 6 i 5 od końca pliku /etc/passwd."
}

function wyswietlroz(){
echo '$ tail -n7 /etc/passwd | head -n3 | tac'
}

function uruchomroz(){
tail -n7 /etc/passwd | head -n3 | tac
}

function komentarz(){
echo "Komenda ta wyświetla listę plików i podkatalogów w ścieżce systemowej /usr, która, zgodnie z opisem hier(7), zawiera pliki systemowe użytkownika."
}

logika $@
