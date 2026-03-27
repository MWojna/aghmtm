#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Podaj posortowane wg nazwy trzy najmniejsze pliki w katalogu domowym."
}

function wyswietlroz(){
echo '$ ls -lp | tr -s ' ' | grep -v /| cut -f5,9 -d ' ' | sort -n | cut -f2 -d ' ' | sort | head -n4 | tail -n3'
}

function uruchomroz(){
ls -lp | tr -s ' ' | grep -v /| cut -f5,9 -d ' ' | sort -n | cut -f2 -d ' ' | sort | head -n4 | tail -n3
}

function komentarz(){
echo "Przełącznik -p na końcu każdego katalogu stawia /, po czym wykluczamy z wyszukiwanych danych katalogi nie biorąc ich pod uwagę (grep -v /)."
}

logika $@
