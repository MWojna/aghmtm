#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Skopiuj całą strukturę katalogów dir1 tworząc analogiczną strukturę o nazwie dir2"
}

function wyswietlroz(){
echo '$ cp -pr dir1 dir1'
}

function uruchomroz(){
cp -pr dir1 dir1
}

function komentarz(){
echo "Komenda cp pozwala na stworzenie kopii plików i katalogów pod inną nazwą a przełączniki -pr pozwalają nam wymusić skopiowanie całej
(niepustej) struktury katalogów dir1 pod nową nazwą dir2"
}

logika $@
