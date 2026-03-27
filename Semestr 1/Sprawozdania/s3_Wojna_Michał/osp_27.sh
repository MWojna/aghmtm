#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Utwórz dowiązanie do pliku plik.txt o nazwie plik2.txt w katalogu domowym."
}

function wyswietlroz(){
echo '$ ln plik.txt plik2.txt'
}

function uruchomroz(){
ln plik.txt plik2.txt
}

function komentarz(){
echo "Komenda ln służy do tworzenia dowiązań twardych i symbolicznych między plikami lub katalogami. Tworzymy dowiązanie twarde, łącząc plik.txt z plik2.txt, umożliwiając tym samym odwołanie do pliku."
}

logika $@
