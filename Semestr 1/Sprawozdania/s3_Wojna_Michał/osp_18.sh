#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Przy pomocy programu locate znajdź wszystkie pozycje, które posiadają w nazwie słowo mozilla i znajdują się w podkatalogach katalogu /usr
1"
}

function wyswietlroz(){
echo '$ locate /usr/*mozilla*'
}

function uruchomroz(){
locate /usr/*mozilla*
}

function komentarz(){
echo "Komenda locate służy do wyszukiwania plików zawierających frazę 'mozilla', wyświetlając listę plików wraz z ich ścieżkami"
}

logika $@
