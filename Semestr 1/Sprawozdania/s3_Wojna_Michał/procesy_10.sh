#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Zapoznaj się z listą sygnałów na stronie man pomocy systemowej signal(7)."
}

function wyswietlroz(){
echo '$ man 7 signal'
}

function uruchomroz(){
man7 signal
}

function komentarz(){
echo "Komenda man 7 signal otwiera pomoc systemową na stronie 7 dla komendy signal"
}

logika $@
