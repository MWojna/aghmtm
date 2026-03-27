#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Sprawdź własny identyfikator oraz identyfikator grup, do których należysz."
}

function wyswietlroz(){
echo '$ id'
}

function uruchomroz(){
id
}

function komentarz(){
echo "Sprawdzenie własnego identyfikatora oraz identyfikatora grupy realizuje się komendą id"
}

logika $@
