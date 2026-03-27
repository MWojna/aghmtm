#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Sporządź statystykę praw dostępu (dla każdego z praw dostępu podaj ile razy zostało ono przydzielone)."
}

function wyswietlroz(){
echo '$ ls -al | cut -f1 -d' ' | sort | uniq -c'
}

function uruchomroz(){
ls -al | cut -f1 -d' ' | sort | uniq -c
}

function komentarz(){
echo "2>/dev/null powoduje, że wszytkie komunikaty o błędach zostają przekierowane do folderu /dev/null (kosz bez dna). Uniq -c liczy powtarzające się wartości, z czego wiemy ile występuje danego typu praw dostępu."
}

logika $@
