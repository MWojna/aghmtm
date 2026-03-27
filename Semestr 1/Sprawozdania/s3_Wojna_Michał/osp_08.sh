#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Usuń jednym poleceniem całą strukturę katalogów test/moj"
}

function wyswietlroz(){
echo '$ rm -r dir1/src/*'
}

function uruchomroz(){
rm -r dir1/src/*
}

function komentarz(){
echo "Komenda rm z przełącznikiem -r wymusza usunięcie wszytkich plików oraz katalogów w dir1/src/ mimo iż katalog test nie jest pusty"
}

logika $@
