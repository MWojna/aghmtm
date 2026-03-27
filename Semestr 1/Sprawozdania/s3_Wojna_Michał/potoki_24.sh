#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Wyświetl posortowane nazwy plików nagłówkowych w plikach nagłówkowych znajdujących się w katalogu /usr/include/"
}

function wyswietlroz(){
echo '$ find /usr/include/ -type f -name *.h -exec grep ^#include {} \; | tr -s ' ' | cut -f2 -d ' ' | sort'
}

function uruchomroz(){
find /usr/include/ -type f -name *.h -exec grep ^#include {} \; | tr -s ' ' | cut -f2 -d ' ' | sort
}

function komentarz(){
echo "Pliki nagłówkowe mają rozszerzenie .h"
}

logika $@
