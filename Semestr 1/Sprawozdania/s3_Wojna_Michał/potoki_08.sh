#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Zlicz wszystkie pliki znajdujące się w katalogu /etc i jego podkatalogach."
}

function wyswietlroz(){
echo '$ find /etc/ -type f 2>/dev/null | wc -l'
}

function uruchomroz(){
find /etc/ -type f 2>/dev/null | wc -l 
}

function komentarz(){
echo "Komenda tr służy do usunięcia wybranych znaków (-d) bądź gdy się powtarzają, sprowadzenie ich do jednego (-s). Komenda wc liczy linijki (-l), słowa (c), lub słowa (w)."
}

logika $@
