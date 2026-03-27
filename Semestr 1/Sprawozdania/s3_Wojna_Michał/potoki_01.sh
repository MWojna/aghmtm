#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Skopiuj plik /etc/passwd do katalogu domowego i zmień jego nazwę na tekst1."
}

function wyswietlroz(){
echo '$ cp /etc/passwd ~/tekst1'
}

function uruchomroz(){
cp /etc/passwd ~/tekst1
}

function komentarz(){
echo "Cp służy do wykonywania kopii plików/katalogów"
}

logika $@
