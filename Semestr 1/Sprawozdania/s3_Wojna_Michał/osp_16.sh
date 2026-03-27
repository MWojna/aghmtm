#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Przenieś katalog dir1/src do katalogu domowego tworząc w ten sposób katalog src1"
}

function wyswietlroz(){
echo '$ mv dir1/src src1'
}

function uruchomroz(){
mv dir1/src src1
}

function komentarz(){
echo "mv pozwala nam przenieść plik, należy wpisać ścieżkę pliku, który chcemy rzenieść i jego nową lokalizację"
}

logika $@
