#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Usuń jednym poleceniem całą strukturę katalogów dir2"
}

function wyswietlroz(){
echo '$ rm -r dir2'
}

function uruchomroz(){
rm -r dir1/src/*
}

function komentarz(){
echo "Funkcja rm usuwa wszystkie (*) pliki razem z katalogiem dir1 oraz wszystkimi jego podkatalogami"
}

logika $@
