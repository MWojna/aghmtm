#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Dla pliku plik.txt dodaj prawo wykonywania dla wszystkich użytkowników."
}

function wyswietlroz(){
echo '$ chmod go+x plik.txt'
}

function uruchomroz(){
chmod o+x plik.txt
}

function komentarz(){
echo "Chmod włuży do nadawania i odbierania praw dostępu, g - grupy, u - właściciela, a - wszystkich, +/- - dodaje/zabiera prawo dostępu"
}

logika $@
