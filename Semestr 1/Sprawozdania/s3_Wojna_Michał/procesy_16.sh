#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Wznów pracę edytora vim do trybu pierwszoplanowego komendą fg, następnie znów przełącz go do pracy w tle (jtz.: komenda bg)."
}

function wyswietlroz(){
echo '$ fg 1
$ bg 1'
}

function uruchomroz(){
fg 1
bg 1
}

function komentarz(){
echo "Możemy jeden z vim'ów przywrócić do pracy w trybie pierwszoplanowym przy użyciu komendy fg."
}

logika $@
