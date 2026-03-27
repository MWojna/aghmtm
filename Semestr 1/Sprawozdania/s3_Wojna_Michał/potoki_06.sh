#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Wyświetl zawartość /etc/passwd w jednej linii."
}

function wyswietlroz(){
echo '$ cat /etc/passwd | tr -d '\n' '
}

function uruchomroz(){
cat /etc/passwd | tr -d '\n' 
}

function komentarz(){
echo "Komenda cat pozwala nam wyświetlać zawartość plików tekstowych."
}

logika $@
