#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Wyświetl statystykę używanych komend (bez argumentów) w postaci posortowanej listy: liczba_użyć komenda (jtz: należy użyć polecenia history)."
}

function wyswietlroz(){
echo '$ history | tr -s ' ' | cut -f3 -d ' ' | sort | uniq -c | sort -r'
}

function uruchomroz(){
history | tr -s ' ' | cut -f3 -d ' ' | sort | uniq -c | sort -r
}

function komentarz(){
echo "Komenda history wyświetla  wszystkie użyte w aktywnej sesji polecenia wydane przez użytkownika."
}

logika $@
