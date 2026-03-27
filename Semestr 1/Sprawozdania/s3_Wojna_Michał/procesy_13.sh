#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Uruchom proces sleep w tle. Przełącz go do pracy w trybie pierwszoplanowym."
}

function wyswietlroz(){
echo '$ sleep 15 &
$ fg'
}

function uruchomroz(){
sleep 15 &
fg
}

function komentarz(){
echo "Poprzez dodanie po komendzie znaku &, komenda te będzie działać w tle, w tym przypadku komenda sleep zostanie „wywołana” dopiero gdzy przywrócimy ją do trybu pracy w pierwszym planie poprzez komendę fg."
}

logika $@
