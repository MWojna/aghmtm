#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Wyświetl po 5 pierwszych linii wszystkich plików w swoim katalogu domowym w taki sposób, aby nie były wyświetlane ich nazwy."
}

function wyswietlroz(){
echo '$ head ~/* -n 5 -q 2>/dev/null'
}

function uruchomroz(){
head ~/* -n 5 -q 2>/dev/null
}

function komentarz(){
echo "Komenda head pozwala nam zmniejszyć ilość wyświetlanych wyników -n oznacza że ograniczamy wyniki do pierwszych x linijek."
}

logika $@
