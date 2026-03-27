#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Zmień nazwę dowolnego pliku w katalogu dir1"
}

function wyswietlroz(){
echo '$ mv dir1/1.txt dir1/3.txt'
}

function uruchomroz(){
mv dir1/1.txt dir1/3.txt
}

function komentarz(){
echo "mv pozwala nam zmienić nazwę pliku, jeżeli nie podamy nowej ścieżki docelowej, a podamy nową nazwę pliku/katalogu"
}

logika $@
