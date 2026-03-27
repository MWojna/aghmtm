#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Usuń wszystkie pliki z katalogu dir1/src"
}

function wyswietlroz(){
echo '$ rm -r dir1/src/*'
}

function uruchomroz(){
rm -r dir1/src/*
}

function komentarz(){
echo "Funkcja rm usuwa wszystkie (*) pliki z katalogu dir1/src/"
}

logika $@
