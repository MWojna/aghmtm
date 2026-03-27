#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Sprawdź status zakończenia procesu pgrep (program pgrep wywołany bez argumentu)."
}

function wyswietlroz(){
echo '$ pgrep
$ echo $?'
}

function uruchomroz(){
pgrep
echo $?
}

function komentarz(){
echo "By sprawdzić status zakończenia programu możemy użyć komendy echo $?, wszystkie wartości poza 0 oznaczają błąd."
}

logika $@
