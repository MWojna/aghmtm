#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Dla pliku plik.txt dodaj prawo zapisu dla grupy, po czym sprawdź jakie teraz są prawa dostępu."
}

function wyswietlroz(){
echo '$ chmod g+w plik.txt'
}

function uruchomroz(){
chmod g-w plik.txt
}

function komentarz(){
echo "Chmod włuży do nadawania i odbierania praw dostępu, g - grupy, u - właściciela, a - wszystkich, +/- - dodaje/zabiera prawo dostępu"
}

logika $@
