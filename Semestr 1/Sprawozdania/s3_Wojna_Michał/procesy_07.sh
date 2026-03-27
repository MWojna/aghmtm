#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Obejrzyj listę procesów sortując ją wg stopnia zajętości procesora i ilości zajętej pamięci, jtz.: top(1)."
}

function wyswietlroz(){
echo '$ top'
}

function uruchomroz(){
top
}

function komentarz(){
echo "Komenda top wyświetla listę procesów z ich obciążeniami systemu, aktualizującą się co 1s. przy pomocy wciśnięcia shift+c procesy można posortować po ich użyciu procesora, a shift+m sortuje według ilości pamięci ram zajmowanej przez procesy."
}

logika $@
