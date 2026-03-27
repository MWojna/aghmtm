#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Sprawdź czy któryś z użytkowników jest zalogowany w systemie więcej niż jeden raz. Dla każdego takiego użytkownika należy wyświetlić jego identyfikator i listę terminali na których pracuje."
}

function wyswietlroz(){
echo '$ who | tr -s ' ' | cut -f1 -d ' ' | uniq -d'
}

function uruchomroz(){
who | tr -s ' ' | cut -f1 -d ' ' | uniq -d
}

function komentarz(){
echo "Uniq -d ignoruje pojedyncze dane."
}

logika $@
