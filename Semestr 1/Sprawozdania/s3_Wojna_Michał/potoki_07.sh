#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Za pomocą filtru tr wykonaj modyfikację pliku tekst3, polegającą na umieszczeniu każdego słowa w osobnej linii."
}

function wyswietlroz(){
echo '$ cat teksttest | tr ' ' '\n' > tekst3'
}

function uruchomroz(){
cat teksttest | tr ' ' '\n' > tekst3 
}

function komentarz(){
echo "Komenda tr służy do usunięcia wybranych znaków (-d) bądź gdy się powtarzają, sprowadzenie ich do jednego (-s). Komenda wc liczy linijki (-l), słowa (c), lub słowa (w)."
}

logika $@
