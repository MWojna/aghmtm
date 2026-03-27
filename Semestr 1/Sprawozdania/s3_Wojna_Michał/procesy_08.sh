#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "W środowisku graficznym uruchom “Menedżer zadań” - program Xfce-taskmanager. Sprawdź identyfikator procesu init."
}

function wyswietlroz(){
echo '$ Xfce-taskmanager'
}

function uruchomroz(){
Xfce-taskmanager
}

function komentarz(){
echo "Komenda Xfce-taskmanager jest podobna w działaniu do komendy top."
}

logika $@
