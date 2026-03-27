#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Wyświetl zawartość pliku /etc/passwd posortowaną najpierw wg numerów GID w kolejności od największego do najmniejszego, a następnie UID."
}

function wyswietlroz(){
echo '$ cat /etc/passwd | sort -k4 -k3 -nt:'
}

function uruchomroz(){
cat /etc/passwd | sort -k4 -k3 -nt:
}

function komentarz(){
echo "Grep ZMIENNA wyświetla tylko wyniki, które w swojej nazwie zawierają ZMIENNĄ, jeżeli użyjemy grepa z opcją -v, wyświetlone zostaną wyniki nie zawierające ZMIENNEJ. Sort można używać z przełącznikami (domyślne jest sortowanie numeryczne), -r sortuje odwrotnie, -b ignoruje spacje na początku, kLICZBA przy sortowaniu bierze pod uwagę LICZBA kolumnę, -t pozwala zmienić somyślny separator kolumn."
}

logika $@
