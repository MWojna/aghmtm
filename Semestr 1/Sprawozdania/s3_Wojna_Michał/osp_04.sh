#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Wyświetl zawartość katalogu domowego."
}

function wyswietlroz(){
echo '$ ls ~'
}

function uruchomroz(){
ls ~
}

function komentarz(){
echo "Komenda ls wykonana w katalogu domowym użytkownika wyświetla jego zawartość"
}

logika $@
