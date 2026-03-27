#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Utwórz katalog dir1 w katalogu domowym."
}

function wyswietlroz(){
echo '$ mkdir ~/dir1'
}

function uruchomroz(){
mkdir ~/dir1
}

function komentarz(){
echo "Komenda mkdir pozwala na utworzenie katalogu, ~/dir1 oznacza, że twożymy katalog o nazwie dir1 w katalogu domowym."
}

logika $@
