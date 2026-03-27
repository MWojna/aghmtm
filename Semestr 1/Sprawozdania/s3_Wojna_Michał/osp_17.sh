#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Przy pomocy programu locate znajdź wszystkie pozycje, które posiadają w nazwie słowo mozilla"
}

function wyswietlroz(){
echo '$ locate *mozilla*'
}

function uruchomroz(){
locate *mozilla*
}

function komentarz(){
echo "Komenda locate służy do wyszukiwania plików zawierających frazę 'mozilla', wyświetlając listę plików wraz z ich ścieżkami"
}

logika $@
