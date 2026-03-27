#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Wyświetl listę praw dostępu do plików w aktualnym katalogu, ich rozmiar i nazwę."
}

function wyswietlroz(){
echo '$ ls -al | grep ^- | tr -s ' ' | cut -f1,5,9 -d ' ''
}

function uruchomroz(){
ls -al | grep ^- | tr -s ' ' | cut -f1,5,9 -d ' ' 
}

function komentarz(){
echo "Grep ZMIENNA wyświetla tylko wyniki, które w swojej nazwie zawierają ZMIENNĄ, jeżeli użyjemy grepa z opcją -v, wyświetlone zostaną wyniki nie zawierające ZMIENNEJ. Sort można używać z przełącznikami (domyślne jest sortowanie numeryczne), -r sortuje odwrotnie, -b ignoruje spacje na początku, kLICZBA przy sortowaniu bierze pod uwagę LICZBA kolumnę, -t pozwala zmienić somyślny separator kolumn."
}

logika $@
