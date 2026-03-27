#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Zbadaj działanie poleceń killall(1) i pkill(1) i opisz do czego one służą oraz kiedy mogą być pomocne."
}

function wyswietlroz(){
echo '$ man killall
$ man pkill'
}

function uruchomroz(){
man killall; man pkill
}

function komentarz(){
echo "Zarówno pkill jak i killall jako argument mogą użyć nazwy procesu, ale killall dodatkowo posiada więcej opcji oraz może jakończyć wszystkie instancje danego procesu wraz z jego procesami potomnymi.[1]"
}

logika $@
