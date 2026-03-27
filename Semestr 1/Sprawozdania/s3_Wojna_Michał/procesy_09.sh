#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Wyświetl identyfikatory wszystkich swoich interpreterów poleceń, jtz: pgrep(1)."
}

function wyswietlroz(){
echo '$ pgrep bash'
}

function uruchomroz(){
pgrep bash
}

function komentarz(){
echo "Za pomocą komendy pgrep bash możemy zobaczyć PID naszych wszystkich interpreterów poleceń."
}

logika $@
