#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Wyświetl zawartość 3 największych podkatalogów katalogu bieżącego."
}

function wyswietlroz(){
echo '$ ls -lp | tr -s ' ' | grep /| cut -f5,9 -d ' ' | sort -nr | cut -f2 -d ' ' | head -n 3 | xargs ls'
}

function uruchomroz(){
ls -lp | tr -s ' ' | grep /| cut -f5,9 -d ' ' | sort -nr | cut -f2 -d ' ' | head -n 3 | xargs ls
}

function komentarz(){
echo "Xargs ls bierze wyniki poprzedniej komendy i wyświetla ich zawartość (ls)."
}

logika $@
