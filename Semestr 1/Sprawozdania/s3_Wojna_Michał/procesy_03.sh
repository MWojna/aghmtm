#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Zaloguj się do systemu kilkukrotnie poprzez wirtualne konsole lub otwierając nowe okno terminala w środowisku graficznym. Sprawdź nazwę terminala, na którym pracujesz. Podpowiedź (jak to zrobić - jtz.) można znaleźć w tty(1)."
}

function wyswietlroz(){
echo '$ tty'
}

function uruchomroz(){
tty
}

function komentarz(){
echo "Za pomocą komendy tty możemy sprawdzić nazwę terminala, na którym pracujemy, jeżeli otworzymy kolejne okno terminala, nazwa nowo otworzonego terminala będzie inna."
}

logika $@
