#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Wyświetl aktywne sesje, (jtz.: komenda jobs)."
}

function wyswietlroz(){
echo '$ jobs'
}

function uruchomroz(){
jobs
}

function komentarz(){
echo "Przy użyciu komendy jobs możemy zobaczyć pracujące w tle programy"
}

logika $@
