#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Wyświetl hierarchię procesów, jtz.: pstree(1)."
}

function wyswietlroz(){
echo '$ pstree'
}

function uruchomroz(){
pstree
}

function komentarz(){
echo "Za pomocą komendy pstre możemy zobaczyć graficzne odwzorowanie struktury aktywnych procesów."
}

logika $@
