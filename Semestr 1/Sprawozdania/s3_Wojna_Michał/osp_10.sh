#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Skopiuj jednym poleceniem wszystkie pliki z katalogu domowego z rozszerzeniem .txt do katalogu dir1"
}

function wyswietlroz(){
echo '$ cp ~/*.txt dir1'
}

function uruchomroz(){
cp ~/*.txt dir1
}

function komentarz(){
echo "Komenda cp pozwala na kopiowanie plików, kopiujemy wszytkie pliki z katalogu domowego (~) z rozszerzeniem .txt (* zastępuje dowolną ilość dowolnych znaków) do katalogu dir1"
}

logika $@
