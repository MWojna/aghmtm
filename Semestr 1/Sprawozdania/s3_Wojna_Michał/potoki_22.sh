#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "W katalogu users utwórz podkatalogi 5 użytkownikom ze swojego roku i dodatkowo zapisz w pliku o nazwie users.txt posortowaną listę tych użytkowników."
}

function wyswietlroz(){
echo '$ mkdir users; cd users; mkdir 1; mkdir 2; mkdir 3; mkdir 4; mkdir 5'
}

function uruchomroz(){
mkdir users
cd users
mkdir 1
mkdir 2
mkdir 3
mkdir 4
mkdir 5
}

function komentarz(){
echo "Znak ; pozwala na wydanie wielu komend na raz w danej kolejności."
}

logika $@
