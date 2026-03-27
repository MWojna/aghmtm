#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Korzystając z programu find znajdź wszystkie katalogi o nazwie bin, które znajdują się w katalogu /usr"
}

function wyswietlroz(){
echo '$ find /usr -type d -name bin'
}

function uruchomroz(){
find /usr -type d -name bin
}

function komentarz(){
echo "komenda find przeprowadza wyszukiwanie w czasie rzeczywistym, nie bazując na wcześniej przygotowanej bazie danych. Dodanie opcji -type d ogranicza wyszukiwanie tylko do katalogów."
}

logika $@
