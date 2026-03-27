#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Skopiuj wszystkie pliki zwykłe o rozmiarze pomiędzy 10 a 100 bajtów z katalogu /usr/bin do katalogu dir1/bin (wykorzystując polecenie find z parametrem -exec)."
}

function wyswietlroz(){
echo '$ find /usr/bin -type f -size +10c -size -100c -exec cp {} ~/dir1/bin/ \;'
}

function uruchomroz(){
find /usr/bin -type f -size +10c -size -100c -exec cp {} ~/dir1/bin/ \;
}

function komentarz(){
echo "Ta komenda find wyszukuje pliki o rozmiarze od 10 do 100 bajtów i przenosi je do katalogu 'dir1/bin'. Ważne jest, aby pamiętać o zakończeniu opcji -exec poprzez znak "\;"."
}

logika $@
