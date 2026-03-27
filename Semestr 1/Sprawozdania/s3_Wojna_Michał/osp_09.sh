#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Utwórz w katalogu domowym pliki o dowolnych nazwach z rozszerzeniami .txt .c"
}

function wyswietlroz(){
echo '$ touch 1.txt 2.c'
}

function uruchomroz(){
touch 1.txt 2.c
}

function komentarz(){
echo "Komenda touch pozwala utworzyć 1 lub więcej plików, tutaj tworzę plik 1.txt oraz plik 2.c"
}

logika $@
