#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Skopiuj jednym poleceniem wszystkie pliki z katalogu domowego z rozszerzeniem .c do katalogu dir/src"
}

function wyswietlroz(){
echo '$ cp ~/*.c dir1/src'
}

function uruchomroz(){
cp ~/*.c dir1/src
}

function komentarz(){
echo "Komenda cp pozwala na kopiowanie plików, kopiujemy wszytkie pliki z katalogu domowego (~) z rozszerzeniem .c (* zastępuje dowolną ilość dowolnych znaków) do katalogu dir1/src"
}

logika $@
