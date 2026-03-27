#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Wyświetl nazwy tych użytkowników, którzy domyślnie używają innego interpretera niż bash."
}

function wyswietlroz(){
echo '$ cat /etc/passwd | cut -d: -f1,7 | grep -v bash | sort -ut: -k2 | tail -n3'
}

function uruchomroz(){
cat /etc/passwd | cut -d: -f1,7 | grep -v bash | sort -ut: -k2 | tail -n3
}

function komentarz(){
echo "Informacja o używanym przez danego użytkownika interpreterze znajduje się w folderze /etc/passwd. Sort -u sortuje alfabetycznie w jednej kolumnie."
}

logika $@
