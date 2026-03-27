#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Wyświetl listę plików z aktualnego katalogu, zamieniając wszystkie małe litery na duże."
}

function wyswietlroz(){
echo '$ ls . | tr '[:lower:]' '[:upper:]''
}

function uruchomroz(){
ls . | tr '[:lower:]' '[:upper:]' 
}

function komentarz(){
echo "Komenda tr służy do usunięcia wybranych znaków (-d) bądź gdy się powtarzają, sprowadzenie ich do jednego (-s). Komenda wc liczy linijki (-l), słowa (c), lub słowa (w)."
}

logika $@
