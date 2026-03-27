#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Napisz polecenie zliczające sumę znaków z pierwszych trzech linii pliku /etc/passwd."
}

function wyswietlroz(){
echo '$ head -n3 /etc/passwd | tr -d '\n' |  wc -c'
}

function uruchomroz(){
head -n3 /etc/passwd | tr -d '\n' |  wc -c 
}

function komentarz(){
echo "Komenda tr służy do usunięcia wybranych znaków (-d) bądź gdy się powtarzają, sprowadzenie ich do jednego (-s). Komenda wc liczy linijki (-l), słowa (c), lub słowa (w)."
}

logika $@
