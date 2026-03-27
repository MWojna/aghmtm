#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Dla pliku plik.txt przywróć oryginalne prawa korzystając z notacji numerycznej.
"
}

function wyswietlroz(){
echo '$ chmod 664 plik.txt'
}

function uruchomroz(){
chmod 664 plik.txt
}

function komentarz(){
echo "Chmod włuży do nadawania i odbierania praw dostępu, g - grupy, u - właściciela, a - wszystkich, +/- - dodaje/zabiera prawo dostępu"
}

logika $@
