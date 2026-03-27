#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "W katalogu dir1 utwórz jednym poleceniem strukturę katalogów src/test/moj"
}

function wyswietlroz(){
echo '$ mkdir -p dir1/src/test/moj'
}

function uruchomroz(){
mkdir -p dir1/src/test/moj
}

function komentarz(){
echo "Przełącznik -p pozwala utworzyć strukturę katalogów, katalog moj znajduje sie w katalogu test, który znajduje się w katalogu src, który znajduje się w katalogu dir1"
}

logika $@
