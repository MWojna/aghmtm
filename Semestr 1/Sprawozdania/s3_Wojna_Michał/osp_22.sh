#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "W katalogu domowym utwórz plik o nazwie plik.txt i sprawdź jakie są prawa dostępu do niego."
}

function wyswietlroz(){
echo '$ touch plik.txt
$ ls -al plik.txt'
}

function uruchomroz(){
touch plik.txt
ls -al plik.txt
}

function komentarz(){
echo "Przełącznik -l przy ls pokazuje prawa dostępu do pliku, x - wykonanie, w - write, r - read"
}

logika $@
