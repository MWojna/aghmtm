#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Podaj nazwy trzech użytkowników o największej liczbie uruchomionych procesów."
}

function wyswietlroz(){
echo '$ ps -ef | tr -s ' ' | cut -f1 -d ' ' | sort | uniq -c | sort -r | head -n3'
}

function uruchomroz(){
ps -ef | tr -s ' ' | cut -f1 -d ' ' | sort | uniq -c | sort -r | head -n3
}

function komentarz(){
echo "Opcja -e przy ls powoduje wyświetlanie nazwy właściciela procesu."
}

logika $@
