#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Przejrzyj pomoc systemową dla wszystkich poleceń używanych podczas zajęć."
}

function wyswietlroz(){
echo '$ history'
}

function uruchomroz(){
history
}

function komentarz(){
echo "History wyświetla wszystkie użyte w tej sesji polecenia, a man pokazuje instrukcję systemową do wybranego polecenia"
}

logika $@
