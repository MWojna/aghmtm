#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Uruchom sesję edytora vim i wysyłaj komendą kill kolejne sygnały do tego procesu. Użyj sygnałów: HUP, INT, TERM, QUIT, KILL, STOP, CONT."
}

function wyswietlroz(){
echo '$ vim
$ pgrep vim
$ kill 755'
}

function uruchomroz(){
vim; kill 755
}

function komentarz(){
echo "Po otwarciu edytora vim, możemy wysyłać do niego sygnały (takie jak np. kill) z innego terminala, należy wtedy znać PID edytora vim, do którego chcemy przesyłać sygnały, który można sprawdzićza pomocą komendy pgrep."
}

logika $@
