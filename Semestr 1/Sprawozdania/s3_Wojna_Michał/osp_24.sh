#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Dla pliku plik.txt odejmij prawo zapisu dla właściciela oraz sprawdź efekt działania tej komendy."
}

function wyswietlroz(){
echo '$ chmod u-w plik.txt'
}

function uruchomroz(){
chmod g+w plik.txt
}

function komentarz(){
echo "Chmod włuży do nadawania i odbierania praw dostępu, g - grupy, u - właściciela, a - wszystkich, +/- - dodaje/zabiera prawo dostępu"
}

logika $@
