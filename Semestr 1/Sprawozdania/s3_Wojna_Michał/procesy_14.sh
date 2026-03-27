#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Wstrzymaj sesję edytora vim  (kombinacja Ctrl-z), uruchom nową sesję i wstrzymaj ją również."
}

function wyswietlroz(){
echo '$ vim
$ vim'
}

function uruchomroz(){
$ vim
$ vim
}

function komentarz(){
echo "Przy użyciu komendy vim dwukrotnie otwieramy i zatrzymujemy (ctrl+z) edytor vim."
}

logika $@
