#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Korzystając z programu find znajdź wszystkie pliki, które mają w nazwie słowo mozilla i znajdują się w podkatalogach katalogu /usr"
}

function wyswietlroz(){
echo '$ find /usr -type f -name *mozilla*'
}

function uruchomroz(){
find /usr -type f -name *mozilla*
}

function komentarz(){
echo "komenda find przeprowadza wyszukiwanie w czasie rzeczywistym, nie bazując na wcześniej przygotowanej bazie danych. Dodanie opcji -type f ogranicza wyszukiwanie tylko do plików."
}

logika $@
