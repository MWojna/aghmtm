#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Podaj liczbę plików użytkownika student."
}

function wyswietlroz(){
echo '$ find / -type f -user student 2>/dev/null | wc -l'
}

function uruchomroz(){
find / -type f -user student 2>/dev/null | wc -l
}

function komentarz(){
echo "2>/dev/null powoduje, że wszytkie komunikaty o błędach zostają przekierowane do folderu /dev/null (kosz bez dna). Uniq -c liczy powtarzające się wartości, z czego wiemy ile występuje danego typu praw dostępu."
}

logika $@
