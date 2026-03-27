#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Sprawdź status zakończenia procesu ps."
}

function wyswietlroz(){
echo '$ ps
$ echo $?'
}

function uruchomroz(){
ps
echo $?
}

function komentarz(){
echo "By sprawdzić status zakończenia programu możemy użyć komendy echo $?, wszystkie wartości poza 0 oznaczają błąd."
}

logika $@
